# xESMF.jl

Julia wrapper for [xESMF](https://github.com/pangeo-data/xESMF), a python package maintained by [pangeo](https://pangeo.io/).

[![CI](https://github.com/glwagner/xESMF.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/glwagner/xESMF.jl/actions)
[![Documentation](https://github.com/glwagner/xESMF.jl/actions/workflows/documentation.yml/badge.svg)](https://glwagner.github.io/xESMF.jl/)

## Overview

xESMF.jl provides a Julia interface to the xESMF (xarray Earth System Model Exchange Format) Python library, which provides tools for interpolating and regridding fields between arbitrary grids.
This wrapper provides regridding functionality for [Oceananigans.jl](https://github.com/CliMA/Oceananigans.jl).

## Installation

```julia
using Pkg
Pkg.add("xESMF")
```

## Quick Start

To compute weights for regridding a field on `Oceananigans.TripolarGrid`
to a field on `Oceananigans.LatitudeLongitudeGrid`,

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
weights = sparse_regridding_weights(cll, ctg)
```

## Documentation

Documentation is available at https://glwagner.github.io/xESMF.jl/

## License

This package uses the MIT license.
