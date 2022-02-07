olaMundo = do putStrLn("Ola Mundo")

elefantes :: Int -> IO ()
elefantes n = repete 2 n

repete :: Int -> Int -> IO ()
repete v n | (v == n) = return ()
           | otherwise = do putStrLn ("Se " ++ (show v) ++ " elefantes chateiam muita gente")
                            putStrLn ((show (v+1)) ++ " chateiam muita mais!")
                            repete (v+1) n

elefantes2 :: Int -> IO ()
elefantes2 n = sequence_ [putStrLn ("Se " ++ (show v) ++ " elefantes chateiam muita gente" ++ (show (v+1)) ++ " chateiam muita mais!") | v <- [2..(n-1)] ]

read_words :: String -> IO ()
read_words f = do str <- readFile f
                  putStrLn (show (length(words str)))

wc_command :: String -> IO ()
wc_command f = do {
                    str <- readFile f;
                    let w1 = length(lines str);
                    in let w2 = length(words str);
                    in let w3 = length(str);
                    in putStr ((show w1) ++ " " ++ (show w2) ++ " " ++ (show w3) ++ " " ++ f);
                  }

reverseLines :: IO ()
reverseLines = do {
                    str <- getLine;
                    if (str == "Stop") then return ();
                    else do {
                              putStrLn (reverse str);
                              reverseLines;
                            }
                  }

-- 67 não fizemos
-- utilizar succ
-- cuidado com succ 'z'

--adivinha :: String -> IO ()
--adivinha secret = do putStrLn (stringToDash secret)
              --       jogo secret (stringToDash secret) 1

stringToDash :: String -> String
stringToDash l = map (\x -> '-') l

--jogo :: String -> String -> Int -> IO ()
--jogo secret display t = do putStr ("Adivinha a letra: ")
  --                         c <- getLine
    --                       let display2 = reveal secret display (head c)
      --                     putStrLn display2
        --                   if (display2 == secret) then do {putStr ("Adivinhou em " ++ show t
          --                   ++ " tentativas!"); return ();}
            --               else jogo secret display2 (t+1)
