4.19 Using the addition function over the natural numbers, give a
recursive definition of multiplication of natural numbers.

> recursiveMultiplication :: Int -> Int -> Int
> recursiveMultiplication n m 
>  | n > 1 = (recursiveMultiplication (n-1) m) + m
>  | n == 1 = m
>  | otherwise = 0

4.20 The integer square root of a positive integer n is the largest
integer whose square is less than or equal to n. For instance, the
integer square roots of 15 and 16 are 3 and 4, respectively. Give
a primitive recursive definition of this function.

> integerSquareRoot :: Integer -> Integer
> integerSquareRoot n
>  | isPerfectSquare = round (sqrt (fromIntegral n))
>  | otherwise = integerSquareRoot (n-1)
>  where 
>   isPerfectSquare = binarySearch 1 n
>   binarySearch low high 
>    | low > high = False
>    | n == square mid = True
>    | n < square mid = binarySearch low (mid - 1)
>    | otherwise = binarySearch (mid+1) high
>    where
>     square n = n*n
>     mid = quot (high + low) 2

4.21 Given a function f of type Integer -> Integer give a recursive
definition of a function of type Integer -> Integer which on input
n returns the maximumof the values f 0,f 1, ..., f n. You might find
the max function defined in Section 3.4 useful.

To test this function, add to your script a definition of some values
of  thus:

f 0 = 0
f 1 = 44
f 2 = 17
f _ = 0

and so on; then test your function at various values.

> f :: Integer -> Integer
> f 0 = 3
> f 1 = 44
> f 2 = 17
> f 3 = 62
> f 4 = 2
> f 5 = 32
> f _ = 0

> fMax :: Integer -> Integer
> fMax n 
>  | n >= 0 = max (fMax (n-1)) (f n) 
>  | otherwise = -1

4.22 Given a function f of type Integer -> Integer give a recursive
definition of a function of type Integer -> Bool which on input n
returns True if one or more of the values f 0, f 1, ..., f n is zero
and False otherwise.

> fBool :: Integer -> Bool
> fBool n
>  | n >= 0 = fBool (n-1) || (f n) == 0
>  | otherwise = False

4.23 Can you give a definition of regions which instead of being
recursive uses the function sumFun
