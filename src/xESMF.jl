module xESMF

using CondaPkg
using PythonCall
using SparseArrays

xesmf = pyimport("xesmf")

sparse_regridder_weights(regridder) =
    sparse_regridder_weights(Float64, regridder)

"""
    sparse_regridder_weights(FT, regridder)

Return the regridder weights as a sparse matrix.
"""
function sparse_regridder_weights(FT, regridder)
    coords = regridder.weights.data
    shape  = pyconvert(Tuple{Int, Int}, coords.shape)
    vals   = pyconvert(Array{FT}, coords.data)
    coords = pyconvert(Array{FT}, coords.coords)
    rows = coords[1, :] .+ 1
    cols = coords[2, :] .+ 1

    weights = sparse(rows, cols, vals, shape[1], shape[2])

    return weights
end

end # module xESMF
