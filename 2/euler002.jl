#!/usr/bin/julia

function euler002(limit)
    prevFib = 1
    fib = 1
    fibSum = 0

    while fib < limit
        if fib % 2 == 0
            fibSum += fib
        end

        nextFib = prevFib + fib
        prevFib = fib
        fib = nextFib
    end

    return fibSum
end

euler002(1)

@time euler002(4*10^6)
