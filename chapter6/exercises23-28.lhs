> import Test.QuickCheck

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
> width pic = lineWidth (pic !! 0) 

> lineWidth :: Line -> Int
> lineWidth line = sum [run | (run, char) <- line]

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

> flipH :: Picture -> Picture
> flipH pic = reverse pic

> flipV :: Picture -> Picture
> flipV pic = [reverse line | line <- pic]

> above :: Picture -> Picture -> Picture
> above pic1 pic2 = pic1 ++ pic2

> beside :: Picture -> Picture -> Picture
> beside pic1 pic2 = [line1 ++ line2| (line1, line2) <- zip pic1 pic2]

 TODO 

6.24 Is it the case that all your answers to the last question give
the most compact representation, so that you don't have adjacent runs
of the same character, as in

[(1,'.'), (2, '.'), (1, '#')]

which could be given more compactly as

[(3, '.'), (1, '#')]

If this can happen with your functions, how could you change your
definitions to avoid it?

6.25 Take another look at the QuickCheck properties you wrote to test
pictures: rewrite these for your alternative implementations. How many
of the properties carry over to the alternative implementations without
alteration, and how many have to be modified in some way?

> prop_AboveFlipH :: Picture -> Picture -> Bool
> prop_AboveFlipH pic1 pic2 =
>     flipH (pic1 `above` pic2) == (flipH pic2) `above` (flipH pic1)


> prop_BesideFlipV :: Picture -> Picture -> Bool
> prop_BesideFlipV pic1 pic2 =
>    flipV (pic1 `beside` pic2) == flipV pic2 `beside` flipV pic1


> prop_BesideFlipH :: Picture -> Picture -> Property
> prop_BesideFlipH pic1 pic2 =
>    (length pic1 == length pic2) 
>       ==> flipH (pic1 `beside` pic2) == ((flipH pic1) `beside` (flipH pic2))


> prop_aboveBesides :: Picture -> Bool
> prop_aboveBesides pic = 
>   (pic `above` pic) `beside` (pic `above` pic) == (pic `beside` pic) `above` (pic `beside` pic)

> prop_BesideAbove3Correct :: Picture -> Picture -> Bool
> prop_BesideAbove3Correct n s =
>  (n `beside` n) `above` (s `beside` s)
>  ==
>  (n `above` s) `beside` (n `above` s)

All the properties above remain true unchanged. The remote 360 property
should still hold, however the rectangular function that was provided by
the Pictures module must be rewritten.


> prop_rotate360 :: Picture -> Property
> prop_rotate360 pic =
>  ((length pic) > 0 && isValidPic pic && rectangular pic)
>   ==> rotate90 (rotate90 (rotate90 (rotate90 pic))) == pic



> rectangular :: Picture -> Bool
> rectangular pic = isNotRagged pic && width pic == length pic

> allEqual :: [Int] -> Bool
> allEqual list
>  | length list == 0 = True
>  | length list == 1 = True
>  | otherwise = head list == head remainingList && allEqual remainingList
>   where
>   remainingList = tail list

> isNotRagged :: Picture -> Bool
> isNotRagged pic = allEqual [lineWidth line | line <- pic]

> isFalse :: Bool -> Bool
> isFalse arg = arg == False

> isValidLine :: Line -> Bool
> isValidLine line = (find isFalse [run > 0 | (run, char) <- line]) == Nothing

> isValidPic :: Picture -> Bool
> isValidPic pic = (find isFalse [isValidLine line | line <- pic]) == Nothing

> testPic :: Picture
> testPic = [[(2, 'a')],[]]

6.26 [Harder] The run-length encoding above works a line at a time , but it
would be possible to give a more compact representation which combines runs
in different line. The earlier example could then be given by

[(1, '.'), (2, '#'), (2,'.'),
(1, '#'), (1,'.'), (1, '#'),
(1, '.'), (7,'#')]

This representation loses the length of the rows, so you would have to keep
information about the row length in the type too, giving

type Picture = (Int, [(Int, Char)] )

as the representation. Re-implement the picture functions to work over this
type.

Firstly we would need to define our type

> type CompactedPicture = (Int, [(Int, Char)])

Then we need a print function for this representation 

> printCompactedPicture :: CompactedPicture -> IO ()
> printPicture picture = putStr (concat [(expandLine line) ++ "\n" | line <- picture])
