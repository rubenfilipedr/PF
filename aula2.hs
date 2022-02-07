--ex14 :: [char]
--ex14 = ['a','b','c']

ex14c :: [(Bool , Char)]
ex14c = [(False , '0'),(True , '1')]

ex14d :: ([Bool],[Char])
ex14d = ([False, True],['0','1'])

ex14e :: [([a] -> [a])]
ex14e =   [tail, init, reverse]

--ex14f ::
--ex14f = [id, not]

ex17a :: [a] -> a
ex17a xs = head (tail xs)

ex17b :: (a,b) -> (b,a)
ex17b (x, y) = (y, x)

ex17c :: a -> b -> (a , b)
ex17c x y = (x, y)

ex17d :: Num a => a -> a
ex17d x = 2 * x

ex17e :: Fractional a => a -> a
ex17e x = x/2

ex17f :: Char -> Bool
ex17f x = x >= 'a' && x <= 'z'

--ex17g :: Ord a => a -> a -> a -> -> Bool
--ex17g = x a b = x >= a && x <= b

ex17h :: Eq a => [a] -> Bool
ex17h xs = (reverse xs) == xs

ex17i :: (a -> a) -> a -> a
ex17i f x = f (f x)

--ex19a :: Int -> (Int -> Int) -> Int
--ex19a n = f x = f (f x)

ex19b :: Char -> Bool -> Bool
ex19b c b = c >= 'a' && b

ex19c :: (Char -> Char -> Int) -> Char -> Int
ex19c f c = f c 'a'

--ex19d :: Eq a => a -> [a] -> Bool
--ex19d    [] = False
--ex19d x xs = x == (head xs)

ex19e :: Eq a => a -> [a] -> [a]
ex19e x [] = []
ex19e x xs | x == (head xs) = tail xs
           | otherwise = xs

--ex19f :: Ord a -> a -> a -> a
--ex19f :: | x > y = x
        --  | otherwise = y

--ex20 :: (a,[a]) -> Bool
        --(2, [3] ) -- certo
        --(2 , [] ) -- certo
        --(2 , True) -- errado
