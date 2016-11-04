module Main where


main = do
  interact (eachline solve)

eachline f =
  unlines . map f . lines

solve expression = show (head (foldl step [] (words expression)))

step :: [Float] -> String -> [Float]
step (x:y:ys) n =
  case n of
    "+" -> (y + x):ys
    "-" -> (y - x):ys
    "*" -> (y * x):ys
    "/" -> (y / x):ys
    _   -> read n :ys

step xs n =
  read n:xs