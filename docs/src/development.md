# Development

This page provides information for developers and contributors to xESMF.jl.

## Development Setup

### Prerequisites

- Julia 1.10 or later
- Git

### Setting Up the Development Environment

1. Clone the repository:
   ```bash
   git clone https://github.com/gregorywagner/xESMF.jl.git
   cd xESMF.jl
   ```

2. Start Julia and activate the project:
   ```julia
   julia --project=.
   ```

3. Install dependencies:
   ```julia
   using Pkg
   Pkg.instantiate()
   ```

4. Run tests:
   ```julia
   Pkg.test()
   ```

## Building Documentation

To build the documentation locally:

1. Navigate to the docs directory:
   ```bash
   cd docs
   ```

2. Install documentation dependencies:
   ```julia
   julia --project=. -e "using Pkg; Pkg.develop(PackageSpec(path=\"..\")); Pkg.instantiate()"
   ```

3. Build the documentation:
   ```julia
   julia --project=. docs/make.jl
   ```

The built documentation will be available in `docs/build/`.

## Running Tests

The package includes a comprehensive test suite:

```bash
julia --project=. -e "using Pkg; Pkg.test()"
```

### Test Categories

- **Unit Tests**: Basic module functionality and imports
- **Regridder Tests**: Core regridding functionality
- **Integration Tests**: Module integration with dependencies

### Adding New Tests

When adding new functionality, please add corresponding tests:

1. Add unit tests to `test/test_unit.jl`
2. Add functionality-specific tests to `test/test_regridder.jl`
3. Add integration tests to `test/test_integration.jl`

## Code Style

Please follow Julia style guidelines:

- Use 4 spaces for indentation
- Use descriptive variable names
- Add docstrings for all public functions
- Include type annotations where helpful

## Contributing

### Pull Request Process

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Add tests for new functionality
5. Ensure all tests pass: `julia --project=. -e "using Pkg; Pkg.test()"`
6. Update documentation if needed
7. Submit a pull request

### Documentation Updates

When adding new functionality:

1. Update the relevant documentation pages
2. Add docstrings to new functions
3. Include examples in the documentation
4. Update the API reference

## Dependencies

### Core Dependencies

- **CondaPkg.jl**: Manages Python dependencies
- **PythonCall.jl**: Python-Julia interoperability
- **SparseArrays.jl**: Sparse matrix operations

### Development Dependencies

- **Test.jl**: Testing framework
- **Documenter.jl**: Documentation generation

### Python Dependencies

- **xesmf**: Python regridding library (installed via CondaPkg)

## Continuous Integration

The package uses GitHub Actions for:

- **Testing**: Runs on Julia 1.10 and 1.11 across multiple operating systems
- **Documentation**: Automatically builds and deploys documentation

## Release Process

1. Update version number in `Project.toml`
2. Update `CHANGELOG.md` with new features and bug fixes
3. Create a git tag: `git tag v0.1.0`
4. Push the tag: `git push origin v0.1.0`
5. GitHub Actions will automatically create a release

## Issues and Bug Reports

Please report issues and bugs on the GitHub issue tracker. When reporting bugs, please include:

- Julia version
- Operating system
- Minimal reproducible example
- Expected vs. actual behavior

## License

This project is licensed under the same terms as the Julia language itself.
