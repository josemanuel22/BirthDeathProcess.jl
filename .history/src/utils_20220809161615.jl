using Distributions
using Random

export random

Random.seed!(1234);

random() = rand(Uniform(0, 1))