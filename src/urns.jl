
"Unique identifiers expressible in the syntax of the IETF's URN specification."
abstract type Urn end 

"""
$(SIGNATURES)
Splits a string on colons (separator for top-level components of URNs).

# Examples
```julia-repl
julia> components("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
```
"""
function components(uString::AbstractString)
    split(uString, ":")
end

"""
$(SIGNATURES)
Splits a URN's string representation into top-level components.
"""
function components(u::U) where {U <: Urn}
    split(string(u), ":")
end

"""
$(SIGNATURES)
Splits a string on periods (seprator for parts within components of URNs).

# Examples
```julia-repl
julia> parts("tlg0012.tlg001.msA")
```
"""
function parts(componentString::AbstractString)
    split(componentString,".")
end


"""Urn subtypes should implement `dropversion(urn::U)::U`.

$(SIGNATURES)
"""
function dropversion  end


"""Urn subtypes should implement `addversion(urn::U, versionid)::U`.  

$(SIGNATURES)
"""
function addversion end

"""Urn subtypes should implement `urnmatches(urn1::U, urn2::U)::Bool`.

$(SIGNATURES)
"""
function urnmatches end
    



"""Urn subtypes should implement `urncontains(urn1::U, urn2::U)::Bool`
"""
function urncontains end
