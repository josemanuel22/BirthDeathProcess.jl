using Distributions
using Random

export random

Random.seed!(1234);

random() = rand(Uniform(0, 1))

#https://www.compadre.org/picup/exercises/exercise.cfm?A=BirthDeath