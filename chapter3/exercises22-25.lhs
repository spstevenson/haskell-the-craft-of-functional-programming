> import Prelude
> import Test.QuickCheck

3.22 Write a function

numberNDroots :: Float -> Float -> Float -> Integer

that given the coefficients of the quadratic, a, b and c, will 
return how many roots the equation has. You may assume the equation
is non-degenerate.

> numberNDroots :: Float -> Float -> Float -> Integer
> numberNDroots a b c
>  | b^2 > 4.0*a*c = 2
>  | b^2 == 4.0*a*c = 1
>  | otherwise = 0

3.23 Using your answer to the last question, write a function

numberRoots :: Float -> Float -> Float -> Integer

that given the coefficients of the quadratic, a, b, and c, will return
how many roots the equation has. In the case that the equation has every
number as a root you should return the result 3.

> numberDroots :: Float -> Float -> Integer
> numberDroots b c 
>  | b /= 0.0 = 1
>  | b == 0.0 && c /= 0.0 = 0
>  | otherwise = 3

> numberRoots :: Float -> Float -> Float -> Integer
> numberRoots a b c
>  | a /= 0.0 = numberNDroots a b c
>  | otherwise = numberDroots b c

3.24 The formula for the roots of a quadratic is

(-b +- sqrt(b^2 - 4ac))/(2a)

Write defintions of the functions

smallerRoot, largerRoot :: Float -> Float -> Float -> Float

which return the smaller and larger real roots of the quadratic. In the case
that the equation has no real roots or has all values as roots you should return
zero as the result of each of the functions.

> discriminant :: Float -> Float -> Float -> Float
> discriminant a b c = b^2 - 4.0 * a * c

> linearRoot :: Float -> Float -> Float
> linearRoot b c = (-c)/b

> smallerRoot, largerRoot :: Float -> Float -> Float -> Float
> smallerRoot a b c 
>  | numberRoots a b c == 0 || numberRoots a b c == 3 = 0
>  | a > 0.0 = minusRoot a b c 
>  | a == 0.0 = linearRoot b c
>  | otherwise = plusRoot a b c

> largerRoot a b c 
>  | numberRoots a b c == 0 || numberRoots a b c == 3 = 0
>  | a > 0.0 = plusRoot a b c 
>  | a == 0.0 = linearRoot b c
>  | otherwise = minusRoot a b c


> plusRoot :: Float -> Float -> Float -> Float
> plusRoot a b c = ((-b) + sqrt (discriminant a b c)) / (2.0*a)

> minusRoot :: Float -> Float -> Float -> Float
> minusRoot a b c = ((-b) - sqrt (discriminant a b c)) / (2.0*a)

3.25 How would you write QuickCheck properties to test the functions
smallerRoot and largerRoot?

Hint: One thing you would expect is that the result of the first function
is less than or equal to the second. Another thing you should expect is
that if you substitute the roots back into the equation, the result should
be zero. However, because Floating-point calculation is only approximate, you
need to check whether the result of substituting a root is close to zero,
rather than being actually equal to it.

> prop_largerIsLarger :: Float -> Float -> Float -> Bool
> prop_largerIsLarger a b c = largerRoot a b c >= smallerRoot a b c

> prop_closeToZero :: Float -> Float -> Float -> Bool
> prop_closeToZero a b c
>  | numberRoots a b c == 0 = True
>  | otherwise = largerIsCloseToZero a b c && smallerIsCloseToZero a b c

> largerIsCloseToZero :: Float -> Float -> Float -> Bool
> largerIsCloseToZero a b c = 
>  abs(a*(largerRoot a b c)^2 + b*(largerRoot a b c) + c) < 2

> smallerIsCloseToZero :: Float -> Float -> Float -> Bool
> smallerIsCloseToZero a b c = 
>  abs(a*(smallerRoot a b c)^2 + b*(smallerRoot a b c) + c) < 2

These thresholds must be quite generous as we are only using floats
instead of the more accurate doubles.