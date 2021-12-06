using CitableBase
using Test, Documenter
import CitableBase: CitableTrait
import CitableBase: UrnComparisonTrait

include("test_urnimpl.jl")
include("test_urnmanipulation.jl")
include("test_urncomparison.jl")


# This doesn't seem to execute any tests.
# Misconfigured MetaData ?
#doctest(CitableBase; manual=false)