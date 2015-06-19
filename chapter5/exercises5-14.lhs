> import Prelude

5.5 Define a function to give the length of the perimeter of a
geometrical Shape. What is the type of this function?

> data Shape = Circle Float |
>              Rectangle Float Float
>              deriving (Eq, Ord, Show) 

> perimeter :: Shape -> Float
> perimeter (Circle r) = 2*pi*r
> perimeter (Rectangle h w) = 2*h + 2*w

The type of this function is Shape -> Float

5.6 Re-define the Item type for supermarket products so that it uses
a data definition rather than a type definition.

> type Name = String
> type Price = Integer

> data Item = ShopItem Name Price

5.7 Add an extra constructor to Shape for triangles, and extend the
functions isRound, area and perimeter to include triangles.

> data ShapeExtended = Circle2 Float |
> 	               Rectangle2 Float Float |
>                      Triangle Float Float Float 
>    		       deriving (Ord, Show)

> perimeterExtended :: ShapeExtended -> Float
> perimeterExtended (Circle2 r) = 2*r*r
> perimeterExtended (Rectangle2 h w) = 2*h + 2*w
> perimeterExtended (Triangle a b c) = a + b + c

> isRoundExtended :: ShapeExtended -> Bool
> isRoundExtended (Circle2 _) = True
> isRoundExtended (Rectangle2 _ _) = False
> isRoundExtended (Triangle _ _ _) = False

> areaExtended :: ShapeExtended -> Float
> areaExtended (Circle2 r) = pi*r*r
> areaExtended (Rectangle2 h w) = h*w

> areaExtended (Triangle a b c) = sqrt(p*(p-a)*(p-b)*(p-c))
>  where
>   p = (a+b+c)/2

5.8 Define a function which decides whether a Shape is
regular: a circle is regular, a square is a regular
rectangle and being equilateral makes a triangle
regular.

> isRegularShape :: ShapeExtended -> Bool
> isRegularShape (Circle2 _)  = True
> isRegularShape (Rectangle2 h w) = h == w
> isRegularShape (Triangle a b c) = a == b && b == c

5.9 Investigate the derived definitions for Move and Shape: what form do the
show functions take, for example?

> showShape :: ShapeExtended -> String
> showShape shape = show shape

> eqShape :: ShapeExtended -> ShapeExtended -> Bool
> eqShape shape1 shape2 = shape1 == shape2

> greatestShape :: ShapeExtended -> ShapeExtended -> ShapeExtended
> greatestShape shape1 shape2 = max shape1 shape2

The standard show function is of the form "(Constructor param1 ... param_n)"

The Eq function allows you to use ==

The ord function defines > and <

5.10 Define an == function over Shape so that all circles of negative radius
are equated. How would you treat rectangles with negative sides?

> instance Eq ShapeExtended where
>  (==) (Circle2 r1) (Circle2 r2) 
>   | r1 < 0 && r2 < 0 = True
>   | otherwise = r1 == r2
>  (==) (Rectangle2 h1 w1) (Rectangle2 h2 w2)
>   | (h1 < 0 || w1 < 0) && (h2 < 0 || w2 < 0) = True
>   | otherwise = (h1 == h2) && (w1 == w2)
>  (==) (Triangle a1 b1 c1) (Triangle a2 b2 c2)
>   | anyNeg (Triangle a1 b2 c1) && anyNeg (Triangle a2 b2 c2) = True
>   | otherwise = (a1 == a2) && (b1 == b2) && (c1 == c2)
>   where
>    anyNeg (Triangle a b c ) = a < 0 || b < 0 || c < 0
>  (==) _ _ = False
>  (/=) x y = not (x == y)

Here an invalid rectangle (with any side negative) is equal to any other
invalid rectangle (which has one or more negative sides).

5.11 The type shape takes no account of the position or orientation of a
shape. After deciding how to represent points, how would you modify the
original definition of Shape to contain the centre of each object? You
can assume that rectangles lie with their sides parallel to the axes.

> type Point = (Float, Float)

> data NewShape = NewCircle Float Point |
>		NewRectangle Float Float Point 
>		deriving (Eq, Ord, Show)

5.12 Calling the new shape type NewShape, define a function

move :: Float -> Float -> NewShape -> NewShape

which moves a shape by the offsets given

> move :: Float -> Float -> NewShape -> NewShape
> move offsetX offsetY (NewCircle r (x, y)) = (NewCircle r (x + offsetX, y + offsetY))
> move offsetX offsetY (NewRectangle h w (x, y)) = (NewRectangle h w (x + offsetX, y + offsetY))

5.13 Define a function to test whether two NewShapes overlap

> horizontalDistance :: Point -> Point -> Float
> horizontalDistance (x1,y1) (x2,y2)  = abs (x1 - x2)

> verticalDistance :: Point -> Point -> Float
> verticalDistance (x1,y1) (x2,y2) = abs(y1 - y2)

> intersects :: NewShape -> NewShape -> Bool
> intersects (NewCircle r1 (x1, y1)) ( NewCircle r2 (x2, y2)) = (r1 + r2) > distance
>  where
>  distance = sqrt ((y1 - y2)^2 + (x1 - x2)^2)
> intersects (NewRectangle w1 h1 (x1, y1)) (NewRectangle w2 h2 (x2,y2)) 
>  = (w1+w2)/2.0 > horizontalDistance (x1,y1) (x2,y2) && (h1+h2)/2.0 > verticalDistance (x1,y1) (x2,y2)

> intersects (NewCircle r (x1,y1)) (NewRectangle w h (x2,y2))
>  | boundedHorizontally && boundedVertically = True
>  | boundedVertically = w/2.0 + r > horizontalDistance (x1,y1) (x2,y2)
>  | boundedHorizontally = h/2.0 + r > verticalDistance (x1,y1) (x2,y2)
>  | otherwise = w/2.0 + r > horizontalDistance (x1,y1) (x2,y2) && h/2.0 + r > verticalDistance (x1,y1) (x2,y2)
>  where
>  boundedHorizontally = x2-(w/2.0) < x1 && x1 < x2+(w/2.0)
>  boundedVertically = y2-(h/2.0) < y1 && y1 < y2+(h/2.0)

5.14 Some houses have a number; others have a name. How would you implement the
type of 'strings or numbers' used as part of an address? Write a function
which gives the textual form of one of these objects. Give a definition of a
type of names and addresses using the type you have defined.

> data HouseName = NumericName Int |
>			AlphanumericName String
>			deriving (Show, Eq, Ord)			

> type Street = String
> type City = String
> type PostCode = String
> type Address = (HouseName, Street, City, PostCode)
