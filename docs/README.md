# Documentation for xESMF.jl

This directory contains the documentation for the xESMF.jl package, built using Documenter.jl.

## Building Documentation Locally

To build the documentation locally:

1. Install dependencies:
   ```bash
   julia --project=. -e "using Pkg; Pkg.develop(PackageSpec(path=\"..\")); Pkg.instantiate()"
   ```

2. Build the documentation:
   ```bash
   julia --project=. docs/make.jl
   ```

The built documentation will be available in the `build/` directory.

## Documentation Structure

- `src/index.md` - Main documentation page
- `src/api.md` - API reference
- `src/examples.md` - Usage examples
- `src/development.md` - Development guidelines
- `make.jl` - Documentation build script
- `Project.toml` - Documentation dependencies

## Automatic Deployment

The documentation is automatically built and deployed to GitHub Pages via GitHub Actions when:
- Changes are pushed to the main branch
- New tags are created

The documentation will be available at: https://gregorywagner.github.io/xESMF.jl/
