# Basic functionality tests for xESMF.jl

using PythonCall

@testset "Basic Module Tests" begin
    # Test that the module loads correctly
    @test isdefined(xESMF, :xesmf)
    
    # Test that the main function is available
    @test isdefined(xESMF, :sparse_regridder_weights)
    
    # Test that xesmf Python module is imported
    @test xESMF.xesmf isa PythonCall.Py
end
