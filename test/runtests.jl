include("setup_runtests.jl")

@testset "xESMF.jl Tests" begin
    @testset "Unit Tests" begin
        include("test_unit.jl")
    end
    
    @testset "Oceananigans Integration Tests" begin
        include("test_oceananigans.jl")
    end
end