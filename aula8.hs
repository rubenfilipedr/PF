impares :: [Int]
impares = 1 : [n+2 | n <- impares]

ex57fatorial :: [Int]
ex57fatorial = 1 : [x * y | (x,y) <- zip ex57fatorial [1..]]

ex57fibonaci :: [Int]
ex57fibonaci = 0:1:[x + y | (x,y) <- zip ex57fibonaci (tail ex57fibonaci)]


potencias2 = 1 : [n*2 | n <- potencias2]

potencias3 = 1 : [n*3 | n <- potencias3]

potencias5 = 1 : [n*5 | n <- potencias5]

merge :: [Int] -> [Int] -> [Int]
merge (x:xs) (y:ys) | (x == y) = x: merge xs ys
                    | (x < y) = x: merge xs (y:ys)
                    | (x > y) = y: merge (x:xs) ys

hamming :: [Int]
hamming = 1 : (merge l1 (merge l2 l3))
          where l1 = map(*2) hamming
                l2 = map(*3) hamming
                l3 = map(*5) hamming



ex59 :: [Int] -> [Int]
ex59 l = 0 : [(x+y) | (x, y) <- zip l (ex59 l)]


ex60 :: [Int] -> [Int]
ex60 l = [1] ++ [ x+y | (x,y) <- zip l (tail l)] ++ [1]

--ex60 [1]
--[1,2,1]
--ex60 [1,2,1]
--[1,3,3,1]

ex60' l = [1] ++ (zipWith (+) l (tail l)) ++ [1]

pascal :: [[Int]]
pascal = [1] : [ex60 x | x <- pascal]

pascal1 = iterate ex60 [1]

shift :: [a] -> [a]
shift [] = []
shift (x:xs) = xs ++ [x]

rotate :: [a] -> [[a]]
rotate l = take (length l ) (l : [shift x | x <- (rotate l )])

rotate1 l  = take (length l) (iterate shift l )
