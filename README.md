# BirthDeathProcess

[![Build Status](https://github.com/josemanuel22/BirthDeathProcess.jl/workflows/CI/badge.svg)](https://github.com/josemanuel22/BirthDeathProcess.jl/actions)
[![codecov](https://codecov.io/gh/josemanuel22/BirthDeathProcess.jl/branch/master/graph/badge.svg)](https://app.codecov.io/gh/josemanuel22/BirthDeathProcess.jl)
[![Documenter: stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://github.com/josemanuel22/BirthDeathProcess.jl/stable/)

BirthDeathProcess process is a package that implements a series of utilities to simulate the Birth-Death process, given by the differential equation: $n' = \beta - d\cdot n$.

Two algorithms are implemented for the resolution of this simple ODE. In the first place, a classical numerical integration algorithm of the [Runge-Kutta](http://users.uoa.gr/~tsitourasc/RK54_new_v2.pdf) type and secondly, the well-known [Gillespie](https://en.wikipedia.org/wiki/Gillespie_algorithm) Monte-Carlo dynamic algorithm is implemented.

## Installation

To install BirthDeathProcess, simply use Julia's package manager. The module is not registered so you need to clone the repository and follow the following steps:
````
julia> push!(LOAD_PATH,pwd()) # You are in the BirthDeathProcess Repository
julia> using BirthDeathProcess
````

To reproduce the enviroment for compiling the repository:
````
(@v1.6) pkg>  activate pathToRepository/BirthDeathProcess
````
## Presentation

In the presentation folder, there is a beamer with a short presentation on the birth-death process and the implemented code.



