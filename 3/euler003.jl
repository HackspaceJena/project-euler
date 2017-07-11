#!/usr/bin/julia

function isPrime(number)
    if number in [2,3, 5]
        return true
    elseif number % 2 == 0
        return false
    end

    for i ∈ range(3, 2, floor(Int64, √number))
        if number % i == 0
            return false
        end
    end
    return true
end

function findDivisors(number)
    divisors = Set{Int64}(1)
    LIMIT = trunc(√number)
    for num ∈ 2:LIMIT
        if number % num == 0
            push!(divisors, num)
            continue
        end
    end

    union!(divisors, map(x -> div(number, x), divisors))
    return divisors
end

function euler003(number)
    divisors = findDivisors(number)
    primeFactors = filter(isPrime, divisors)
    println("$(number) -> $(maximum(primeFactors))")
end

# trigger compilation
euler003(3)
# now solve the actual task
@time euler003(600851475143)
