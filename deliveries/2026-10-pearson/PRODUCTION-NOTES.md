# Pearson October 27 production record

**Owner:** Codex for artifact construction and validation. **Status:** course artifacts complete; live demonstration and measured rehearsal gates remain open. **Date:** October 19, 2026.

## Authority and scope reconciliation

The submitted two-hour proposal and current Pearson correspondence govern the October 27 delivery. Laura requested this course's deck separately from Thursday's Context Engineering deck. Tim assigned this second course to Codex and stated that Claude owns the other deck and its staged, unsent reply. No message was sent or changed by this work.

The canonical clone is `C:\github\ab900`, origin `https://github.com/timothywarner-org/ab900.git`. Fetch found no upstream divergence at the starting commit `09b80ea`. The July root deck is the earlier longer O'Reilly engagement and remains unchanged. Its actual count is 60 slides; older 59-slide remap assumptions are historical. The per-engagement authority exception is now documented in CLAUDE.md, rather than leaving contradictory instructions.

The old proposal's participant setup language is reconciled with Tim's current instructor-led delivery preference: all committed outcomes and resources remain; mandatory learner installation, cloning, and tenant sign-in are removed. Learner materials support optional practice afterward.

The six promised resource categories are present: slides PDF, repository reference, portal map PDF, administration/Purview walkthrough PDF, DLP/DSPM configuration PDF, and starter-agent configuration plus files. The starter is a copy-ready configuration recipe, not a fabricated exported solution. The policy examples are recipes, not importable policy objects.

## Pedagogy and visuals

Thirty audience slides plus six hidden producer polls support a 120-minute planned schedule. Contoso, Ltd.'s service assistant carries the scenario through entitlement, information protection, agent construction, and release ownership. The 8-minute admin demonstration, 12-minute DLP/report demonstration, and 18-minute Studio demonstration remain in scope.

The Pearson July 2026 Enterprise Live Training template supplies the backgrounds, logo, palette, and Arial typography. No generated raster art or third-party stock graphics were added. Eight comparison tables are native editable tables. The diagrams are editable native shapes and connectors.

| Slides | Relationship or decision taught |
|---|---|
| 8, 12 | Entitlement, activation, and source access are distinct checkpoints |
| 13 | A notification threshold requires an administrative response |
| 14 | Identity evaluation and resource authorization govern different parts of the request |
| 18 | Authorized and unauthorized source paths produce different grounding boundaries |
| 20 | A posture finding leads through ownership and remediation to a retest |
| 21 | DLP location, condition, and action must agree |
| 23 | Citation presence is insufficient evidence of content use |
| 29, 31 | Building, reviewing, publishing, and distributing are distinct release decisions |
| 33, 35 | Pilot expansion requires boundary evidence and accountable ownership |

No click-build sequence was added; diagrams appear as complete teaching relationships. Presenter notes explain the relationships rather than only naming boxes.

## Technical correction and refutation pass

The current Microsoft Learn pages were retrieved on October 19 and are linked per slide and handout. Private source snapshots are under `.pearson-build/2026-10/research/`.

| Historical risk or overstatement | Correction and preventive check |
|---|---|
| Grounding eliminates hallucination; every answer has citations | Removed. Response quality requires source-based evaluation. Check against architecture and test-source evidence. |
| A Copilot license grants organizational file access | Keep entitlement separate from existing source permissions. Require intended-user source test. |
| A PAYG budget is an enforced cap | Scope the claim to classic billing-policy notification behavior; inspect service and billing model. |
| Agent Builder is no-code; Studio is pro-code | Treat Studio as low-code with development options. Distinguish agent architecture from product packaging. |
| DLP citation presence proves policy failure | Current docs allow citations while excluding content. Require controlled baseline/content-use retest. |
| DLP protects every uploaded prompt file equivalently | Preserve the documented distinction between typed prompts and file-grounding controls. |
| One universal DSPM interface | Distinguish current DSPM and DSPM for AI classic; match the observed tenant. |
| Uploaded knowledge inherits per-user SharePoint permissions | Use only synthetic uploaded knowledge; review the full intended audience. |
| Empty recent sharing report proves no exposure | Distinguish activity windows from current-permission snapshots and effective-access tests. |
| Trial authoring guarantees publishing | Mark trial publishing restriction and actual entitlement check separately. |

The second pass attempted to refute the revised claims against the complete source pages. A conflicting broad statement in an agent overview was not used to claim that every custom engine shares an identical runtime. Tenant-specific availability and actual enforcement remain unverified where no live result exists.

## Validation and regressions

| Check | Result / boundary |
|---|---|
| Package integrity | PASS, zero findings; 36 slides and 36 notes parts |
| Layout/font requirements | PASS, zero findings; Arial reference policy; 16:9 template dimensions |
| Native tables | Eight native tables on slides 9, 11, 16, 19, 27, 28, 32, 34 |
| Layout estimates | Four estimated table-height warnings on 19, 27, 32, 34; native PowerPoint renders inspected, no text/footer collision |
| Visual review | Every slide inspected at full size using native PowerPoint exports and PDF rendering; companion PDF pages inspected individually |
| Producer visibility | Slides 2-7 hidden in PPTX; excluded from 30-page audience PDF |
| Speaker notes | Notes and current sources present for all slides; voiced passages use contractions |
| Voice lint | PASS, zero errors; one reviewed warning counts the required acronym DSPM as emphasis caps |
| Timing | Agenda sum is 120 minutes; speaking/demonstration runtime is not a measured rehearsal |
| Template assets | Supplied publisher art retained; no third-party illustration or synthetic product screenshot |
| Original source | July source deck preserved; older render and build candidates kept outside active handoff |
| Handoff invariants | PASS: one active PPTX, 36 notes, six hidden polls, six PDFs with expected page counts, 26 local links with no broken targets, eight starter tests retained as NOT RUN |
| Production ZIP | PASS: 16 entries, CRC check passed, every artifact hash matches MANIFEST.json; internal Claude handoff and private evidence excluded |
| HTML interaction | Browser navigation and larger-text control checked through a local preview; 24-to-26 px change observed with no page-wide overflow at the checked viewport. Direct file URL testing was blocked by browser-tool URL policy. 200% browser zoom and print preview are not verified. Static inspection finds no external dependencies for core content. |

Two visual defects found in the first draft changed the workflow: connector arrowheads initially pointed toward their source because the native API's head/tail convention differed from the intended reading; rendered arrows were corrected and the from/to relationship is now explicitly reviewed. A light-slide footer collided with the inherited logo; the footer now starts at x=200, and every slide footer was inspected. The source-count discrepancy is prevented by reading the actual package count rather than trusting an old remap table. Finalization receipts use distinct revision names to preserve evidence.

## Live observations and unfinished work

M365 admin sign-in and the home page succeeded. The live navigation exposes Copilot > Cost management and a link labelled classic Billing & usage. The classic page opened. This is navigation evidence only, not proof of a particular user's assignment, an enabled metered service, or source access.

Copilot Studio did not reach a stable authoring page: the existing Tim account flow returned to the account picker and browser inspection timed out. No credential reset or security-policy change was attempted. No agent was created, uploaded, tested, submitted, or published in this run. DLP and SharePoint report execution were not completed.

| Open item | Accountable owner | Concrete next action and completion criterion | Revisit trigger |
|---|---|---|---|
| Studio sign-in and environment | Tim, with Claude as proposed rehearsal operator | Complete normal sign-in; identify environment and entitlement; run T01-T08 and retain actual results | Before the platform rehearsal or next authorized preparation session |
| DLP fixture and policy behavior | Tim, with Claude as proposed rehearsal operator | Prepare synthetic labelled file, create isolated policy, record configuration and any controlled enforcement result separately | Before claiming the live policy demo ready |
| SharePoint oversharing report | Tim, with Claude as proposed rehearsal operator | Confirm report capability/collection, run report, retain date/scope and result; test source access | Before the live report demo |
| Measured session timing | Tim | Rehearse the three demos and transitions against the agenda; record measured duration and repair overruns | Before October 27 delivery |
| Cvent producer workflow | Tim and Pearson producer | October 21 appointment: verify screen sharing, note access, poll loading, and resource delivery surface | Scheduled rehearsal |
| Publisher delivery | Tim | Review package and explicitly authorize or perform email/upload; retain acknowledgement | After artifact review |
| Claude review handoff | Codex prepared; Claude acceptance pending | Detailed CLAUDE-HANDOFF.md prepared for Tim to copy; Claude records accepted, amended, or deferred disposition before taking ownership | Tim pastes the handoff into Claude |

The completion distinction is intentional: files are prepared and checked, safe read-only tenant observations are recorded, and live gates are explicit. A fallback walkthrough does not count as a completed live demonstration. No publisher upload, email send, or public Git push occurred.
