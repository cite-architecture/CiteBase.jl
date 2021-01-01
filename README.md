# CitableBase.jl

A Julia module defining the two core abstractions of the CITE architecture:

1. identifiers expressible using the syntax of the IETF URN specification
2. citable units, identified by URN, and including a human-readable label

Although the package includes a few trivial convenience functions, its main purpose is to provide types that can be extended for specific types of URNs and specific types of citable entities.  See:

- [CitableText.jl](https://github.com/cite-architecture/CitableText.jl)
- CitableObject.jl (in progress)
- CitableImage.jl (in progress)
