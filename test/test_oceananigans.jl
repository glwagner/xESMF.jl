# Oceananigans integration tests for xESMF.jl
# This file contains tests that require Oceananigans.jl as a dependency
# To enable these tests, add Oceananigans to the [extras] and [targets] sections in Project.toml

# Oceananigans.jl is now available as a test dependency

using Oceananigans
using xESMF

x_node_array(x::AbstractVector, Nx, Ny) = view(x, 1:Nx) |> Array
y_node_array(x::AbstractVector, Nx, Ny) = view(x, 1:Ny) |> Array
x_node_array(x::AbstractMatrix, Nx, Ny) = view(x, 1:Nx, 1:Ny) |> Array

x_vertex_array(x::AbstractVector, Nx, Ny) = view(x, 1:Nx+1) |> Array
y_vertex_array(x::AbstractVector, Nx, Ny) = view(x, 1:Ny+1) |> Array
x_vertex_array(x::AbstractMatrix, Nx, Ny) = view(x, 1:Nx+1, 1:Ny+1) |> Array

y_node_array(x::AbstractMatrix, Nx, Ny) = x_node_array(x, Nx, Ny)
y_vertex_array(x::AbstractMatrix, Nx, Ny) = x_vertex_array(x, Nx, Ny)

function regridding_weights(dst_field, src_field)
    ℓx, ℓy, ℓz = Oceananigans.Fields.instantiated_location(src_field)

    # We only support regridding between centered fields.
    @assert ℓx isa Center
    @assert ℓy isa Center
    @assert (ℓx, ℓy, ℓz) == Oceananigans.Fields.instantiated_location(dst_field)

    dst_grid = dst_field.grid
    src_grid = src_field.grid

    # Extract center coordinates from both fields
    λᵈ = λnodes(dst_grid, Center(), Center(), ℓz, with_halos=true)
    φᵈ = φnodes(dst_grid, Center(), Center(), ℓz, with_halos=true)
    λˢ = λnodes(src_grid, Center(), Center(), ℓz, with_halos=true)
    φˢ = φnodes(src_grid, Center(), Center(), ℓz, with_halos=true)

    # Extract cell vertices
    λvᵈ = λnodes(dst_grid, Face(), Face(), ℓz, with_halos=true)
    φvᵈ = φnodes(dst_grid, Face(), Face(), ℓz, with_halos=true)
    λvˢ = λnodes(src_grid, Face(), Face(), ℓz, with_halos=true)
    φvˢ = φnodes(src_grid, Face(), Face(), ℓz, with_halos=true)

    # Build data structures expected by xESMF.
    Nˢx, Nˢy, Nˢz = size(src_field)
    Nᵈx, Nᵈy, Nᵈz = size(dst_field)

    λᵈ = x_node_array(λᵈ, Nᵈx, Nᵈy)
    φᵈ = y_node_array(φᵈ, Nᵈx, Nᵈy)
    λˢ = x_node_array(λˢ, Nˢx, Nˢy)
    φˢ = y_node_array(φˢ, Nˢx, Nˢy)

    λvᵈ = x_vertex_array(λvᵈ, Nᵈx, Nᵈy)
    φvᵈ = y_vertex_array(φvᵈ, Nᵈx, Nᵈy)
    λvˢ = x_vertex_array(λvˢ, Nˢx, Nˢy)
    φvˢ = y_vertex_array(φvˢ, Nˢx, Nˢy)

    dst_coordinates = Dict("lat"   => λᵈ,
                           "lon"   => φᵈ,
                           "lat_b" => λvᵈ,
                           "lon_b" => φvᵈ)

    src_coordinates = Dict("lat"   => λˢ,
                           "lon"   => φˢ,
                           "lat_b" => λvˢ,
                           "lon_b" => φvˢ)

    return src_coordinates, dst_coordinates
end

@testset "Oceananigans Integration Tests" begin
    @testset "Grid Regridding Tests" begin
        # Create test grids as per the user's example
        tg = TripolarGrid(size=(360, 170, 1), z=(0, 1))
        ll = LatitudeLongitudeGrid(size=(360, 180, 1), longitude=(0, 360), latitude=(-90, 90), z=(0, 1))
        
        ctg = CenterField(tg)
        cll = CenterField(ll)

        src_coordinates, dst_coordinates = regridding_weights(ctg, cll)
        
        xesmf = add_import_pkg("xesmf")
        periodic = Oceananigans.Grids.topology(ctg.grid, 1) === Periodic
        regridder = xesmf.Regridder(src_coordinates, dst_coordinates, method; periodic)

        weights = xESMF.sparse_regridding_weights(regridder)
        @test eltype(weights) == Float64
        @test weights isa SparseMatrixCSC

        weights = xESMF.sparse_regridding_weights(Float32, regridder)
        @test eltype(weights) == Float32
    end
end
    