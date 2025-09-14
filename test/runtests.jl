using Test
using xESMF

@testset "xESMF.jl Tests" begin
    @testset "Unit Tests" begin
        include("test_unit.jl")
    end
    
    @testset "Regridder Tests" begin
        include("test_regridder.jl")
    end
    
    @testset "Integration Tests" begin
        include("test_integration.jl")
    end
end
