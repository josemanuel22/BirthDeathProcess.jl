using Distributions
using Random

export random

Random.seed!(1234);

random()::Number = rand(Uniform(0, 1))

#https://www.compadre.org/picup/exercises/exercise.cfm?A=BirthDeath

#https://www.youtube.com/watch?v=VBtg2xUnNBo