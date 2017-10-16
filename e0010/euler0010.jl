#!/usr/bin/julia
import Primes
function sumprimes(n::Int)
  #primnumbers = SharedArray{Int}(n)
  primesum=2
  parasum = @parallel (+) for i in 3:2:n
    Primes.isprime(i)*i
  end
  primesum+=parasum
end
sumprimes(10)
@time prime = sumprimes(2000000)
print(prime)
