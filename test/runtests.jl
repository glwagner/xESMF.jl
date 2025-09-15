using Test
using xESMF

@testset "xESMF.jl Tests" begin
    @testset "Unit Tests" begin
        include("test_unit.jl")
    end
    
    @testset "Oceananigans Integration Tests" begin
        include("test_oceananigans.jl")
    end
end
