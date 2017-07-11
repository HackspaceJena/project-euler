#/usr/bin/julia

function sumOfSquares(x)
    sum(x.^2)
end

function squareOfSum(x)
    sum(x)^2
end

function euler0006(x)
    seq=1:x
    squareOfSum(seq) - sumOfSquares(seq)
end

euler0006(1)
@time euler0006(100)
