# Comparison using URN logic

You can make citable objects comparable with each other or with collections of other citable objects using URN similarity or URN containment by implementing the `UrnComparisonTrait`.  Import the trait, define your type, and declare its trait value to be `UrnComparable()`.


## Comparing individual objects


Subtypes of `Urn` are automatically categorized as `UrnComparable()`, but you can define the trait for any type.


```jldoctest citable
import CitableBase: UrnComparisonTrait
struct UrnThing
    urn::AbstractString
end
UrnComparisonTrait(x::UrnThing)  = UrnComparable()

# output

UrnComparisonTrait
```

To fulfill the trait's contract, we need to implement two functions, `urncontains` and `urnsimilar`.  For this example, we'll just say that any pair of `UrnThing`s starting with the `fake` class contain each other and are similar.

```jldoctest citable
import CitableBase: urncontains
function urncontains(u1::UrnThing, u2::UrnThing)
    startswith(u1.urn, "urn:fake:") && startswith(u2.urn, "urn:fake:")
end


import CitableBase: urnsimilar
function urnsimilar(u1::UrnThing, u2::UrnThing)
    urncontains(u1, u2)
end

# output

urnsimilar (generic function with 2 methods)
```

Let's try it out.


```jldoctest citable
thing1 = UrnThing("urn:fake:id.subid")
thing2 = UrnThing("urn:fake:id2")
thing3 = UrnThing("urn:notevenfake:id")
urnsimilar(thing1, thing2)

# output

true
```

```jldoctest citable
urnsimilar(thing1, thing3)

# output

false
```

```jldoctest citable
urncontains(thing1, thing2)

# output

true
```

## Filtering lists of citable objects 

We'll define a type with a collection of citable objects, and make it `UrnComparable` in exactly the same way.

```jldoctest citable
struct UrnThingList
    arr::Vector{UrnThing}
end
UrnComparisonTrait(x::UrnThingList)  = UrnComparable()
 
# output

UrnComparisonTrait
```

Now we'll use URN logic to filter the collection for matching content.  In this implementation, the function returns a (possibly empty) list of `UrnThing`s.
 
```jldoctest citable
function urncontains(urnlist::UrnThingList, uthing::UrnThing)
    filter(u -> urncontains(uthing, u), urnlist.arr)
end

function urnsimilar(urnlist::UrnThingList, uthing::UrnThing)
    urncontains(urnlist, uthing)
end

# output

urnsimilar (generic function with 3 methods)
```


```jldoctest citable
ulist = UrnThingList([thing1, thing2, thing3])
urnsimilar(ulist, thing1)

# output

2-element Vector{UrnThing}:
 UrnThing("urn:fake:id.subid")
 UrnThing("urn:fake:id2")
```