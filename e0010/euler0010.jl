#!/usr/bin/julia
import Primes
function sumprimes(n::Int)
  #primnumbers = SharedArray{Int}(n)
  primesum=2
  parasum += @parallel (+) for i in 3:2:n
    Primes.isprime(i)*i
  end
  primesum
end
sumprimes(11)
print(2)
@time prime = sumprimes(7)
print(prime)
