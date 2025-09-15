# Examples

This page provides examples of how to use XESMF.jl in various scenarios.

## Basic Usage

The main function in XESMF.jl is `sparse_regridder_weights`, which computes sparse regridding weights from a regridder object.

```julia
using XESMF

# Example with a regridder object (mock example)
# regridder = create_regridder(source_grid, target_grid)

# Get sparse weights with default type (Float64)
# weights = sparse_regridder_weights(regridder)

# Get sparse weights with specific type
# weights_float32 = sparse_regridder_weights(Float32, regridder)
```

## Working with Oceananigans.jl

XESMF.jl is designed to work seamlessly with Oceananigans.jl for ocean modeling applications.

### Creating Grids and Fields

```julia
using Oceananigans
using XESMF

# Create different grid types
tripolar_grid = TripolarGrid(size=(360, 170, 1), z=(0, 1))
latlon_grid = LatitudeLongitudeGrid(
    size=(360, 180, 1), 
    longitude=(0, 360), 
    latitude=(-90, 90), 
    z=(0, 1)
)

# Create center fields on the grids
tripolar_field = CenterField(tripolar_grid)
latlon_field = CenterField(latlon_grid)
```

### Computing Regridding Weights

```julia
# Compute regridding weights from lat-lon to tripolar grid
# weights = sparse_regridding_weights(latlon_field, tripolar_field)

# The weights matrix can then be used for efficient regridding
# regridded_data = weights * source_data
```

## Type Flexibility

XESMF.jl supports different numeric types for the regridding weights:

```julia
# Float64 (default)
# weights_f64 = sparse_regridder_weights(regridder)

# Float32
# weights_f32 = sparse_regridder_weights(Float32, regridder)

# Int64
# weights_i64 = sparse_regridder_weights(Int64, regridder)
```

## Error Handling

The package includes proper error handling for invalid inputs:

```julia
# These will throw appropriate errors:
# sparse_regridder_weights()  # MethodError: no arguments
# sparse_regridder_weights(Float64)  # MethodError: missing regridder
```

## Performance Considerations

- Sparse matrices are used for memory efficiency
- The Python xESMF library handles the heavy computational work
- Type conversion is optimized for Julia's type system
