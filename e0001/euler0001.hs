main :: IO()
main = do
  print (sum multiples)
  where
    multiples = [x | x <- [3..999], (mod x 3 == 0) || (mod x 5 == 0)]
