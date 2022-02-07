

data Arv a = Vazia | No a (Arv a) (Arv a) deriving Show

arvTeste :: Arv Int
arvTeste = No 4 (No 1 Vazia (No 3 Vazia Vazia)) (No 8 (No 7 Vazia Vazia ) Vazia)

contaArv :: Arv a -> Int
contaArv Vazia = 0
contaArv (No v esq dir) = 1 + (contaArv esq) + (contaArv dir)

sumArv ::Num a => Arv a -> a
sumArv Vazia = 0
sumArv (No v esq dir) = v + (sumArv esq) + (sumArv dir)


--ordem crescente
listar :: Arv a -> [a]
listar Vazia = []
listar (No x esq dir) = listar esq ++ [x] ++ listar dir

--ordem decrescente
listar1 :: Arv a -> [a]
listar1 Vazia = []
listar1 (No x esq dir) = listar1 dir ++ [x] ++ listar1 esq

nivel:: Int -> Arv a -> [a]
nivel _ Vazia = []
nivel 0 (No v esq dir) = [v]
nivel n (No v esq dir) = (nivel (n-1) esq) ++ (nivel (n-1) dir)

--nivel 2 No 4 (No 1 Vazia (No 3 Vazia Vazia)) No 8 ((No 7 Vazia Vazia) Vazia)
-- nivel 1 No 4 (No 1 Vazia (No 3 Vazia Vazia)) No 8 ((No 7 Vazia Vazia) Vazia)
-- ((nivel 0 Vazia) ++ (nivel 0 (No 3 Vazia Vazia))) ++ ((nivel 0 (No 7 Vazia Vazia)) ++ (nivel 0 Vazia))
-- [] ++ [3] ++ [7] ++ []

index :: Int -> [a] -> [a]
index _ [] = []
index 0 (x:xs) = [x]
index n (x:xs) = index (n-1) xs

--construir :: [a] -> Arv a
--construir [] = []
--construir xs = No x (construir xs') (construir xs'')
  --          where n = length xs `div` 2
    --              xs' = take n xs
      --            x:xs'' = drop n xs

inserir :: Ord a => a -> Arv a -> Arv a
inserir x Vazia = No x Vazia Vazia
inserir x (No y esq dir) | (x == y) = (No y esq dir)
                         | (x < y) = (No y (inserir x esq) dir )
                         | (x > y) = (No y esq (inserir x dir))


mapArv :: (a -> b) -> Arv a -> Arv b
mapArv f Vazia = Vazia
mapArv f (No v esq dir) = (No (f v) (mapArv f esq) (mapArv f dir))

listar2 :: Arv a -> [a]
listar2 Vazia = []
listar2 (No v esq dir) = (listar2 esq) ++ [v] ++ (listar2 dir)

ordenada xs = crescente (listar2 xs)

crescente xs = and(zipWith(<=) xs (tail xs))

verificar :: Ord a => a -> Arv a -> Bool
verificar x Vazia = False
verificar n (No v esq dir) | n == v = True
                           | n < v = verificar n esq
                           | n > v = verificar n dir


inserir1 :: Ord a => a -> Arv a -> Arv a
inserir1 n Vazia = No n Vazia Vazia
inserir1 n (No v esq dir) | n == v = No v esq dir
                         | n < v = inserir n esq
                         | n > v = inserir n dir
