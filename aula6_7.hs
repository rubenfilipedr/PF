import Data.List



ex48a :: [a] -> [a] -> [a]
ex48a l1 l2 = foldr(:) l2 l1

ex48b :: [[a]] -> [a]
ex48b l = foldr (++) [] l

ex48c :: [a] -> [a]
ex48c [] = []
ex48c (x:xs) = ex48c xs ++ [x]

ex48d :: [a] -> [a]
ex48d l = foldl(\x y -> y:x) [] l

ex48e :: Eq a => a -> [a] -> Bool
ex48e z l = any (\x -> x == z) l

ex49 :: [Int] -> Int
ex49 l = foldl(\x y -> 10 * x + y) 0 l

--foldl f 0 [2,3,4,5]
--f (f (f (f 0 2) 3 ) 4 ) 5
--f f (f (f 2 3) 4) 5
--f (f (f 23 4) 5)
--f 234 5
--2345

ex50 :: (a -> b -> c) -> [a] -> [b] -> [c]
ex50 f [] _ = []
ex50 f _ [] = []
ex50 f (x:xs) (y:ys) = f x y : ex50 f xs ys

insertt :: Ord a => a -> [a] -> [a]
insertt v []  = [v]
insertt v (h:t) | (v>h) = h : (insertt v t)
                | otherwise = (v:h:t)

ex51 :: Ord a => [a] -> [a]
ex51 l = foldr insertt [] l

ex52a :: [a] -> [a]
ex52a (x:xs) = xs ++ [x]

--ex52b :: [a] -> [a]
--ex52b l = foldr(\x y -> (y ++ [(ex52a (head y))]) ) [l] (tail l) obter explicaçao

ex53a :: Ord a => [a] -> a
ex53a l = foldl1 max l

ex53b f l  = foldr f (last l) (init l)

ex53b1 f (x:xs) = foldl f x xs

div3 xs = foldr(\x y -> y 'mod' 3 == 0 && y 'mod' 2 /= 0) [] xs

---FAZER O 54
