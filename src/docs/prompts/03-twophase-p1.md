# Socratic Code Theory Recovery — Phase 1: Understand

You have access to a software project's codebase. The project has no documentation. Your task is to recover the "theory" of the program (in Peter Naur's sense) by recursively refining questions until each one is either answered from code or flagged as unanswerable.

**Important:** Do not use `git log` or `git blame`. Work from the current state of the code only.

## Starting Questions

1. What problem does this project solve and for whom?
2. What is the specification of this project?
3. What is the architecture of this project?
4. What quality goals drive the design?
5. What risks and technical debt exist?

## How to work

For each question:

- **Answerable from code?** Write the answer with code references (file:function or file:line). Mark as `[ANSWERED]`.
- **Too broad?** Decompose into sub-questions. Use established frameworks as guides: **arc42** for architecture (12 sub-questions), **Cockburn Use Cases** for specification, **ISO 25010** for quality, **Nygard ADRs** for decisions.
- **Not answerable?** Mark as `[OPEN]` with category and role. Do not guess.

For answered questions:
```
=== Q-N.N.N: <Question>

Status:: [ANSWERED]
Answer:: <answer>
Evidence:: <file:function or file:line>
```

For open questions:
```
=== Q-N.N.N: <Question>

Status:: [OPEN]
Category:: <Business Context | Design Rationale | Quality Goals | Stakeholder Context | Future Direction | Domain Knowledge>
Ask:: <Product Owner | Architect | Developer | Domain Expert | Operations>
Why unanswerable:: <what's missing from the code>
```

Keep refining until every leaf is either `[ANSWERED]` or `[OPEN]`. Write the tree to `src/docs/QUESTION_TREE.adoc`.

After the tree is complete, collect all `[OPEN]` leaves into `src/docs/OPEN_QUESTIONS.adoc`, grouped by Ask role, then by Category. This is the handoff document: the team answers these before Phase 2 can begin.

## Quality bar

- Every `[ANSWERED]` leaf must cite code evidence. No evidence, no answer.
- Every `[OPEN]` leaf must explain why it's unanswerable. No guessing.
- If less than 70% of leaves are answered, go back and look harder at test files, test fixtures, error messages, and code comments.
- The tree should be MECE at each level: sub-questions cover the parent completely, without overlap.
