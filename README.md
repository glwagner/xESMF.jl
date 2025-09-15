# xESMF.jl

Julia wrapper for [xESMF](https://github.com/pangeo-data/xESMF), a python package maintined by [pangeo](https://pangeo.io/).

[![CI](https://github.com/gregorywagner/xESMF.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/gregorywagner/xESMF.jl/actions)
[![Documentation](https://github.com/gregorywagner/xESMF.jl/actions/workflows/documentation.yml/badge.svg)](https://gregorywagner.github.io/xESMF.jl/)

A Julia package for sparse regridding weights using the xESMF Python library.

## Overview

xESMF.jl provides a Julia interface to the xESMF (xarray Earth System Model Exchange Format) Python library, enabling efficient computation of sparse regridding weights for Earth system models. This package is particularly useful for working with Oceananigans.jl and other geophysical modeling packages.

## Installation

```julia
using Pkg
Pkg.add("xESMF")
```

## Quick Start

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

## Features

- **Sparse Regridding Weights**: Compute sparse matrices for efficient regridding between different grid types
- **Python Integration**: Seamless integration with the xESMF Python library via PythonCall.jl
- **Oceananigans Compatible**: Designed to work with Oceananigans.jl grids and fields
- **Type Flexibility**: Support for different numeric types (Float64, Float32, etc.)

## Documentation

Full documentation is available at: https://gregorywagner.github.io/xESMF.jl/

## License

This package is licensed under the same terms as the Julia language itself.
