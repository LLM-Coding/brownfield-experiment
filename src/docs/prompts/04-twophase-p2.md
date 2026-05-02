# Socratic Code Theory Recovery — Phase 2: Document

You have access to a software project's codebase and a completed Question Tree (`src/docs/QUESTION_TREE.adoc`) from Phase 1 (Socratic Code Theory Recovery). The team has answered the Open Questions — their answers are provided below.

Your task is to synthesize the answered questions and the team's input into complete documentation.

**Important:** Do not use `git log` or `git blame`. Work from the current state of the code only.

## Team Answers to Open Questions

<!-- INSERT ANSWERED OPEN QUESTIONS HERE -->
<!-- Format: -->
<!-- Q-N.N.N: <question text> -->
<!-- Answer: <team's answer> -->

## Artifacts to produce

Write all artifacts into `src/docs/`. All documentation in **English**, **AsciiDoc format** (.adoc), diagrams as **PlantUML**. Reference workflow: https://llm-coding.github.io/Semantic-Anchors/spec-driven-development

### PRD

File: `src/docs/PRD/PRD-001.adoc`

Synthesize from Q-1 branch answers and the team's Business Context answers. Look for TODOs, unused interfaces, and partially implemented features. Document them as "Planned but not implemented."

### Specification

| Artifact | File | Source |
|----------|------|--------|
| Use Cases | `src/docs/spec/01_use_cases.adoc` | Q-2.3 branch. Cockburn format, PlantUML activity diagrams. |
| CLI Specification | `src/docs/spec/02_cli_specification.adoc` | Q-2.1 branch. |
| Data Models | `src/docs/spec/03_data_models.adoc` | Q-2.2 branch. |
| Acceptance Criteria | `src/docs/spec/04_acceptance_criteria.adoc` | Derive from test names, reference UC-IDs. Gherkin format. |
| Sync Specification | `src/docs/spec/05_sync_specification.adoc` | If sync logic exists. |

### Architecture Documentation

**arc42** with all 12 chapters from Q-3 branch. Master file: `src/docs/arc42/arc42.adoc`, chapters in `src/docs/arc42/chapters/`.

- C4 model diagrams (PlantUML) for Context, Container, Component levels
- **Nygard ADRs** in `src/docs/arc42/ADRs/ADR-NNN-Title.adoc` with **Pugh Matrix** (weighted, -1/0/+1)
- For ADRs: use the team's Design Rationale answers for the "why." If a question was not answered by the team and only code evidence exists, write `[NOTE] This ADR was reverse-engineered from code. The rationale is inferred, not confirmed.`
- For Deployment View: use the team's Performance Budget answers if provided.

### Remaining Open Questions

If any Open Questions were NOT answered by the team, collect them in `src/docs/OPEN_QUESTIONS.adoc`, grouped by Ask role.

## Traceability

In every documentation artifact, reference the Question ID that supports each claim. Example: `The model uses JSONC format _(Q-2.2.1)_.`

For claims based on team answers (not code), reference both the Question ID and mark as team-provided: `The project competes with Structurizr and LikeC4 _(Q-1.1.2, team answer)_.`

## Quality bar

- Every claim must reference a Question ID.
- Claims from code: cite file:function or file:line.
- Claims from team answers: mark as `(team answer)`.
- Claims with neither source: remove or add a new Open Question.
- The Question Tree and the documentation must be consistent.
