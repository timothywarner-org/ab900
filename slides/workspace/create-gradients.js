const sharp = require('sharp');
const path = require('path');
const dir = path.join(__dirname, 'html');

async function createGradient(filename, color1, color2, w = 1440, h = 810) {
  const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="${w}" height="${h}">
    <defs><linearGradient id="g" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:${color1}"/>
      <stop offset="100%" style="stop-color:${color2}"/>
    </linearGradient></defs>
    <rect width="100%" height="100%" fill="url(#g)"/>
  </svg>`;
  await sharp(Buffer.from(svg)).png().toFile(path.join(dir, filename));
}

async function main() {
  await createGradient('bg-title.png', '#0F1B2D', '#0078D4');
  await createGradient('bg-segment.png', '#0078D4', '#005A9E');
  await createGradient('bg-dark.png', '#1B1B3A', '#2D2D5E');
  await createGradient('bg-closing.png', '#005A9E', '#0F1B2D');
  console.log('Gradients created.');
}
main().catch(console.error);
