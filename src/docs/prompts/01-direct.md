# Reverse-Engineer Project Documentation

You have access to a software project's codebase. The project has no documentation. Your task is to create the full documentation set from the source code.

Write all artifacts into `src/docs/`. All documentation in **English**, **AsciiDoc format** (.adoc). Diagrams as **PlantUML** (embedded in AsciiDoc). Reference workflow: https://llm-coding.github.io/Semantic-Anchors/spec-driven-development

**Important:** Do not use `git log` or `git blame`. Work from the current state of the code only.

## Artifacts to produce

Work through these in order. Each artifact builds on the previous one.

### 1. PRD

File: `src/docs/PRD/PRD-001.adoc`

Product Requirements Document with Vision, Problem Statement, Target Audience, Functional Requirements (FR-IDs), Non-Functional Requirements (NFR-IDs), Future Considerations, and Open Questions. Derive everything from code, CLI UX, error messages, test scenarios, and go.mod dependencies.

Look for TODOs, commented code, unused interfaces, and partially implemented features. Document them as "Planned but not implemented" in Future Considerations. These are easy to miss but critical — they represent intent that only exists as traces in the code.

### 2. Specification

| Artifact | File | Format |
|----------|------|--------|
| Use Cases | `src/docs/spec/01_use_cases.adoc` | Cockburn format (UC-IDs, Business Rules as BR-IDs). Include PlantUML activity diagram per Use Case covering all flows. |
| CLI Specification | `src/docs/spec/02_cli_specification.adoc` | Derive from Cobra command definitions, flags, integration tests. |
| Data Models | `src/docs/spec/03_data_models.adoc` | Domain structs, JSON/JSONC schemas, file formats. Examples from test fixtures. |
| Acceptance Criteria | `src/docs/spec/04_acceptance_criteria.adoc` | Gherkin (Given/When/Then), referencing UC-IDs. Derive from test names and assertions. |
| Sync Specification | `src/docs/spec/05_sync_specification.adoc` | If sync logic exists: algorithm, conflict resolution, state management, edge cases. |

### 3. Architecture Documentation

**arc42** with all 12 chapters. Master file: `src/docs/arc42/arc42.adoc`

Chapter files in `src/docs/arc42/chapters/`. Visualization with **C4 model** diagrams (Context, Container, Component levels in PlantUML).

Architecture decisions as **Nygard ADRs** in `src/docs/arc42/ADRs/ADR-NNN-Title.adoc`. Each ADR includes a **Pugh Matrix** (weighted, -1/0/+1 scale) evaluating at least 2-3 alternatives against quality goals.

For ADRs: you can usually determine WHAT was decided from the code, but rarely WHY alternatives were rejected. Look for clues in code comments, naming patterns (e.g. `ModelWinsResolver` implies other resolvers were considered), and interface designs that hint at alternatives. If you find concrete evidence for the rationale, use it. If not, flag the reasoning as Open Question rather than guessing a plausible rationale. A wrong "why" is worse than an honest "unknown."

For Chapter 7 (Deployment View): derive performance thresholds from benchmark tests if possible. If benchmarks exist but define no pass/fail thresholds, flag the missing budgets as Open Questions.

### 4. Open Questions List

File: `src/docs/OPEN_QUESTIONS.adoc`

**This is the most important artifact.**

For every piece of information you could NOT determine from the code, create an entry:

```
=== OQ-NNN: <Question>

Category:: <Business Context | Design Rationale | Quality Goals | Stakeholder Context | Future Direction | Domain Knowledge>
Ask:: <Product Owner | Architect | Developer | Domain Expert | Operations>
Confidence:: <Low | Medium | High>
Your Best Guess:: <what you think the answer might be>
Why You Can't Be Sure:: <what's missing from the code>
What Would Help:: <what information would answer this>
```

Be thorough. Every assumption you made while writing PRD, Spec, and arc42 that you couldn't verify from code alone should appear here.

## How to work

1. Explore codebase structure, read go.mod, main entry point, CLI commands
2. Read core domain types and interfaces
3. Read tests and test fixtures — richest source of behavioral specification
4. Build your mental model, then write artifacts in order
5. For every statement: "Can I prove this from code, or am I guessing?" If guessing, add an Open Question.

## Quality bar

- Every claim must be traceable to code. If you can't point to the source, it's an Open Question.
- Prefer "I don't know" over a plausible guess.
- Completeness matters: if the code does it, the documentation should cover it.
