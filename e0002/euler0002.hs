main :: IO()
main = do
  print (sum ret)
  where
    fibs = 1 : 2 : zipWith (+) fibs (tail fibs)
    ret = filter even (takeWhile (<= 4000000) fibs)
