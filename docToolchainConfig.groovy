outputPath = 'build'

inputPath = 'src/docs'

inputFiles = [
    [file: 'reports/010-consolidated.adoc',              formats: ['html']],
    [file: 'reports/020-experiment-1a-direct.adoc',      formats: ['html']],
    [file: 'reports/030-experiment-1c-socratic.adoc',    formats: ['html']],
    [file: 'reports/040-experiment-2-twophase.adoc',     formats: ['html']],
    [file: 'reports/050-experiment-fair-comparison.adoc', formats: ['html']],
]

imageDirs = ['images/.']

microsite = [:]

microsite.with {
    contextPath = '/'
    host = 'https://llm-coding.github.io/brownfield-experiment'
    title = 'Brownfield Experiment'
    landingPage = 'landingpage.gsp'
    footerGithub = 'https://github.com/LLM-Coding/brownfield-experiment'
    footerText = '<small class="text-white">built with <a href="https://doctoolchain.org">docToolchain</a></small>'
    issueUrl = 'https://github.com/LLM-Coding/brownfield-experiment/issues/new'
    gitRepoUrl = 'https://github.com/LLM-Coding/brownfield-experiment/edit/main/src/docs'
    menu = ['reports':'Reports', 'prompts':'Prompts']
}
