# Reconcile Specification Against Code

You have access to a software project that has both documentation (PRD, Specification, arc42) and source code. The documentation was generated earlier from a requirements conversation. Since then, the code has evolved: features were added, security was hardened, edge cases were discovered, validation rules emerged.

Your task is to find where the spec and the code have drifted apart.

**Important:** Do not rewrite the documentation. Produce a reconciliation report that lists the differences. The team decides what to update.

## What to compare

Read the existing documentation in `src/docs/` and compare it against the current source code, tests, and configuration files.

## Output

File: `src/docs/RECONCILIATION.adoc`

Organize findings into three categories:

### 1. NEW — In code, not in spec

Requirements, behaviors, or constraints that exist in the code but are not documented in the spec. These typically emerge during implementation.

For each finding:
```
=== NEW-NNN: <short title>

Where in code:: <file:function or file:line>
What it does:: <one sentence>
Evidence:: <test name, constant, or code pattern that proves this>
Suggested spec location:: <which spec file and section should document this>
Priority:: <High: affects users/API | Medium: affects maintainers | Low: internal detail>
```

Look specifically for:
- Security mechanisms (input validation, path checks, escaping) not in NFRs
- Validation rules (size limits, depth limits, format constraints) not in acceptance criteria
- CLI flags or behaviors not in the CLI specification
- Error handling patterns not in crosscutting concepts
- Edge cases covered by tests but not by acceptance criteria

### 2. CHANGED — In both, but diverged

Behaviors documented in the spec that exist in the code but work differently than specified. The spec says X, the code does Y.

For each finding:
```
=== CHANGED-NNN: <short title>

Spec says:: <quote from spec, with file and section>
Code does:: <actual behavior, with file:function>
Evidence:: <test that demonstrates the actual behavior>
Impact:: <Does this affect users? Is the spec wrong, or did the code improve on it?>
```

### 3. DEAD — In spec, not in code

Requirements or features documented in the spec that are not implemented in the code. These may be planned-but-not-built, or removed during implementation.

For each finding:
```
=== DEAD-NNN: <short title>

Spec says:: <quote from spec, with file and section>
Code evidence:: <what you searched for and didn't find>
Likely reason:: <never implemented | removed | replaced by alternative>
Action needed:: <remove from spec | mark as planned | investigate>
```

### 4. Summary

End with a summary table:

```
| Category | Count | High Priority | Medium | Low |
|----------|-------|---------------|--------|-----|
| NEW      |       |               |        |     |
| CHANGED  |       |               |        |     |
| DEAD     |       |               |        |     |
```

## What NOT to touch

- **Do not modify** any existing documentation files
- **Do not rewrite** the PRD, spec, or arc42
- **Preserve the WHY**: Business context, ADR rationale, quality goal priorities, and stakeholder concerns are human-authored decisions. Do not flag them as "wrong" just because they aren't in the code. They are not supposed to be in the code.
- **Ignore formatting differences**: Section order, naming conventions, AsciiDoc style — these are not drift

## How to work

1. Read `src/docs/PRD/` — compare FRs and NFRs against actual code capabilities
2. Read `src/docs/spec/` — compare use cases, CLI spec, data models, acceptance criteria against code and tests
3. Read `src/docs/arc42/` — compare building blocks, runtime views, deployment, and crosscutting concepts against package structure and patterns
4. Read `src/docs/arc42/ADRs/` — verify each decision still matches the code (but do not flag missing rationale as drift)
5. Write `src/docs/RECONCILIATION.adoc` with your findings

## Quality bar

- Every finding must cite both the spec location AND the code location
- "NEW" findings need test evidence or concrete code references
- "CHANGED" findings need a clear before/after comparison
- "DEAD" findings need evidence of absence (what you searched for)
- When in doubt, flag it — the team filters, you discover
