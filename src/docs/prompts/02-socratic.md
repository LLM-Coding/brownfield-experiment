# Socratic Code Theory Recovery

You have access to a software project's codebase. The project has no documentation. Your task is to recover the "theory" of the program (in Peter Naur's sense) by recursively refining questions until each one is either answered from code or flagged as unanswerable.

**Important:** Do not use `git log` or `git blame`. Work from the current state of the code only.

## Starting Questions

Begin with these high-level questions:

1. What problem does this project solve and for whom?
2. What is the specification of this project?
3. What is the architecture of this project?
4. What quality goals drive the design?
5. What risks and technical debt exist?

## How to work

For each question, follow this cycle:

### Step 1: Can you answer it from the code?

- **Yes, fully** — Write the answer with code references (file:function or file:line). Mark as `[ANSWERED]`.
- **Partially** — Write what you can answer, then refine the unanswered part into sub-questions.
- **No** — Mark as `[OPEN]` with category and the role who could answer it. Do not guess.

### Step 2: Refine

If a question is too broad to answer directly, decompose it into sub-questions. Use established frameworks as decomposition guides:

- "What is the architecture?" decomposes along **arc42** chapters (12 sub-questions)
- "What is the specification?" decomposes into **Cockburn Use Cases**, CLI spec, data models, acceptance criteria
- "What quality goals?" decomposes along **ISO 25010** categories
- "What risks?" decomposes along error handling patterns, edge cases, security mechanisms

### Step 3: Recurse

Apply Step 1 to each sub-question. Keep refining until every leaf is either `[ANSWERED]` or `[OPEN]`.

### Step 4: Stop conditions

A question is a leaf when:
- It is specific enough to answer with a single code reference, OR
- It cannot be answered from code at all (mark `[OPEN]`), OR
- Further decomposition would not add information (the code says nothing about this area)

## Output Format

Write the question tree to `src/docs/QUESTION_TREE.adoc`.

Use indented headings to show the tree structure. For each leaf:

**Answered leaf:**
```
==== Q-1.2.3: What serialization format does the model use?

Status:: [ANSWERED]
Answer:: JSONC (JSON with comments). The loader strips comments before parsing.
Evidence:: `internal/model/loader.go:StripJSONC`, test fixture `testdata/valid-model.jsonc`
```

**Open leaf:**
```
==== Q-1.1.1: Why was this project started? What alternatives existed?

Status:: [OPEN]
Category:: Business Context
Ask:: Product Owner
Why unanswerable:: No README section, no comments, no competitor references in code.
What would help:: A Problem Statement document or conversation with the project initiator.
```

## After the tree is complete

Once all leaves are resolved, produce two synthesis artifacts:

### 1. Documentation (from answered leaves)

Collect all `[ANSWERED]` leaves and synthesize them into documentation following the Spec-Driven Development workflow (https://llm-coding.github.io/Semantic-Anchors/spec-driven-development):

- `src/docs/PRD/PRD-001.adoc` — PRD from answered Q-1.x leaves
- `src/docs/spec/*.adoc` — Specification from answered Q-2.x leaves
- `src/docs/arc42/arc42.adoc` + chapters — Architecture from answered Q-3.x leaves
- Nygard ADRs with Pugh Matrix where design decisions were found in code

For each claim in the documentation, reference the question ID that supports it.

### 2. Open Questions (from open leaves)

Collect all `[OPEN]` leaves into `src/docs/OPEN_QUESTIONS.adoc`, grouped by Category and Ask role.

## Quality bar

- A question marked `[ANSWERED]` must cite code evidence. No evidence, no answer.
- A question marked `[OPEN]` must not contain a guess. The whole point is to distinguish what is known from what is not.
- Prefer more `[OPEN]` leaves over plausible but unverifiable answers.
- The tree should be MECE at each level: sub-questions cover the parent question completely, without overlap.
