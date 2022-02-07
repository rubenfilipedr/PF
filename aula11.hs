data Arv a = Vazia | No a (Arv a) (Arv a)

-- 78
data Shape = Circle Float | Rectangle Float Float

perimetro :: Shape -> Float
perimetro (Circle a) = 2*3.14*a
perimetro (Rectangle a b) = (a*2)+(b*2)

-- 79
data Point = Pnt (Float,Float)
data Rectangle = Rec Point Point

area :: Rectangle -> Float
area (Rec (Pnt (x1,y1)) (Pnt (x2,y2))) = (x2-x1)*(y2-y1)

overlap :: Rectangle -> Rectangle -> Bool
overlap (Rec (Pnt (x1,y1)) (Pnt (x2,y2))) (Rec (Pnt (x3,y3)) (Pnt (x4,y4)))
  | (x3 > x2) || (x4 < x1) = False
  | (y1 > y4) || (y2 < y3) = False
  | otherwise = True

-- 80
data Stack a = Stk [a] deriving Show

push :: a -> Stack a -> Stack a -- Coloca elemento
push x (Stk xs) = Stk (x:xs)

pop :: Stack a -> Stack a -- Remove elemento
pop (Stk (_:xs)) = Stk xs
pop _            = error "Stack.pop: empty stack"

top :: Stack a -> a -- Apresenta primeiro elemento
top (Stk (x:_)) = x
top _           = error "Stack.top: empty stack"

empty :: Stack a  -- Cria nova stack
empty = Stk []

isEmpty :: Stack a -> Bool  -- Testa se stack está vazia
isEmpty (Stk []) = True
isEmpty (Stk _) = False

-- "(([])[])"   - -
-- "([])[])"    -(-
-- "[])[])"     -((-
-- "])[])"      -[((-
-- ")[])"       -((-
-- "[])"        -(-
-- "])"         -[(-
-- ")"          -(-
-- ""           - -
-- -> True


parent :: String -> Bool
parent [] = True
parent s = aux empty s

aux :: Stack Char -> String -> Bool
aux st [] = isEmpty st
aux st (x:xs) | (x == '(') = aux (push ')' st) xs
              | (x == '[') = aux (push ']' st) xs
              | (isEmpty st) = False
              | ((top st) == x) = aux (pop st) xs
              | otherwise = False

-- 81
calc :: Stack Float -> String -> Stack Float
calc stk s | (s == "+") = push (a + b) (pop (pop stk))
           | (s == "-") = push (a - b) (pop (pop stk))
           | (s == "*") = push (a * b) (pop (pop stk))
           | (s == "/") = push (a / b) (pop (pop stk))
           | otherwise = push (read s :: Float) stk
           where b = (top stk)
                 a = (top (pop stk))


-- 81b
calcular :: String -> Float
calcular s = top (foldl calc empty (words s))

-- 82
data Vertice = V Int deriving Show
data Arco = A (Vertice,Vertice) deriving Show
data Grafo = G [Arco] deriving Show

grafoTeste :: Grafo
grafoTeste = G [A(V 1, V 4), A(V 1, V 2), A(V 2, V 5), A(V 4, V 5), A(V 2, V 3),
             A(V 2, V 6), A(V 3, V 6), A(V 6, V 5)]

-- 83

-- 84
--occurLetter :: String -> Int
--occurLetter s = length [ x | x <- s, isLetter(x) ]

list1 = 1: [ x*y | (x,y) <- zip list1 [1..] ]

fibonnaci = 0:1: [x+y | (x,y) <- zip fibonnaci (tail fibonnaci)]

list2 = [ 2*x+y | x<-[1..],y<-[1..] ]

imparDiv3 xs = filter(\x -> x `mod` 3 == 0 && x `mod` 2 /= 0) xs

div3 xs = and [odd x | x <- xs , x `mod` 3 == 0]

div1 xs = (all odd).filter(\x -> x `mod` 3 == 0 && x `mod` 2 /= 0)

infinito = 1 : [2*x+y+1 | (x,y) <- zip infinito [2..]]

duplicada [] = True
duplicada (x:y:xs) | x == y = duplicada xs
                   | otherwise = False

duplicate1 l = foldr(\x y -> x:x:y) [] l

duplica xs = concat [[x,x] | x <- xs]

reverse1 :: [a] -> [a]
reverse1 xs = foldr(\x y -> y ++ [x]) [] xs


notaf xs ys = sum[x*y | (x,y) <- zip xs ys]

rfc xss = sum [ 1 | xs <- xss, any (<8) xs]
