Run-length encoding

A more compact representation is given by run-length encoding of
Pictures, which will code a repeated character run like '###' as
a pair, (3, '#'), and a picture is represented as a member of
[[(Int, Char)]]. For example, the picture

 .##.
 .#.#
 .###
 ####

is represented like this

[ [(1,'.'), (2,'#'), (1, '.')],
  [(1,'.'), (1,'#'), (1, '.'), (1,'#')],
  [(1,'.'), (3,'#')],
  [(4,'#')] ]

using run-length encoding for each row of the picture.

Exercises

6.23 Re-implement the functions over pictures to work with
this new representation. In particular, how would you print
pictures which were represented in this way?

First lets define the picture

> import Data.List

> type Picture = [Line]
> type Line = [(Int,Char)]


> samplePicture :: Picture
> samplePicture = [ [(1,'.'), (2,'#'), (1, '.')],
>  [(1,'.'), (1,'#'), (1, '.'), (1,'#')],
>  [(1,'.'), (3,'#')],
>  [(4,'#')] ]

> printPicture :: Picture -> IO ()
> printPicture picture = putStr (concat [(expandLine line) ++ "\n" | line <- picture])

> expandLine :: Line -> [Char]
> expandLine line = concat [ (replicate repetitions value) | (repetitions, value) <- line]

If we can re-compact a line, we can reuse our previous implementation for superimposeChars

> compactLine :: [Char] -> Line
> compactLine line = [(length run,  run !! 0 )| run <- (group line)]

> superimposeChar :: Char -> Char -> Char
> superimposeChar char1 char2
>  | char1 == '.' && char2 == '.' = '.'
>  | otherwise = '#'

> superimposeChars :: [Char] -> [Char] -> [Char]
> superimposeChars line1 line2 = [superimposeChar char1 char2 | (char1,char2) <- zip line1 line2]

> superimposeLine :: Line -> Line -> Line
> superimposeLine line1 line2 = compactLine (superimposeChars (expandLine line1) (expandLine line2))

> superimpose :: Picture -> Picture -> Picture
> superimpose pic1 pic2  = [superimposeLine line1 line2 | line1 <- pic1, line2 <- pic2]

For the function rotate90, we must be able to get characters at certain indexes

> getLineChar :: Line -> Int -> Char
> getLineChar line n 
>  | n < 0 = error "Index out of range for line"
>  | n < runlength = character
>  | otherwise = getLineChar (tail line) (n - runlength)
>  where
>   runlength = fst (head line)
>   character = snd (head line)

> width :: Picture -> Int
> width pic = sum [run | (run, char) <- (head pic)] 

> formLineFromColumn :: Picture -> Int -> Line
> formLineFromColumn pic col
>  | col < 0 || col > (width pic)-1 = error "Column number out of range"
>  | otherwise = compactLine  (reverse [(getLineChar line col)|line <- pic])

> rotate90 :: Picture -> Picture
> rotate90 pic = [formLineFromColumn pic col | col <- [0..(width pic)-1]]

> rotate270 :: Picture -> Picture
> rotate270 pic = rotate90 (rotate90 (rotate90 pic))

> stretchLineHorizontally :: Line -> Int -> Line
> stretchLineHorizontally line n = [ (run * n, char) | (run, char) <- line]

> stretchPictureHorizontally :: Picture -> Int -> Picture
> stretchPictureHorizontally pic n = [stretchLineHorizontally line n | line <- pic]

> stretchPictureVertically :: Picture -> Int -> Picture
> stretchPictureVertically pic n = concat [replicate n line | line <- pic]

> scale :: Picture -> Int -> Picture
> scale pic n = stretchPictureVertically (stretchPictureHorizontally pic n) n 
