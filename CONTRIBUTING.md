# Contributing to nf-modules

Thank you for your interest in contributing to the BigBio nf-modules repository!

## Module Standards

All modules in this repository must follow nf-core module standards:

### Module Structure

Each module should have:

- `main.nf` - The main module implementation
- `meta.yml` - Module metadata and documentation
- `environment.yml` - Conda environment specification

### Module Requirements

1. **DSL2 Syntax**: All modules must use Nextflow DSL2
2. **Container Support**: Modules should support both Docker and Singularity
3. **Conda Environment**: Provide a conda environment.yml file
4. **Metadata**: Include a meta map for sample tracking
5. **Version Reporting**: Emit a versions.yml file
6. **Stub Section**: Include a stub for testing

### Example Module Structure

```
modules/nf-core/toolname/
├── main.nf
├── meta.yml
└── environment.yml
```

## Testing

All modules must include tests:

```
tests/modules/nf-core/toolname/
├── main.nf
└── nextflow.config
```

## Code Style

- Follow the `.editorconfig` settings
- Use 4 spaces for indentation in `.nf` files
- Use 2 spaces for indentation in `.yml` files
- Run prettier before committing: `prettier --write .`

## Pull Request Process

1. Fork the repository
2. Create a feature branch
3. Add your module following the structure above
4. Add tests for your module
5. Ensure all CI checks pass
6. Submit a pull request

## Questions?

If you have questions, please open an issue in the repository.
