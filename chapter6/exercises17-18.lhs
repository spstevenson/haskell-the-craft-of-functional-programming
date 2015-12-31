6.17 Redefine the functions over pictures to pad pictures in the way
just described. One way to solve the problem is to use the function

replicate :: Int -> a -> [a]

replicate n x returns a list containing n xs, so replicate 3 'g' is "ggg".

> import Pictures hiding (superimpose)

> superimposeChar :: Char -> Char -> Char
> superimposeChar char1 char2
>  | char1 == '.' && char2 == '.' = '.'
>  | otherwise = '#'

> superimposeLine :: [Char] -> [Char] -> [Char]
> superimposeLine line1 line2 = [superimposeChar char1 char2 | (char1, char2) <- zip line1 line2]

> superimpose pic1 pic2 = padPicture [superimposeLine line1 line2 | (line1,line2) <- zip pic1 pic2]

> printPicture :: Picture -> IO ()
> printPicture picture = putStr (concat [line ++ "\n" | line <- picture])

> rotate90 :: Picture -> Picture
> rotate90 pic
>  | length pic == 0 = pic
>  | pictureWidth pic == 0 = pic
>  | otherwise = padPicture [ rotateLine n pic | n <- [0 .. (pictureWidth pic) - 1]]

> rotateLine :: Int -> Picture -> [Char]
> rotateLine col pic = reverse [ line !! col | line <- pic]

6.18 How would you work with basic pictures that were not rectangular? Define
a function that will take a picture - as a list of Strings - and return a
rectangular list of strings, padding out each line as necessary. Once you start
with rectangular pictures the functions you defined in the first part of this
exercise should be enough to preserve them as rectangular.

> pictureWidth :: Picture -> Int
> pictureWidth pic = maximum [length line | line <- pic]

> padLineToLength :: String -> Int -> String
> padLineToLength line len
>  | (length line) < len = line ++ (replicate padLength '.')
>  | otherwise = line
>  where padLength = len - (length line)

> padPicture :: Picture -> Picture
> padPicture pic = [padLineToLength line (pictureWidth pic) | line <- pic]
