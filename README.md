# ![nf-core/modules](docs/images/nfcore-modules_logo.png)

[![Nextflow](https://img.shields.io/badge/nextflow%20DSL2-%E2%89%A521.10.3-23aa62.svg?labelColor=000000)](https://www.nextflow.io/)
[![run with conda](http://img.shields.io/badge/run%20with-conda-3EB049?labelColor=000000&logo=anaconda)](https://docs.conda.io/en/latest/)
[![run with docker](https://img.shields.io/badge/run%20with-docker-0db7ed?labelColor=000000&logo=docker)](https://www.docker.com/)
[![run with singularity](https://img.shields.io/badge/run%20with-singularity-1d355c.svg?labelColor=000000)](https://sylabs.io/docs/)
[![CI](https://github.com/bigbio/nf-modules/actions/workflows/ci.yml/badge.svg)](https://github.com/bigbio/nf-modules/actions/workflows/ci.yml)

A repository for hosting [Nextflow DSL2](https://www.nextflow.io/docs/latest/dsl2.html) module files containing tool-specific process definitions and their associated documentation, specifically designed for BigBio workflows.

> **Note:** This repository complements [nf-core/modules](https://github.com/nf-core/modules) and does not replace it. BigBio workflows follow a module resolution strategy:
>
> 1. **First priority:** Use nf-core modules if available
> 2. **Second priority:** Use BigBio shared modules (this repository) if available
> 3. **Third priority:** Use local modules in the workflow repository

## Table of contents

- [Using existing modules](#using-existing-modules)
- [Adding new modules](#adding-new-modules)
- [Module resolution strategy](#module-resolution-strategy)
- [Help](#help)
- [Citation](#citation)

## Using existing modules

The module files hosted in this repository define a set of processes for software tools used in BigBio workflows. These modules follow nf-core module standards and can be shared across multiple BigBio pipelines in a modular fashion.

### Installation

1. Install the latest version of [`nf-core/tools`](https://github.com/nf-core/tools#installation) (`>=2.0`)
2. List the available modules from this repository:

```console
$ nf-core modules list remote --github-repo bigbio/nf-modules

                                      ,--./,-.
      ___     __   __   __   ___     /,-._.--~\
|\ | |__  __ /  ` /  \ |__) |__         }  {
| \| |       \__, \__/ |  \ |___     \`-._,-`-,
                                      `._,._,'

nf-core/tools version 2.0

INFO     Modules available from bigbio/nf-modules (main):                       pipeline_modules.py:164

┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ Module Name                    ┃
┡━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ thermorawfileparser            │
│ ...                            │
```

3. Install the module in your pipeline directory:

```console
$ nf-core modules install thermorawfileparser --github-repo bigbio/nf-modules

                                      ,--./,-.
      ___     __   __   __   ___     /,-._.--~\
|\ | |__  __ /  ` /  \ |__) |__         }  {
| \| |       \__, \__/ |  \ |___     \`-._,-`-,
                                      `._,._,'

nf-core/tools version 2.0

INFO     Installing thermorawfileparser                                        pipeline_modules.py:213
INFO     Downloaded 3 files to ./modules/bigbio/thermorawfileparser            pipeline_modules.py:236
```

4. Import the module in your Nextflow script:

```nextflow
#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { THERMORAWFILEPARSER } from './modules/bigbio/thermorawfileparser/main'
```

5. Remove the module from the pipeline repository if required:

```console
$ nf-core modules remove thermorawfileparser --github-repo bigbio/nf-modules

                                      ,--./,-.
      ___     __   __   __   ___     /,-._.--~\
|\ | |__  __ /  ` /  \ |__) |__         }  {
| \| |       \__, \__/ |  \ |___     \`-._,-`-,
                                      `._,._,'

nf-core/tools version 2.0

INFO     Removing thermorawfileparser                                          pipeline_modules.py:271
INFO     Successfully removed thermorawfileparser                              pipeline_modules.py:285
```

6. Check that a locally installed BigBio module is up-to-date compared to the one hosted in this repo:

```console
$ nf-core modules lint thermorawfileparser --github-repo bigbio/nf-modules

                                      ,--./,-.
      ___     __   __   __   ___     /,-._.--~\
|\ | |__  __ /  ` /  \ |__) |__         }  {
| \| |       \__, \__/ |  \ |___     \`-._,-`-,
                                      `._,._,'

nf-core/tools version 2.0

INFO     Linting pipeline: .                                                    lint.py:104
INFO     Linting module: thermorawfileparser                                    lint.py:106

╭─────────────────────────────────────────────────────────────────────────────────╮
│ [!] 1 Test Warning                                                              │
╰─────────────────────────────────────────────────────────────────────────────────╯
╭──────────────┬───────────────────────────────┬──────────────────────────────────╮
│ Module name  │ Test message                  │ File path                        │
├──────────────┼───────────────────────────────┼──────────────────────────────────┤
│ thermorawfileparser │ Local copy of module outdated │ modules/bigbio/thermorawfileparser/  │
╰──────────────┴────────────────────────────── ┴──────────────────────────────────╯
╭──────────────────────╮
│ LINT RESULTS SUMMARY │
├──────────────────────┤
│ [✔]  15 Tests Passed │
│ [!]   1 Test Warning │
│ [✗]   0 Test Failed  │
╰──────────────────────╯
```

## Adding new modules

If you wish to contribute a new module, please see the documentation on the [nf-core website](https://nf-co.re/developers/modules#writing-a-new-module-reference) for module development guidelines.

> Please be kind to our code reviewers and submit one pull request per module :)

### Module requirements

All modules must:

1. Follow nf-core module standards and structure
2. Include comprehensive documentation in `meta.yml`
3. Include test files in the `tests/` directory
4. Pass all CI/CD checks before merging
5. Be formatted according to `.editorconfig` and `.prettierrc.yml`

## Module resolution strategy

BigBio workflows follow a hierarchical module resolution strategy to maximize code reuse and maintainability:

1. **nf-core modules** (`modules/nf-core/`): Use modules from the official [nf-core/modules](https://github.com/nf-core/modules) repository when available. These are community-maintained, well-tested modules.

2. **BigBio shared modules** (`modules/bigbio/`): Use modules from this repository for BigBio-specific tools or workflows that aren't available in nf-core. These modules follow nf-core standards and are shared across BigBio workflows.

3. **Local modules** (`modules/local/`): Use workflow-specific modules only when neither nf-core nor BigBio modules are available. These should be considered for promotion to BigBio modules if they become useful for multiple workflows.

This strategy ensures:

- Maximum code reuse across workflows
- Consistent module quality and standards
- Easy maintenance and updates
- Clear separation between community and BigBio-specific modules

## Repository Structure

This repository follows the nf-core modules repository structure:

```
nf-modules/
├── modules/
│   └── bigbio/              # BigBio-specific modules
├── tests/                   # Module tests
│   ├── config/              # Test configurations
│   └── modules/             # Module-specific tests
├── .github/
│   └── workflows/           # CI/CD workflows
└── docs/                    # Documentation
```

## Help

For further information or help, please:

- Open an issue on [GitHub](https://github.com/bigbio/nf-modules/issues)
- Check the [nf-core documentation](https://nf-co.re/developers/modules) for module development guidelines
- Join the BigBio community discussions

## Citation

If you use the module files in this repository for your analysis, please cite:

> **The nf-core framework for community-curated bioinformatics pipelines.**
>
> Philip Ewels, Alexander Peltzer, Sven Fillinger, Harshil Patel, Johannes Alneberg, Andreas Wilm, Maxime Ulysse Garcia, Paolo Di Tommaso & Sven Nahnsen.
>
> _Nat Biotechnol._ 2020 Feb 13. doi: [10.1038/s41587-020-0439-x](https://dx.doi.org/10.1038/s41587-020-0439-x).

Additionally, if you use BigBio-specific modules, please cite this repository:

> **BigBio nf-modules: Shared Nextflow modules for BigBio workflows.**
>
> BigBio Community.
>
> GitHub: [bigbio/nf-modules](https://github.com/bigbio/nf-modules)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
