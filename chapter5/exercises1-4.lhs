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

For maxOccurs we should test the case where first is the maximum, the second
is the maximum and where both are the maximum. We could also check that the
function handles negative numbers.

maxOccurs (-1) 10 -> (10, 1)
maxOccurs 10 (-1) -> (10, 1)
maxOccurs 10 10 -> (10,2)

maxOccurs (-1) 10
= (max (-1) 10, occurs)
| where
|  occurs = 1 (because (-1) /= 10)
(max (-1) 10, 1)
(10, 1)

We can follow the same principle with maxThree occurs. We need to test all
the cases where the maximum occurs once, twice or three times.

Three times

maxThreeOccurs 12 12 12 -> (12, 3)

Twice

maxThreeOccurs 12 12 (-1) -> (12, 2)
maxThreeOccurs 12 (-1) 12 -> (12, 2)
maxThreeOccurs (-1) 12 12 -> (12, 2)

Once

maxThreeOccurs 12 1 (-1) -> (12, 1)
maxThreeOccurs 1 12 1 -> (12, 1)
maxThreeOccurs 1 1 12 -> (12, 1)

maxThreeOccurs 12 12 (-1)
= (maxValue, occurs)
| where
|  maxValue = max 12 (max 12 (-1)) = max 12 12 = 12
|  occurs =  (boolToInt (maxValue == m)) + (boolToInt (maxValue == n))
|           + (boolToInt (maxValue == p)) = (boolToInt (12 == 12) + (boolToInt (12 == 12) + (boolToInt (12 == (-1))) 
|         = (boolToInt True) + (boolToInt True) + (boolToInt False) = 1 + 1 + 0 = 2

(12, 2)

For orderTriple we need to have test data that is in each possible order, we also need to check if the function
can sort input where integers are repeated.

orderTriple (1, 2, 3) -> (1, 2, 3)
orderTriple (2, 1, 3) -> (1, 2, 3)
orderTriple (2, 3, 1) -> (1, 2, 3)
orderTriple (1, 3, 2) -> (1, 2, 3)
orderTriple (3, 1, 2) -> (1, 2, 3)
orderTriple (3, 2, 1) -> (1, 2, 3)

Where two elements are repeated

orderTriple (1, 1, 0) -> (0, 1, 1)
orderTriple (1, 0, 1) -> (0, 1, 1)
orderTriple (0, 1, 1) -> (0, 1, 1)

All elements are repeated

orderTriple (0, 0, 0) -> (0, 0, 0)

orderTriple (2, 3, 1)
= (minThree 2 3 1, middleThree 2 3 1, maxThree 2 3 1)
(1, middleThree 2 3 1, maxThree 2 3 1)
(1, 2, maxThree 2 3 1)
(1, 2, 3)

With xIntercept, we need to check that the function works with both valid and invalid input.

Inputs with no solutions

xIntercept 0.0 1.0 -> (0.0, False)
xIntercept 0.0 (-1.0) -> (0.0, False)

Inputs with solutions

xIntercept 1.0 1.0 -> (-1.0, True)
xIntercept 2.0 (-2.0) -> (2.0, True)

xIntercept 1.0 1.0
=  ((-1.0)/1.0, True) (As m /= 1.0)
= (-1.0, True)
