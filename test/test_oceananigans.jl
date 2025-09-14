# Oceananigans integration tests for xESMF.jl
# This file contains tests that require Oceananigans.jl as a dependency
# To enable these tests, add Oceananigans to the [extras] and [targets] sections in Project.toml

# Uncomment the following lines when Oceananigans.jl is available as a test dependency:

# using Oceananigans
# using xESMF

# @testset "Oceananigans Integration Tests" begin
#     @testset "Grid Regridding Tests" begin
#         # Create test grids as per the user's example
#         tg = TripolarGrid(size=(360, 170, 1), z=(0, 1))
#         ll = LatitudeLongitudeGrid(size=(360, 180, 1), longitude=(0, 360), latitude=(-90, 90), z=(0, 1))
#         
#         # Create center fields
#         ctg = CenterField(tg)
#         cll = CenterField(ll)
#         
#         # Test that we can create regridding weights
#         # Note: This will test the actual functionality with real Oceananigans grids
#         weights = xESMF.sparse_regridding_weights(cll, ctg)
#         @test !isnothing(weights)
#         
#         # Test that the grids have the expected properties
#         @test size(tg) == (360, 170, 1)
#         @test size(ll) == (360, 180, 1)
#         
#         # Test that center fields are created successfully
#         @test ctg isa CenterField
#         @test cll isa CenterField
#     end
#     
#     @testset "Grid Properties Tests" begin
#         # Test different grid configurations
#         small_tg = TripolarGrid(size=(10, 10, 1), z=(0, 1))
#         small_ll = LatitudeLongitudeGrid(size=(10, 10, 1), longitude=(0, 360), latitude=(-90, 90), z=(0, 1))
#         
#         @test size(small_tg) == (10, 10, 1)
#         @test size(small_ll) == (10, 10, 1)
#         
#         # Test that we can create fields on smaller grids
#         small_ctg = CenterField(small_tg)
#         small_cll = CenterField(small_ll)
#         
#         @test small_ctg isa CenterField
#         @test small_cll isa CenterField
#     end
# end

# Placeholder test to prevent empty test file
@testset "Oceananigans Integration (Disabled)" begin
    @test true  # Placeholder - enable when Oceananigans is available
end
