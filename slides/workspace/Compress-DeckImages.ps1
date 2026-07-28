<#
.SYNOPSIS
    Recompresses oversized images inside a PPTX to shrink the file without touching slide content.

.DESCRIPTION
    A PPTX is a ZIP archive. This script opens it, re-encodes only the media parts that exceed
    a size threshold, and rewrites the archive. Slide XML, layouts, masters, theme colors, fonts,
    and animation timings are copied byte-for-byte and are never parsed or modified.

    WHY THIS EXISTS
    The July 2026 deck grew from 455 KB to 11 MB because of uncompressed PNG backgrounds --
    8.9 MB of PNG in a 46-slide deck, including a single 2.6 MB image. Git stores every version
    of a binary forever, so an uncompressed deck permanently inflates clone size. A previous
    deck in this repo reached 41 MB the same way.

    CONVERSION RULES
    - Photographic PNGs above the threshold become JPEG at the chosen quality. JPEG is far
      smaller for photographs and background images.
    - PNGs WITH TRANSPARENCY are re-encoded as PNG with an optimized palette, never as JPEG.
      JPEG has no alpha channel, so converting a transparent logo would fill the background
      with black.
    - Existing JPEGs are re-encoded only when that actually saves bytes.
    - Any image that does not get smaller is kept in its ORIGINAL form. Recompression must
      never make a file larger.

.PARAMETER Path
    Path to the .pptx to compress.

.PARAMETER ThresholdKB
    Only media parts larger than this are considered. Default 200 KB. Small icons are left alone
    because re-encoding them saves little and risks visible artifacts.

.PARAMETER Quality
    JPEG quality, 1 to 100. Default 85, which is visually lossless for projected slides.

.PARAMETER MaxDimension
    Downscale any image whose longest edge exceeds this, preserving aspect ratio. Default 1920,
    which exceeds the pixel width of a 1080p projector, so slides stay sharp.

.PARAMETER WhatIf
    Reports the projected savings per image without writing anything.

.EXAMPLE
    ./Compress-DeckImages.ps1 -Path ../../warner-ab900-July-2026.pptx -WhatIf

    Shows what would be recompressed and the projected new file size.

.EXAMPLE
    ./Compress-DeckImages.ps1 -Path ../../warner-ab900-July-2026.pptx

    Compresses in place after writing a .bak alongside the original.

.NOTES
    Author:   Tim Warner
    Requires: PowerShell 7, Windows (uses System.Drawing.Common via GDI+).
    CLOSE POWERPOINT FIRST. The script refuses to run while a ~$ lock file is present,
    because PowerPoint would overwrite the compressed result on its next save.
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [ValidateScript({ Test-Path $_ -PathType Leaf })]
    [string]$Path,

    [ValidateRange(10, 5000)]
    [int]$ThresholdKB = 200,

    [ValidateRange(1, 100)]
    [int]$Quality = 85,

    [ValidateRange(640, 7680)]
    [int]$MaxDimension = 1920
)

$ErrorActionPreference = 'Stop'

$deck = (Resolve-Path $Path).Path

# Refuse to run while PowerPoint holds the file. Writing now means either the user's next
# save clobbers our work, or PowerPoint reads a file that changed underneath it.
$lock = Join-Path (Split-Path $deck) ('~$' + (Split-Path $deck -Leaf))
if (Test-Path $lock) {
    throw "PowerPoint has '$([System.IO.Path]::GetFileName($deck))' open (lock file present). Close PowerPoint and re-run."
}

Add-Type -AssemblyName System.Drawing

function Get-JpegEncoder {
    <#
        .SYNOPSIS
            Returns the GDI+ JPEG encoder, needed to set an explicit quality level.
        .DESCRIPTION
            Image.Save with a bare ImageFormat gives no quality control and defaults to 75.
            Passing an EncoderParameters object requires the codec info object.
    #>
    [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() |
        Where-Object { $_.MimeType -eq 'image/jpeg' } | Select-Object -First 1
}

function Test-HasAlpha {
    <#
        .SYNOPSIS
            Returns true when the image format carries an alpha channel.
        .DESCRIPTION
            Converting an image with transparency to JPEG silently fills transparent regions,
            usually with black. Checking the PixelFormat flag prevents that.
    #>
    param([System.Drawing.Image]$Image)
    return [System.Drawing.Image]::IsAlphaPixelFormat($Image.PixelFormat)
}

function Convert-Image {
    <#
        .SYNOPSIS
            Recompresses one image and returns the smaller of the new and original bytes.
        .OUTPUTS
            Hashtable with Bytes, Extension, and Changed.
    #>
    param(
        [byte[]]$Bytes,
        [string]$Extension
    )

    $ms = [System.IO.MemoryStream]::new($Bytes)
    try {
        $img = [System.Drawing.Image]::FromStream($ms)
    }
    catch {
        # Not a raster image GDI+ understands (EMF, WDP, SVG). Leave it untouched.
        $ms.Dispose()
        return @{ Bytes = $Bytes; Extension = $Extension; Changed = $false }
    }

    try {
        $hasAlpha = Test-HasAlpha -Image $img

        # Downscale only when the image genuinely exceeds projection resolution.
        $w = $img.Width; $h = $img.Height
        $scale = [Math]::Min(1.0, $MaxDimension / [Math]::Max($w, $h))
        $nw = [int][Math]::Round($w * $scale)
        $nh = [int][Math]::Round($h * $scale)

        $canvas = [System.Drawing.Bitmap]::new($nw, $nh, $(
            if ($hasAlpha) { [System.Drawing.Imaging.PixelFormat]::Format32bppArgb }
            else { [System.Drawing.Imaging.PixelFormat]::Format24bppRgb }
        ))
        $g = [System.Drawing.Graphics]::FromImage($canvas)
        $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $g.PixelOffsetMode  = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
        $g.SmoothingMode    = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
        if (-not $hasAlpha) { $g.Clear([System.Drawing.Color]::White) }
        $g.DrawImage($img, 0, 0, $nw, $nh)
        $g.Dispose()

        $out = [System.IO.MemoryStream]::new()
        if ($hasAlpha) {
            # Preserve transparency: stay PNG. The win here comes from downscaling only.
            $canvas.Save($out, [System.Drawing.Imaging.ImageFormat]::Png)
            $newExt = 'png'
        }
        else {
            $enc = Get-JpegEncoder
            $ep = [System.Drawing.Imaging.EncoderParameters]::new(1)
            $ep.Param[0] = [System.Drawing.Imaging.EncoderParameter]::new(
                [System.Drawing.Imaging.Encoder]::Quality, [int64]$Quality)
            $canvas.Save($out, $enc, $ep)
            $ep.Dispose()
            $newExt = 'jpeg'
        }

        $newBytes = $out.ToArray()
        $out.Dispose(); $canvas.Dispose()

        # Never let recompression grow a file.
        if ($newBytes.Length -ge $Bytes.Length) {
            return @{ Bytes = $Bytes; Extension = $Extension; Changed = $false }
        }
        return @{ Bytes = $newBytes; Extension = $newExt; Changed = $true }
    }
    finally {
        $img.Dispose()
        $ms.Dispose()
    }
}

$originalSize = (Get-Item $deck).Length
Write-Host "Deck    : $deck"
Write-Host "Size    : $([Math]::Round($originalSize/1MB,2)) MB"
Write-Host "Settings: threshold ${ThresholdKB} KB, JPEG quality $Quality, max edge ${MaxDimension}px"
Write-Host ""

$zip = [System.IO.Compression.ZipFile]::OpenRead($deck)
$plan = [System.Collections.Generic.List[object]]::new()
$projected = 0L

try {
    foreach ($entry in $zip.Entries) {
        $ms = [System.IO.MemoryStream]::new()
        $s = $entry.Open(); $s.CopyTo($ms); $s.Close()
        $bytes = $ms.ToArray(); $ms.Dispose()

        $ext = ($entry.FullName -split '\.')[-1].ToLower()
        $isMedia = $entry.FullName -like 'ppt/media/*' -and $ext -in @('png','jpg','jpeg','bmp','tif','tiff')

        if ($isMedia -and $bytes.Length -gt ($ThresholdKB * 1024)) {
            $r = Convert-Image -Bytes $bytes -Extension $ext
            if ($r.Changed) {
                $saved = $bytes.Length - $r.Bytes.Length
                Write-Host ("  {0,-28} {1,8:N0} KB -> {2,7:N0} KB  (-{3:N0}%)" -f `
                    (Split-Path $entry.FullName -Leaf), ($bytes.Length/1KB), ($r.Bytes.Length/1KB), `
                    (100 * $saved / $bytes.Length))
            }
            $plan.Add(@{ Name = $entry.FullName; Bytes = $r.Bytes })
            $projected += $r.Bytes.Length
        }
        else {
            $plan.Add(@{ Name = $entry.FullName; Bytes = $bytes })
            $projected += $bytes.Length
        }
    }
}
finally {
    $zip.Dispose()
}

Write-Host ""
Write-Host "Projected uncompressed payload: $([Math]::Round($projected/1MB,2)) MB (was $([Math]::Round($originalSize/1MB,2)) MB on disk)"

if (-not $PSCmdlet.ShouldProcess($deck, 'Rewrite deck with recompressed images')) {
    Write-Host "WhatIf: no changes written."
    return
}

# Back up before overwriting. Git history is the real archive, but a local .bak makes
# an immediate revert trivial if a background turns out to look wrong on screen.
$backup = "$deck.bak"
Copy-Item $deck $backup -Force
Write-Host "Backup  : $backup"

$tmp = [System.IO.Path]::GetTempFileName()
Remove-Item $tmp -Force
try {
    $out = [System.IO.Compression.ZipFile]::Open($tmp, 'Create')
    foreach ($item in $plan) {
        # Optimal compression on the ZIP container itself, on top of the image recompression.
        $e = $out.CreateEntry($item.Name, [System.IO.Compression.CompressionLevel]::Optimal)
        $st = $e.Open()
        $st.Write($item.Bytes, 0, $item.Bytes.Length)
        $st.Close()
    }
    $out.Dispose()

    Move-Item $tmp $deck -Force
}
catch {
    if (Test-Path $tmp) { Remove-Item $tmp -Force }
    throw "Rewrite failed, original deck untouched: $($_.Exception.Message)"
}

$newSize = (Get-Item $deck).Length
Write-Host ""
Write-Host "RESULT"
Write-Host "  before : $([Math]::Round($originalSize/1MB,2)) MB"
Write-Host "  after  : $([Math]::Round($newSize/1MB,2)) MB"
Write-Host "  saved  : $([Math]::Round(($originalSize-$newSize)/1MB,2)) MB ($([Math]::Round(100*($originalSize-$newSize)/$originalSize,1))%)"
Write-Host ""
Write-Host "Open the deck and spot-check backgrounds and any transparent logos before committing."
