<div class="row flex-xl-nowrap">
    <main class="col-12 col-md-12 col-xl-12 pl-md-12" role="main">
        <!-- Hero Section -->
        <div class="p-5 rounded" style="background: linear-gradient(135deg, #1a365d 0%, #2d5a87 100%); color: white; margin-bottom: 2rem;">
            <h1 style="font-size: 2.5rem; font-weight: 700;">Socratic Code Theory Recovery</h1>
            <p class="lead" style="font-size: 1.4rem; opacity: 0.95;">
                Can an LLM reverse-engineer software documentation from code?
            </p>
            <p style="font-size: 1.1rem; opacity: 0.85; max-width: 700px;">
                A controlled experiment measuring what LLMs can and cannot recover from source code alone. We deleted all documentation from a well-documented project, asked an LLM to reconstruct it, and compared the output against the originals.
            </p>
            <p style="margin-top: 1.5rem;">
                <a href="reports/010-consolidated.html" class="btn btn-light btn-lg" style="font-weight: 600;">
                    Read the Report
                </a>
                <a href="https://github.com/LLM-Coding/brownfield-experiment" class="btn btn-outline-light btn-lg" style="margin-left: 0.5rem;">
                    GitHub
                </a>
            </p>
        </div>

        <!-- Key Results -->
        <h2 style="text-align: center; margin-bottom: 2rem; color: #1a365d;">Key Findings</h2>

        <div class="row row-cols-1 row-cols-md-2 mb-4">
            <div class="col mb-4">
                <div class="card h-100 shadow-sm border-0" style="border-left: 4px solid #16a34a !important;">
                    <div class="card-body">
                        <h4 class="card-title" style="color: #16a34a;">LLM recovers from code</h4>
                        <p class="card-text">
                            Functional requirements (21 vs 7 in original), acceptance criteria (69 vs 40), building block views, glossary (31 vs 2 terms), security documentation. In some areas, the generated output was <strong>better</strong> than the original.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col mb-4">
                <div class="card h-100 shadow-sm border-0" style="border-left: 4px solid #dc2626 !important;">
                    <div class="card-body">
                        <h4 class="card-title" style="color: #dc2626;">LLM cannot recover from code</h4>
                        <p class="card-text">
                            Business context (why, against whom), design rationale (why alternative A over B), quality goal <em>priorities</em>, stakeholder concerns, aspirational features, performance budgets. Code is the result of decisions, not the decision itself.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col mb-4">
                <div class="card h-100 shadow-sm border-0" style="border-left: 4px solid #2563eb !important;">
                    <div class="card-body">
                        <h4 class="card-title" style="color: #2563eb;">11 questions close the gap</h4>
                        <p class="card-text">
                            The two-phase workflow identifies exactly what the team needs to provide. In our experiment, 11 targeted questions (routed by role) were sufficient to produce documentation matching the original's ADR topics, quality goals, and performance budgets.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col mb-4">
                <div class="card h-100 shadow-sm border-0" style="border-left: 4px solid #9333ea !important;">
                    <div class="card-body">
                        <h4 class="card-title" style="color: #9333ea;">Semantic Anchors validated</h4>
                        <p class="card-text">
                            Terms like "arc42", "Cockburn", "Nygard ADR" serve as both <strong>prompt compression</strong> (69 lines produce 3,850 lines of correct output) and <strong>decomposition heuristics</strong> ("arc42" generates 12 MECE sub-questions automatically).
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Three Approaches -->
        <div class="bg-light p-4 rounded mb-4">
            <h3 style="color: #1a365d; margin-bottom: 1.5rem;">Three Approaches Compared</h3>
            <table class="table table-bordered">
                <thead style="background-color: #1a365d; color: white;">
                    <tr><th>Approach</th><th>Score</th><th>Strength</th><th>Report</th></tr>
                </thead>
                <tbody>
                    <tr>
                        <td><strong>Direct</strong></td>
                        <td>17.5/30</td>
                        <td>Most detailed functional requirements, inline threat model</td>
                        <td><a href="reports/020-experiment-1a-direct.html">Detailed report</a></td>
                    </tr>
                    <tr>
                        <td><strong>Socratic</strong></td>
                        <td>18.5/30</td>
                        <td>Only version with correct quality goal priorities, most efficient (21% of original)</td>
                        <td><a href="reports/030-experiment-1c-socratic.html">Detailed report</a></td>
                    </tr>
                    <tr>
                        <td><strong>Two-Phase</strong></td>
                        <td>22/30</td>
                        <td>All 5 ADR topics correct, highest traceability (50 team-answer markers)</td>
                        <td><a href="reports/040-experiment-2-twophase.html">Detailed report</a></td>
                    </tr>
                </tbody>
            </table>
            <p class="text-center">
                <a href="reports/050-experiment-fair-comparison.html" class="btn btn-outline-primary">Fair Comparison (all with team answers)</a>
            </p>
        </div>

        <!-- Prompts Section -->
        <div class="mb-4 p-4">
            <h3 style="color: #1a365d; margin-bottom: 1.5rem;">Reproduce the Experiment</h3>
            <p>
                All prompts are available in the <a href="https://github.com/LLM-Coding/brownfield-experiment/tree/main/src/docs/prompts">prompts/</a> directory. Use them on the <a href="https://github.com/docToolchain/Bausteinsicht">Bausteinsicht</a> repo (branch <code>brownfield</code>) or on your own project.
            </p>
            <table class="table">
                <thead><tr><th>Prompt</th><th>Lines</th><th>Use when</th></tr></thead>
                <tbody>
                    <tr><td><a href="https://github.com/LLM-Coding/brownfield-experiment/blob/main/src/docs/prompts/01-direct.md">01-direct.md</a></td><td>69</td><td>Quick documentation from code alone</td></tr>
                    <tr><td><a href="https://github.com/LLM-Coding/brownfield-experiment/blob/main/src/docs/prompts/02-socratic.md">02-socratic.md</a></td><td>97</td><td>Identifying knowledge gaps</td></tr>
                    <tr><td><a href="https://github.com/LLM-Coding/brownfield-experiment/blob/main/src/docs/prompts/03-twophase-p1.md">03-twophase-p1.md</a></td><td>51</td><td>Phase 1: Build Question Tree</td></tr>
                    <tr><td><a href="https://github.com/LLM-Coding/brownfield-experiment/blob/main/src/docs/prompts/04-twophase-p2.md">04-twophase-p2.md</a></td><td>61</td><td>Phase 2: Synthesize with team answers</td></tr>
                    <tr><td><a href="https://github.com/LLM-Coding/brownfield-experiment/blob/main/src/docs/prompts/05-reconcile.md">05-reconcile.md</a></td><td>82</td><td>Detect spec drift</td></tr>
                </tbody>
            </table>
        </div>

        <!-- Theoretical Foundation -->
        <div class="text-center p-4 rounded" style="background-color: #f0f7ff;">
            <h3 style="color: #1a365d;">Built on Theory</h3>
            <p style="max-width: 700px; margin: 0 auto;">
                Peter Naur argued that a program's "theory" &mdash; the mental model of how problem maps to solution &mdash; cannot be fully documented.
                This experiment tests that claim: for LLM-generated code, the theory <em>can</em> be externalized in structured documentation. And for legacy code, a recursive question tree can recover most of it.
            </p>
            <p style="margin-top: 1rem;">
                <a href="https://llm-coding.github.io/Semantic-Anchors/brownfield" class="btn btn-primary">Brownfield Workflow</a>
                <a href="https://llm-coding.github.io/Semantic-Anchors/spec-driven-development" class="btn btn-outline-secondary">Spec-Driven Development</a>
            </p>
        </div>
    </main>
</div>
