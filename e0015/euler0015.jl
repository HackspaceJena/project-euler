
function euler0015(n::Integer)
  n=big(n)
  Int(div(prod(n+1:2n,1),factorial(big(n))))
end

function euler0015_2(n::Integer)
  factorial(2*big(n))/factorial(big(n))^2
end

function euler0015_3(n::Integer)
  n=big(n)
  prod(n+1:2n,1)//factorial(big(n))
end

euler0015(3)
@time result=euler0015(big(20))
println(result)

euler0015_2(3)
@time result=euler0015_2(big(20))
println(Int(result))

euler0015_3(3)
@time result=euler0015_3(big(20))
println(result)
