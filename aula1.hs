triangulo :: (Int,Int,Int) -> Bool
triangulo (a,b,c) | sum[a,b]>c && sum[a,c]>b && sum[b,c]>a = True
                  | otherwise = False

area :: (Float,Float,Float)-> Float
met :: (Float,Float,Float)-> Float
met (a,b,c)=(a+b+c)/2
area (a,b,c)= sqrt(met(a,b,c)*(met(a,b,c)-a)*(met(a,b,c)-b)*(met(a,b,c)-c))

metade [a] = take (div(length [a]) 2)

ultimo :: [a] -> [a]
ultimo a = drop 1 (reverse a)

binom :: (Int,Int) -> Int
fact (n) = product[1..n]
binom (n,k)  = if (k > n)
             then "impossivel"
             else
               (div(fact n) (fact k * fact (n-k)))

max1 :: (Int,Int,Int) -> Int
min1 :: (Int,Int,Int) -> Int

max1 (x,y,z) = if (x >= y && x >= z) then x
               else if (y >= x && y >=z) then y
               else z

min1 (x,y,z) = if (x <= y && x <= z) then x
               else if (y <= x && y <=z) then y
               else z

max2 a b c = max (max a b) c

min2 a b c = min (min a b) c

maxOccurs :: Integer -> Integer -> (Integer , Integer )
maxOccurs a b = if a > b then (a,1)
                else if a == b then (a,2)
                else (b,1)

orderTriple :: (Integer , Integer , Integer ) -> (Integer , Integer , Integer )
orderTriple (x,y,z) = if (x<=y && y <=z) then (x,y,z)
                      else if (y<=x && x<=z) then (y,x,z)
                            else if(z<=x && x<=y) then (z,x,y)
                                  else if (y<=z && z<=x) then (y,z,x)
                                        else if(x<=z && z<=y) then (x,z,y)
                                              else (z,y,x)

  classifica :: Int -> String
  classifica x  | (x <= 9) = ("reprovado")
                | (10 <= x && x<= 12) = ("suficiente")
                | (13 <= x && x<= 15) = ("bom")
                | (16 <= x && x<= 18) = ("muito bom")
                | otherwise = ("muito bom com distinção")

xor :: Bool -> Bool -> Bool
xor p q = (p || q) && not (p && q)

safetail :: [a] -> [a]
safetail xs = drop 1 xs


safetail2 :: [a] -> [a]
safetail2 xs = case xs of
               [] -> []
               x : xs -> xs

curta :: [a] -> Bool
curta xs = if ( length(xs)<=2 ) then True else False
