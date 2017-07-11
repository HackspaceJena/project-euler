library(numbers)
library(microbenchmark)

####
#    limit: Obere Grenze für die Summe der Primzahltripel
#
#    Gibt die Anzahl der einmaligen Primzahltripel 
#    bis zu einer oberen Grenze zurück.
####
simple87 <- function(limit) {
   primes <- Primes(1, ceiling(limit^(1/2)))

   x2 <- primes^2
   x3 <- primes^3
   x4 <- primes^4
   x2 <- x2[x2 < limit]
   x3 <- x3[x3 < limit]
   x4 <- x4[x4 < limit]

   x <- expand.grid(x2, x3, x4)
   xSums <- rowSums(x)
   length(unique(xSums[xSums < limit]))
}

# Wir erzeugen die Kombinationen selbst und
# generieren eine Matrix über cbind()
# Dadurch spart man sich die matrix <-> data.frame Konvertierung
faster87<-function(limit) {
   primes <- Primes(1, ceiling(sqrt(limit)))

   x2 <- primes^2
   x3 <- primes^3
   x4 <- primes^4
   x2 <- x2[x2 < limit]
   x3 <- x3[x3 < limit]
   x4 <- x4[x4 < limit]

   x <- cbind(rep(x2, each=length(x3)*length(x4)),
              rep(x3, times=length(x2)*length(x4)),
              rep(x4, times=length(x2)*length(x3))
             )

   xSums <- rowSums(x)
   length(unique(xSums[xSums < limit]))
}

ress <- microbenchmark(simple87(5e7), faster87(5e7), times=500L)

