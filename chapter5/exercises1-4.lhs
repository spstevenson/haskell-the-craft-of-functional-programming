> import Prelude

5.1 Give a definition of the function

maxOccurs :: Integer -> Integer -> (Integer, Integer)

which returns the maximum of two integers, together with
the number of times it occurs. Using this, or otherwise,
define the function

maxThreeOccurs :: Integer -> Integer -> Integer -> (Integer,Integer)

which does a similar thing for three arguments.

> maxOccurs :: Integer -> Integer -> (Integer, Integer)
> maxOccurs m n = (max m n, occurs )
>  where
>   occurs 
>    | m == n = 2
>    | otherwise = 1

> maxThreeOccurs :: Integer -> Integer -> Integer -> (Integer, Integer)
> maxThreeOccurs m n p = (maxValue, occurs)
>  where
>   maxValue = max m (max n p)
>   occurs =  (boolToInt (maxValue == m)) + (boolToInt (maxValue == n))
>            + (boolToInt (maxValue == p))  

> boolToInt :: Bool -> Integer
> boolToInt True = 1
> boolToInt False = 0

5.2 Give a definition of the function

orderTriple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)

which puts the elements of a triple of three integers into ascending order.
You might like to use the maxThree, middle and minThree functions defined
earlier.

> maxThree :: Integer -> Integer -> Integer -> Integer
> maxThree m n p = max m (max n p)

> minThree :: Integer -> Integer -> Integer -> Integer
> minThree m n p = min m (min n p)

> middleThree :: Integer -> Integer -> Integer -> Integer
> middleThree m n p
>  | between m n p = n
>  | between n m p = m
>  | otherwise = p
>  where
>   between x y z = (x <= y && y <= z) || (x >=y && y >= z)

> orderTriple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
> orderTriple (x, y, z) = (minThree x y z, middleThree x y z, maxThree x y z)

5.3 Define the function which finds where a straight line crosses the x-axis.
You will need to think how to supply the information about the straight line
to the function.

> xIntercept :: Float -> Float -> (Float, Bool)
> xIntercept m c 
>  | m == 0.0 = (0.0, False)
>  | otherwise = ((-c)/m, True)

5.4 Design test data for the preceding exercises; explain your choices you
have made in each case. Give a sample evaluation of each of your functions.


