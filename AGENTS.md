# Learner-facing AB-900 course home

This public repository is the course home for Tim Warner's Pearson class
**Copilot and Agent Administration Fundamentals** (October 27, 2026) and the earlier
July 2026 O'Reilly AB-900 course. Start with `README.md` for the learning route and
`TUTORIALS.md` for the step-by-step exercises. `CLAUDE.md` holds the full authoring
rules for the July course and the study-buddy assets under `.github/`.

## Project map

- `README.md` opens with the Pearson course home: who it is for, the learning route,
  and links into `TUTORIALS.md`. The July course material follows it.
- `TUTORIALS.md` repeats every Pearson demo as numbered steps: prepare a lab, trace
  access and adoption, create a DLP policy in simulation, read a data access governance
  report, build and test the starter agent, and approve and operate it.
- `starter-files/` holds the synthetic Contoso, Ltd. service guide, agent instructions,
  test matrix (T01 to T08, all `NOT RUN`), and synthetic sharing report.
- `segment-0*/`, `shared-resources/`, `docs/`, `references/`, and `slides/` belong to
  the July O'Reilly course.
- `.github/` holds the study-buddy prompts, skills, and instructions.
- `scripts/Test-CourseHome.py` checks the course-home documents and the public/private
  boundary.

## Teaching and repository boundaries

- Keep the Pearson story consistent: Contoso, Ltd., pilot user Debra, content owner
  Kim Akers, and the harmless marker `SERVICE-ORCHID-42`. Keep business data fictional.
- Ground every product claim in a current Microsoft Learn page and link it. Portal
  paths change, so date the check.
- Never turn a `NOT RUN` row in the test matrix into a result from an expected answer.
- Keep instructor operations, schedules, publisher files, correspondence, and
  credentials out of tracked files. Store local material under ignored `.local/`.
  Never force-add it. Public checks must work without it.
- Pearson production files live under `deliveries/2026-10-pearson/` and
  `.pearson-build/`. They are ignored here and tracked in a separate private
  repository through a second Git directory, `.git-pearson`. Never add `.git-pearson/`
  or those paths to this public repository.
- Do not modify, re-export, or re-hash files under `.local/` or the private paths
  unless explicitly requested.

## Changes and verification

- Run `python scripts/Test-CourseHome.py` after documentation changes. It checks local
  links and anchors in the course-home documents, the starter files, the writing rules,
  and the public/private boundary.
- Follow the repository writing rules: plain ASCII, no curly quotes, no em dashes or en
  dashes, and no contractions in Markdown.
- Distinguish failures caused by existing worktree changes from failures caused by the
  current edit. Do not revert or overwrite unrelated changes.
