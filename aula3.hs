ex22 :: Int -> Int
ex22 n = sum[ x * x | x <- [1..n] ]

ex23a :: Int -> Double
ex23a n = 4* (sum[ f x | x <- [0..n] ])
  where f a = (-1)^a / fromIntegral((2*a)+1)

ex23b :: Int -> Double
ex23b n = 12 * (sum[ f x | x <- [0..n] ])
    where f a = (-1)^a / fromIntegral((a+1)*(a+1))

ex24 :: Int -> [Int]
ex24 n = [x | x <- [1..n], n `mod` x == 0]

ex25 :: Int -> [Int]
ex25 n = [ x | x <- [1..n], sum ( ex24 x ) == x ]


ex26a :: Int -> Bool
ex26a n = (length(ex24 n)== 2)

ex27 :: Int -> [[Int]]
ex27 n = [(linha a) | a <- [0..n]]

binom :: Int -> Int -> Int
binom n k = (product [(k+1)..n]) `div` (product ([1..(n-k)]))

linha :: Int -> [Int]
linha n = [ binom n k | k <- [0..n] ]

--ex28 :: [Float] → [Float] → Float
ex28 xs ys = sum [(x*y) | (x,y) <- zip xs ys]
--ex28 a b = sum(zipWith(*) a b)

--ex29 :: Int → [(Int, Int, Int)]
ex29 n = [ (x,y,z) | x <- [1..n] , y <-[1..n] , z <-[1..n], (x*x) + (y*y) == (z*z)]


ex30 :: String -> Bool
ex30 txt | length([ c | c <- txt , c >= 'a' && c <= 'z' || c>= 'A' && c <= 'Z' ]) < 8 = False
         | length([ c | c <- txt , c >= 'a' && c <= 'z']) < 1 = False
         | length([ c | c <- txt , c >= 'A' && c <= 'Z']) < 1 = False
         | length([ c | c <- txt , c >= '1' && c <= '9']) < 1 = False
         | otherwise = True
