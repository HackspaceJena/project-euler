#!/usr/bin/julia

function euler007(n)
    if n < 1
        return NaN
    elseif n == 1
        return 2
    end

    primes = Array{Int64, 1}([])
    foundCount = 1
    number = 3

    while foundCount < n
        isPrime = true
        for prime ∈ primes
            if number % prime == 0
                isPrime = false
                break
            end
        end

        if isPrime
            push!(primes, number)
            foundCount += 1
        end

        number += 2
    end

    return last(primes)
end

euler007(1)

@time euler007(10001)
