# Basic functionality tests for xESMF.jl

using PythonCall

@testset "Basic Module Tests" begin
    # Test that the module loads correctly
    @test isdefined(xESMF, :xesmf)
    
    # Test that the main function is available
    @test isdefined(xESMF, :sparse_regridder_weights)
    
    # Test that the module exports the expected functions
    @test hasmethod(xESMF.sparse_regridder_weights, Tuple{Any})
    @test hasmethod(xESMF.sparse_regridder_weights, Tuple{Type, Any})
    
    # Test that xesmf Python module is imported
    @test xESMF.xesmf isa PythonCall.Py
end

@testset "Function Signature Tests" begin
    # Test that sparse_regridder_weights has the expected method signatures
    methods_list = methods(xESMF.sparse_regridder_weights)
    @test length(methods_list) >= 2  # Should have at least 2 methods
    
    # Test that we can call the function with different type parameters
    # (We'll test actual functionality in test_regridder.jl)
    @test true  # Placeholder for now
end
