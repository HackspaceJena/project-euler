#!/usr/bin/julia

function isPrime(number::UInt64)
    if number in [2,3,5]
        return true
    elseif number % 2 == 0
        return false
    end

    for i ∈ range(3, 2, floor(UInt64, √number))
        if number % i == 0
            return false
        end
    end
    return true
end

function generatePrimeList(number::UInt64)
    primeList = Array{UInt64,1}([2])
    limit = div(number-1, 2)

    for i ∈ range(3, 2, limit)
        if isPrime(i)
            push!(primeList, i)
        end
    end

    primeList
end

function euler005(number::UInt64)
    primeList = generatePrimeList(number)
    exponents = floor.(UInt64, log.(primeList, number))
    prod(primeList .^ exponents)
end

euler005(1)
@time euler005(20)
