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
>    		       deriving (Eq, Ord, Show)

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
