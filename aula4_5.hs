import Data.List

ex31 :: Int -> Int
ex31 0 = 1
ex31 n = ex31(n-1)* 2

ex32a :: [Bool] -> Bool
ex32a [] = True
ex32a (x:xs) = x && (ex32a xs)

ex32b :: [Bool] -> Bool
ex32b [] = False
ex32b (x:xs) = x || (ex32b xs)

ex32c :: [[a]] -> [a]
ex32c [[]] = []
ex32c ((x:xs):ys) = (x:xs) ++ ( ex32c ys )

ex32d :: Int -> a -> [a]
ex32d 0 x = []
ex32d n x = [x] ++ ( ex32d (n-1) x )

ex32e :: [a] -> Int -> a
ex32e (x:xs) n | n == 0 = x
               | otherwise = ex32e xs (n-1)

ex32f :: Eq a => a -> [a] -> Bool
ex32f n [] = False
ex32f n (x:xs) | n == x = True
               | otherwise = ex32f n xs

ex33a :: [[a]] -> [a]
ex33a xss = [ x | xs <- xss, x <- xs ]

ex33b :: Int -> a -> [a]
ex33b n x = [ x | y <- [1..n] ]

ex33c :: [a] -> Int -> a
ex33c xs n = head [ x | x <- (drop n xs) ]

ex34a :: Int -> Int
ex34a n = (sec34a n 1)

sec34a :: Int -> Int -> Int
sec34a n k | k*k >= n = k
           | otherwise = sec34a n (k+1)

ex34b :: Int -> Int
ex34b n = head [ k | k <- [n,n-1..1], k*k <= n ]

ex35a :: Num a => a -> a
ex35a 0 = 1
ex35a n = n * ex35a(n-1)

ex35b :: Int -> Int -> Int
ex35b x y | ( x == y ) = y
          | otherwise = x * ( ex35b (x+1) y )

ex35c :: Int -> Int
ex35c x | ( x == 1 ) = 1
        | otherwise = x * ( ex35c (x-1) )

ex36 :: Int -> Int -> Int
ex36 a b | ( b == 0 ) = a
         | otherwise = ( ex36 b (a `mod` b) )

ex37 (x:xs) = nub (x:xs)


ex38 :: a -> [a] -> [a]
ex38 k [] = []
ex38 k [x] = [x]
ex38 k (x:xs) = x : k : ( ex38 k xs )

--plusplus :: [a] -> [a] -> [a]
--plusplus [] xs = xs
--plusplus (x:y) xs = x : plusplus(y xs)

ex42a :: Ord a => a -> [a] -> [a]
ex42a v []  = [v]
ex42a v (h:t) | (v>h) = h : (ex42a v t)
              | otherwise = (v:h:t)

ex42b :: (Ord a) => [a] -> [a]
ex42b [] = []
ex42b (h:t) = ex42a h (ex42b t)

ex43a :: Ord a => [a] -> a
ex43a [x] = x
ex43a (x:xs) = min x (ex43a xs)

ex43b :: Eq a => a -> [a] -> [a]
ex43b v [] = []
ex43b v (x:xs) | (x == v) = xs
               | otherwise =  x : ex43b v xs

ex43c :: Ord a => [a] -> [a]
ex43c [] = []
ex43c xs = m: (ex43c (ex43b m xs))
         where m = ex43a xs

--ex43c [2,1,6]
-- 1 : (ex43c (ex43b 1 [2,1,6]))
-- 1 : (ex43c (2,6))
-- 1 : (ex43c (ex43b 2 [2,6]))
-- 1 : 2 : ex43c (6)
-- 1 : 2 : 6: (ex43c (ex46c 6 [6]))
-- 1 : 2 : 6 : ex43c []
-- [1,2,6]


ex44a :: Ord a => [a] -> [a] -> [a]
ex44a l [] = l
ex44a [] l = l
ex44a (x:xs) (y:ys) | x > y = y : (ex44a (x:xs) ys)
                    | otherwise = x :(ex44a xs (y:ys))

ex44b :: [a] -> ([a],[a])
ex44b l = (x1,x2)
       where x1 = take s l
             x2 = drop s l
             s = div (length l) 2

merge :: Ord a => [a] -> [a]
merge [] = []
merge [x] = [x]
merge xs = ex44a (merge l1)(merge l2)
         where (l1,l2) = ex44b xs

--ex45 :: Int → [[Bool]]
ex45 0 = [[]]
ex45 1 = [[False],[True]]
ex45 n = ex45s (n-1)

ex45s y = [ [x] | x <- [True,False]]



ex46 :: Eq a => [a] -> [[a]]
ex46 [] = [[]]
ex46 l = [ c:r | c <- l, r <- ex46 (delete c l)]

ex46s :: Eq a => [a] -> [[a]]
ex46s = nub . ex46
