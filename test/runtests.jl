using BirthDeathProcess
using Statistics
using Test

@testset "gauss" begin
    @test gaussKronrod(0,0,1,4,1)[1] == [0.0, 1.0, 2.0, 3.0, 4.0]
    @test gaussKronrod(1,0,1,5,1)[2] ≈ [1.0, 1.9999999999999998, 3.0, 3.9999999999999956, 4.999999999999994, 5.999999999999999]
    @test gaussKronrod(1,0.1,1,5,1)[2] ≈ [1.0, 1.8564632373325913, 2.6314235101321484, 3.332636013239717, 3.967119970113879, 4.541223990855394]
    @test gaussKronrod(1,0.5,1,5,1)[2] ≈ [1.0, 1.3934694031727919, 1.6321209605176084, 1.776870342095793, 1.8646629393840835, 1.917913667133106]
    @test gaussKronrod(1,1,1,5,1)[2] ≈ [1.0, 1.0, 1.0, 1.0, 1.0, 1.0]
    @test gaussKronrod(1,2,1,5,1)[2] ≈ [1.0, 0.5676669305682217, 0.5091583207981839, 0.5012375796029716, 0.5001705376558535, 0.5000247594217667]
    @test gaussKronrod(10,1,1,5,1)[2] ≈ [1.0, 6.689091805149341, 8.782000530847986, 9.55192023777464, 9.835210342139339, 9.93932761515457]
end

@testset "gillespie algorithm" begin
    @test length(gillespieAlgorithm(1,0.1,0,0)[1]) == 0
    @testset "Pure Death Processs" begin
        n_array = Float64[]
        Threads.@threads for i in 1:100
            push!(n_array, gillespieAlgorithm(0,0.001,1000,100)[2][end])
        end
        t,n = gillespieAlgorithm(0,0.001,1000,100)
        μ = 1000*exp(-0.001*t[end])
        θ = sqrt(var(n_array))
        @test μ + θ >= n[end] >= μ - θ
    end
    @testset "Pure birth Processs" begin
        n_array = Float64[]
        Threads.@threads for i in 1:100
            push!(n_array, gillespieAlgorithm(1,0,1,100)[2][end])
        end
        t,n = gillespieAlgorithm(1.3,0,1,100)
        μ = 1 + 1.3* t[end]
        θ = sqrt(var(n_array))
        @test μ + θ >= n[end] >= μ - θ
    end
    @testset "Steady State" begin
        n_array = Float64[]
        Threads.@threads for i in 1:100
            push!(n_array, gillespieAlgorithm(10,1,10,100)[2][end])
        end
        t,n = gillespieAlgorithm(10,1,10,100)
        μ = 10/1
        θ = sqrt(var(n_array))
        @test μ + θ >= n[end] >= μ - θ
    end
    @testset "Convergece to 0" begin
        n_array = Float64[]
        Threads.@threads for i in 1:100
            push!(n_array, gillespieAlgorithm(10,1,100,100)[2][end])
        end
        t,n = gillespieAlgorithm(1,2,100,100)
        μ = 10/1
        θ = sqrt(var(n_array))
        #We check it goes to zero
        @test μ + θ >= n[end] >= 0
    end
    @testset "Growth State" begin
        n_array = Float64[]
        Threads.@threads for i in 1:100
            push!(n_array, gillespieAlgorithm(1,0.1,100,100)[2][end])
        end
        t,n = gillespieAlgorithm(1,0.1,100,100)
        μ = 1/0.1
        θ = sqrt(var(n_array))
        #We check it goes to zero
        @test μ + θ >= n[end] >= μ - θ
    end
end

