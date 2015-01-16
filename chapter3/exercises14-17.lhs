3.14 Give a function to return the average of three integers

averageThree :: Int -> Int -> Int -> Float

Using this function define a function

howManyAboveAverage :: Int -> Int -> Int -> Int

which returns how many of its inputs are larger than their average value.
The remainder of the questions look at solutions to a quadratic equation

a*X^2 + b*X + c = 0.0

where a, b and c are real numbers. The equation has

	two real roots, if b^2 > 4.0*a*c;
	one real rootm if b^2 == 4.0*a*c; and
	no real roots, if b^2 < 4.0*a*c.
	
This assumes that a is non-zero - the case we call non-degenerate. In
the degenerate casem there are three sub-cases:

	one real root, if b /= 0.0;
	no real roots, if b = 0.0 and c /= 0.0;
	every real number a root, if b == 0.0 and c == 0.0
	
> import Prelude

> averageThree :: Int -> Int -> Int -> Float
> averageThree x y z = fromIntegral(x + y + z) / 3.0

> howManyAboveAverage :: Int -> Int -> Int -> Int
> howManyAboveAverage x y z
>  | fromIntegral x > (averageThree x y z) && fromIntegral y > (averageThree x y z) = 2
>  | fromIntegral x > (averageThree x y z) && fromIntegral z > (averageThree x y z) = 2
>  | fromIntegral y > (averageThree x y z) && fromIntegral z > (averageThree x y z) = 2
>  | otherwise = 1

3.15 Write a function

numberNDroots :: Float -> Float -> Float -> Int

that gives the coefficient of the quadratic, a, b, and c, will return how many
roots the equation has. You may assume the equation is non-degenerate.

> numberNDroots :: Float -> Float -> Float -> Int
> numberNDroots a b c
>  | b^2 > 4.0*a*c = 2
>  | b^2 == 4.0*a*c = 1
>  | b^2 < 4.0*a*c = 0

3.16 Using your answer to the last question, write a function

numberRoots :: Float -> Float -> Float -> Int

that given the coefficients of the quadratic, a, b and c, will return how many
roots the equation has. In the case that the equation has every number a root you
should return the result 3.

> numberRoots :: Float -> Float -> Float -> Int
> numberRoots a b c
>  | a /= 0.0 = numberNDroots a b c
>  | b /= 0.0 = 1
>  | b == 0.0 && c /= 0.0 = 0
>  | otherwise = 3

3.17 The formula for the roots of a quadratic is

(-b +- sqrt(b^2 - 4ac))/2a

Write definitions of the functions

smallerRoot, largerRoot :: Float -> Float -> Float -> Float

which return the smaller and larger real roots of the quadratic. In the case that
the equation has no real roots or has all values as roots you should return to zero
as the result of each of the functions.

> smallerRoot :: Float -> Float -> Float -> Float
> largerRoot :: Float -> Float -> Float -> Float

> smallerRoot a b c
>  | (numberRoots a b c) > 0 && (numberRoots a b c) < 3 = ((-b) - (sqrt (b^2-4.0*a*c)))/(2.0*a)
>  | otherwise = 0.0

> largerRoot a b c
>  | numberRoots a b c > 0 && numberRoots a b c < 3 = ((-b) + (sqrt (b^2-4.0*a*c)))/(2.0*a)
>  | otherwise = 0.0