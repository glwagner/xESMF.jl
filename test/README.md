# Test Suite for xESMF.jl

This directory contains the test suite for the xESMF.jl package.

## Test Files

- `runtests.jl` - Main test runner that includes all test files
- `test_unit.jl` - Unit tests for basic module functionality
- `test_regridder.jl` - Tests for regridder-specific functionality
- `test_integration.jl` - Integration tests for module dependencies
- `test_oceananigans.jl` - Oceananigans integration tests (disabled by default)

## Running Tests

To run all tests:
```bash
julia --project=. -e "using Pkg; Pkg.test()"
```

To run tests with code coverage:
```bash
julia --project=. --code-coverage -e "using Pkg; Pkg.test()"
```

## Adding Oceananigans.jl Integration Tests

To enable the Oceananigans integration tests:

1. Add Oceananigans to the `[extras]` section in `Project.toml`:
   ```toml
   [extras]
   Test = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
   Oceananigans = "9e8cae18-63c1-5223-a75c-80ca9d6e52a8"
   ```

2. Add Oceananigans to the `[targets]` section:
   ```toml
   [targets]
   test = ["Test", "Oceananigans"]
   ```

3. Uncomment the test code in `test_oceananigans.jl`

4. Update `runtests.jl` to include the Oceananigans tests:
   ```julia
   @testset "Oceananigans Integration Tests" begin
       include("test_oceananigans.jl")
   end
   ```

## Test Structure

The test suite is organized into several categories:

- **Unit Tests**: Test individual functions and module loading
- **Regridder Tests**: Test the core regridding functionality
- **Integration Tests**: Test module integration with dependencies
- **Oceananigans Tests**: Test integration with Oceananigans.jl (when available)

## GitHub Actions

The test suite is automatically run on GitHub Actions for:
- Multiple Julia versions (1.6, 1.8, 1.9, 1.10, 1.11)
- Multiple operating systems (Ubuntu, Windows, macOS)
- Multiple architectures (x64, x86 where available)
- Code coverage reporting
