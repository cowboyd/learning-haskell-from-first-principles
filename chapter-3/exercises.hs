module Chapter3Excersises where

bangIt :: String -> String
bangIt s = (++) s "!"

stringAtfifthChar :: String -> String
stringAtfifthChar s =  [s !! 4]

dropFirstNine :: String -> String
dropFirstNine s = drop 9 s

thirdLetter :: String -> Char
thirdLetter s = s !! 2

letterIndex :: Int -> Char
letterIndex x = "Curry is awesome" !! x

rvrs :: String -> String
rvrs s = concat [third, " ", second, " ", first]
  where first = take 5 s
        second = take 2 $ drop 6 s
        third = dropFirstNine s
