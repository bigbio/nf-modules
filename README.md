# nf-modules

[![CI](https://github.com/bigbio/nf-modules/actions/workflows/ci.yml/badge.svg)](https://github.com/bigbio/nf-modules/actions/workflows/ci.yml)

This repository contains Nextflow DSL2 modules for quantms and other BigBio workflows, following nf-core and Nextflow standards.

## Repository Structure

This repository follows the nf-core modules repository structure:

```
nf-modules/
├── modules/
│   └── nf-core/           # nf-core compatible modules
├── subworkflows/
│   └── nf-core/           # nf-core compatible subworkflows
├── tests/
│   ├── config/            # Test configurations
│   └── modules/           # Module tests
└── .github/
    └── workflows/         # CI/CD workflows
```

## Modules

This repository contains modules for:

- **quantms**: Quantitative mass spectrometry workflows
- **BigBio workflows**: Bioinformatics workflows for biological data analysis

## Contributing

Contributions are welcome! Please ensure that:

1. All modules follow nf-core module standards
2. Code is formatted according to `.editorconfig` and `.prettierrc.yml`
3. All tests pass before submitting a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
