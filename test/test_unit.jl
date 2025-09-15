include("setup_runtests.jl")

@testset "Basic Module Tests" begin
    # Test that the module loads correctly
    @test isdefined(XESMF, :xesmf)
    
    # Test that the main function is available
    @test isdefined(XESMF, :sparse_regridder_weights)
    
    # Test that xesmf Python module is imported
    @test XESMF.xesmf isa PythonCall.Py
end
