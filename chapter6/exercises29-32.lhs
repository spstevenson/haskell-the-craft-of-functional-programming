> import Pictures
> import Test.QuickCheck


6.29 Define a function

makeImage :: Picture -> Position -> Image

which makes an Image from a Picture and a Position

> type Position = (Int, Int)

> type Image = (Picture, Position)

> makeImage :: Picture -> Position -> Image
> makeImage pic position = (pic, position)

6.30 Define a function

changePosition :: Image -> Position -> Image

which takes an Image and returns a new Image whose Picture is
unchanged but whose Position is given by the second argument
to changePosition.

> changePosition :: Image -> Position -> Image
> changePosition (lines,_) pos = (lines, pos)

6.31 Give a definition of the function

moveImage :: Image -> Int -> Int -> Image

so that the effect of moveImage img xMove yMove is to move img by xMove
in the horizontal (x) direction and by yMove in the vertical (y) direction.

> moveImage :: Image -> Int -> Int -> Image
> moveImage (pic, (x,y)) xMove yMove = (pic, (x+xMove,y+yMove))

6.32 Define a function

printImage :: Image -> IO ()

whose action is the analogue of printPicture for pictures.

> printImage :: Image -> IO ()
> printImage (pic, (xPos, yPos)) = putStr (concat [(replicate xPos ' ') ++ (line ++ "\n") | line <- pic] ++ (replicate yPos '\n'))
