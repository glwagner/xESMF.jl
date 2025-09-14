# xESMF.jl

[![CI](https://github.com/gregorywagner/xESMF.jl/workflows/CI/badge.svg)](https://github.com/gregorywagner/xESMF.jl/actions)
[![Documentation](https://github.com/gregorywagner/xESMF.jl/workflows/Documentation/badge.svg)](https://gregorywagner.github.io/xESMF.jl/)
[![Code Coverage](https://codecov.io/gh/gregorywagner/xESMF.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/gregorywagner/xESMF.jl)

A Julia package for sparse regridding weights using the xESMF Python library.

## Overview

xESMF.jl provides a Julia interface to the xESMF (xarray Earth System Model Exchange Format) Python library, enabling efficient computation of sparse regridding weights for Earth system models. This package is particularly useful for working with Oceananigans.jl and other geophysical modeling packages.

## Features

- **Sparse Regridding Weights**: Compute sparse matrices for efficient regridding between different grid types
- **Python Integration**: Seamless integration with the xESMF Python library via PythonCall.jl
- **Oceananigans Compatible**: Designed to work with Oceananigans.jl grids and fields
- **Type Flexibility**: Support for different numeric types (Float64, Float32, etc.)

## Installation

```julia
using Pkg
Pkg.add("xESMF")
```

## Quick Start

```julia
using xESMF

# Create a regridder (example with mock data)
# regridder = create_regridder(source_grid, target_grid)

# Get sparse regridding weights
# weights = sparse_regridder_weights(regridder)
```

## Dependencies

xESMF.jl depends on:
- **CondaPkg.jl**: For managing Python dependencies
- **PythonCall.jl**: For Python-Julia interoperability
- **SparseArrays.jl**: For sparse matrix operations

The package automatically installs the xESMF Python library via CondaPkg.

## Integration with Oceananigans.jl

xESMF.jl is designed to work seamlessly with Oceananigans.jl for ocean modeling applications:

```julia
using Oceananigans
using xESMF

# Create grids
tg = TripolarGrid(size=(360, 170, 1), z=(0, 1))
ll = LatitudeLongitudeGrid(size=(360, 180, 1), longitude=(0, 360), latitude=(-90, 90), z=(0, 1))

# Create center fields
ctg = CenterField(tg)
cll = CenterField(ll)

# Compute regridding weights
# weights = sparse_regridding_weights(cll, ctg)
```

## Documentation Structure

- **[API Reference](api.md)**: Complete function documentation
- **[Examples](examples.md)**: Usage examples and tutorials
- **[Development](development.md)**: Contributing and development guidelines

## License

This package is licensed under the same terms as the Julia language itself.

## Contributing

Contributions are welcome! Please see the [Development](development.md) section for guidelines.
