module Dispersions

using Combinatorics
using AbstractFFTs, FFTW
using LinearAlgebra
using ShiftedArrays
using FastGaussQuadrature

# general types
export KGrid

# access functions
export gridPoints, Nk, gridshape, dispersion

# grid functions
export conv, conv!, conv_fft, conv_fft!, conv_fft1, conv_fft1!

# grids 
export gen_kGrid, SC

# sum types
export KSum
# functions
export kintegrate


include("Types.jl")
include("KGrid.jl")
include("common.jl")
include("IO.jl")
# include("SC.jl")
# include("FCC.jl")
# include("hexagonal.jl")
# include("BZIntegration.jl")


end

#TODO:iplement input fro mfile
#TODO: implement https://arxiv.org/pdf/2104.05856.pdf
