# Pearson: Copilot and Agent Administration Fundamentals

**Session:** October 27, 2026, 9:00-11:00 a.m. Pacific / 11:00 a.m.-1:00 p.m. Central. Instructor joins 30 minutes early.

**Canonical local handoff:** `C:\github\ab900\deliveries\2026-10-pearson\handoff-v1`

Open `handoff-v1\START-HERE.html`. Resolve the active deck through `CURRENT-DELIVERY.json`. There is one active deck for this Pearson engagement; the root July O'Reilly deck is a different engagement.

## Scope

The submitted two-hour proposal governs this delivery: administer Copilot licensing/access/adoption, protect reachable data with Purview and DSPM for AI, build and govern a Copilot Studio agent, and apply Zero Trust/Entra fundamentals. Preserve the live DLP policy, SharePoint oversharing-report, and Studio build demonstrations. A fallback walkthrough does not establish live readiness.

The delivery contains 36 slides: 30 audience slides and six hidden producer polls. The agenda totals 120 minutes including demonstrations, discussion, Q&A, and a five-minute break. This is planned time, not measured rehearsal time.

## Included material

- Pearson template deck and audience-only slides PDF.
- Admin-center quick reference and portal map PDF.
- Microsoft 365 admin and Purview walkthrough PDF.
- Sample DLP and DSPM for AI configuration PDF.
- Starter agent configuration PDF, synthetic knowledge, instructions, test matrix, and synthetic report exercise.
- Offline instructor runbook, speaker notes, technical prep, and producer poll answer key.

`authoring/` holds the content model. `learner-resources/` holds source fixtures. Publisher-branded files are local under ignored `handoff-v1/`; private build and validation evidence is under ignored `.pearson-build/2026-10/` at the repository root.

**Private record.** Every file in this folder and in `.pearson-build/2026-10/` (except `node_modules` and caches) is tracked in the private repository `timothywarner-org/ab900-pearson`. It uses a second Git directory, `.git-pearson`, over this same working folder, so nothing is copied. Commit and push it with `pwsh -NoProfile -ExecutionPolicy Bypass -File C:\Scripts\Sync-PearsonPrivateRepo.ps1`. The public `.gitignore` excludes `.git-pearson/`; never add it or the private paths to this public repo.

## Completion boundaries

The production record is `PRODUCTION-NOTES.md`. Keep artifact validation, tenant configuration, observed behavior, instructor rehearsal, platform rehearsal, and external delivery separate. The initial starter test matrix is deliberately marked NOT RUN. Do not turn those rows into PASS based on expected answers.

**Delivery status, October 19, 2026:** deck v04 and the learner handouts were sent to the publisher. Claude's review, the v04 changes, and its disposition of Codex's follow-ups are in `PRODUCTION-NOTES.md`; the message record is in the private repo under `.pearson-build/2026-10/correspondence/`. Live-demo rehearsal remains open.
