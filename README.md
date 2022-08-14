# BirthDeathProcess

[![Build Status](https://github.com/josemanuel22/BirthDeathProcess.jl/workflows/CI/badge.svg)](https://github.com/josemanuel22/BirthDeathProcess.jl/actions)

BirthDeathProcess process is a package that implements a series of utilities to simulate the Birth-Death process, given by the differential equation: $n' = \beta - d\cdot n$.

Two algorithms are implemented for the resolution of this simple ODE. In the first place, a classical numerical integration algorithm of the [Runge-Kutta](http://users.uoa.gr/~tsitourasc/RK54_new_v2.pdf) type and secondly, the well-known [Gillespie](https://en.wikipedia.org/wiki/Gillespie_algorithm) Monte-Carlo dynamic algorithm is implemented.

## Installation

To install BirthDeathProcess, simply use Julia's package manager:

````
julia> Pkg.add("BirthDeathProcess")
````




