Exercicio 89:

 Objetivo: x + (y + z) = (x + y) + z

 -> Indução em x:
- Caso base: x = Zero

  Zero + (y + z)
  y + z
  (Zero + y) + z

- Caso de indução: x + (y + z) = (x + y) + z => Succ x + (y + z) = (Succ x + y) + z

- Hipotese: x + (y + z) = (x + y) + z

  Succ x + (y + z)        (+.2)
  Succ (x + (y + z))      (Hipotese)
  Succ ((x + y) + z)      (+.2)
  (Succ x + y) + z


--------------------------------------------------------------------------------

Exercicio 90:

Regras:
  [] ++ ys = ys                     (++.1)
  (x:xs) ++ ys = x:(xs ++ ys)       (++.2)

Objetivo: (xs ++ ys) ++ zs = xs ++ (ys ++ zs)

-> Indução em xs:
- Case base: xs = []

  ([] ++ ys) ++ zs          (++.1)
  ys ++ zs                  (++.1)
  [] ++ (ys ++ zs)

- Caso de indução: (xs ++ ys) ++ zs = xs ++ (ys ++ zs)
                      => ((x:xs) ++ ys) ++ zs = (x:xs) ++ (ys ++ zs)

- Hipotese: (xs ++ ys) ++ zs = xs ++ (ys ++ zs)

  ((x:xs) ++ ys) ++ zs      (++.2)
  (x:(xs ++ ys)) ++ zs      (++.2)
  x:((xs ++ ys) ++ zs)      (Hipotese)
  x:(xs ++ (ys ++ zs))      (++.2)
  (x:xs) ++ (ys ++ zs)


--------------------------------------------------------------------------------

Exercicio 91:

Lema (++.3)
Objetivo: xs ++ [] = xs

-> Indução em xs:
- Caso base: xs = []

  [] ++ []      (++.1)
  []

- Caso de indução: xs ++ [] = xs => (x:xs) ++ [] = (x:xs)
- Hipotese: xs ++ [] = xs

  (x:xs) ++ []        (++.2)
  x:(xs ++ [])        (Hipotese)
  (x:xs)

Regras:
  reverse [] = []                       (r.1)
  reverse (x:xs) = reverse xs ++ [x]    (r.2)
  (xs ++ ys) ++ zs = xs ++ (ys ++ zs)   (90)

Objetivo: reverse (xs ++ ys) = reverse ys ++ reverse xs

-> Indução em xs:
- Caso base: xs = 0

  reverse ([] ++ ys)          (++.1)
  reverse ys
  reverse ys ++ []            (r.1)
  reverse ys ++ reverse []

- Caso indução: reverse (xs ++ ys) = reverse ys ++ reverse xs
                  => reverse ((x:xs) ++ ys) = reverse ys ++ reverse (x:xs)

  reverse ((x:xs) ++ ys)              (++.2)
  reverse (x:(xs ++ ys))              (r.2)
  reverse (xs ++ ys) ++ [x]           (Hipotese)
  (reverse ys ++ reverse xs) ++ [x]   (90)
  reverse ys ++ (reverse xs ++ [x])   (r.2)
  reverse ys ++ reverse (x:xs)


--------------------------------------------------------------------------------

Exercicio 92:

Objetivo: map f (map g xs) = map (f . g) xs

Regras:
  map f [] = []                   (m.1)
  map f (x:xs) = f x : map f xs   (m.2)
  (f . g) x = f (g x)             (m.3)

-> Indução em xs:
- Caso base: xs = []

  map f (map g [])          (m.1)
  map f []                  (m.1)
  []                        (m.1)
  map (f . g) []

- Caso indução: map f (map g xs) = map (f . g) xs
                  => map f (map g (x:xs)) = map (f . g) (x:xs)

  map f (map g (x:xs))        (m.2)
  map f (g x : map g xs)      (m.2)
  f (g x) : map f (map g xs)  (Hipotese)
  f (g x) : map (f . g) xs    (m.3)
  (f . g) x : map (f . g) xs  (m.2)
  map (f . g) (x:xs)


--------------------------------------------------------------------------------

Exercicio 93:

Objetivo: take n xs ++ drop n xs = xs

Regras:
  take 0 xs = []                             (t.1)
  take n [] | n>0 = []                       (t.2)
  take n (x:xs) | n>0 = x:take (n-1) xs      (t.3)
  drop 0 xs = xs                             (d.1)
  drop n [] | n>0 = []                       (d.2)
  drop n (x:xs) | n>0 = drop (n-1) xs        (d.3)

-> Indução em n:
- Caso base: n = 0

  take 0 xs ++ drop 0 xs        (t.1, d.1)
  [] ++ xs                      (++1)
  xs

- Caso indução: take n xs ++ drop n xs = xs => take n+1 xs ++ drop n+1 xs = xs


  - Caso xs = []
  take n+1 [] ++ drop n+1 []      (t.2, d.2)
  [] ++ []                        (++.1)
  []

  - Caso xs = (x:xs)
  take n+1 (x:xs) ++ drop n+1 (x:xs)    (t.3, d.3)
  x:(take n xs) ++ (drop n xs)          (++.2)
  x:(take n xs ++ drop n xs)            (Hipotese)
  (x:xs)


--------------------------------------------------------------------------------

Exercicio 94:

Objetivo: length (map f xs) = length xs

Regras:
  lenght [] = 0                       (l.1)
  length (x:xs) = 1 + length xs       (l.2)

-> Indução em xs:
- Caso base: xs = []

  length (map f [])       (m.1)
  length []

- Caso indução: length (map f xs) = length xs
                    => length (map f (x:xs)) = length (x:xs)

  length (map f (x:xs))     (m.2)
  length (f x : (map f xs)) (l.2)
  1 + length (map f xs)     (Hipotese)
  1 + length xs             (l.2)
  length (x:xs)


--------------------------------------------------------------------------------

Exercicio 95:

Objetivo: sum (map (1+) xs) = length xs + sum xs

Regras:
  sum [] = 0                 (s.1)
  sum (x:xs) = x + sum xs    (s.2)

-> Indução em xs:
- Caso base: xs = []

  sum (map (1+) [])         (m.1)
  sum []                    (s.1)
  0                         (elemento neutro)
  0 + 0                     (l.1, s.1)
  length [] ++ sum []

- Caso indução: sum (map (1+) xs) = length xs + sum xs
                  => sum (map (1+) (x:xs)) = length (x:xs) + sum (x:xs)

  sum (map (1+) (x:xs))           (m.2)
  sum ((1+) x : map (1+) xs)      (s.2)
  (1+) x + sum (map (1+) xs)      (Hipotese)
  x + 1 + length xs + sum xs      (l.2, s.2)
  length (x:xs) ++ sum (x:xs)


--------------------------------------------------------------------------------

Exercicio 96:

Objetivo: map f (xs ++ ys) = map f xs ++ map f ys

-> Indução em xs:
- Caso base: xs = []

  map f ([] ++ ys)        (++.1)
  map f ys                (++.1)
  [] ++ map f ys          (m.1)
  map f [] ++ map f ys

- Caso indução: map f (xs ++ ys) = map f xs ++ map f ys
                  => map f ((x:xs) ++ ys) = map f (x:xs) ++ map f ys

  map f ((x:xs) ++ ys)            (++.2)
  map f (x:(xs ++ ys))            (m.2)
  f x : map f (xs ++ ys)          (Hipotese)
  f x : (map f xs ++ map f ys)    (++.2)
  (f x : map f xs) ++ (map f ys)  (m.2)
  map f (x:xs) ++ map f ys


--------------------------------------------------------------------------------
