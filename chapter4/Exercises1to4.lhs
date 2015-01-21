> module Exercises1to4 where 
> import Exercises6to9

This question is about the function

maxFour :: Int -> Int -> Int -> Int -> Int

which returns the maximum of four integers. Give three definitions of this
function: the first should be modelled on that of maxThree, the second should
use the function max and the third should use the functions max and maxThree.
For your second and third solutions give diagrams to illustrate your answers.
Discuss the relative merits of the three solutions you have given.

> maxThree :: Int -> Int -> Int -> Int
> maxThree x y z
>  | x >= y && x >= z = x
>  | y >= z           = y
>  | otherwise        = z

> maxFour1 :: Int -> Int -> Int -> Int -> Int
> maxFour1 w x y z 
>  | w >= x && w >= y && w >= z = w
>  | x >= y && x >= z           = x
>  | y >= z						= y
>  | otherwise					= z

> maxFour2 :: Int -> Int -> Int -> Int -> Int
> maxFour2 w x y z = max (max w x) (max y z)

> maxFour3 :: Int -> Int -> Int -> Int -> Int
> maxFour3 w x y z = max (maxThree x y z) w

Both maxFour2 and maxFour3 are sorter and more concise than the implementation
in maxFour1. Shorter and more concise implementations are easier to understand
and maintain. Reusing common functions also means that of the implmentation of
the function needs to be altered it can be altered in one place rather than
in several places across the program. It also saves time at the programming 
stage as the functionality does not have to be typed multiple times. Finally,
depending on the implementation, reusing a function could be more efficient than
reimplementing the functionality again.

4.2 Give a definition of the function

between :: Int -> Int -> Int -> Bool

discussed in this section. The definition should be consistent with what we said
in explaining how middleNumber works. You also need to think carefully about
the different ways that one number can lie between two others. You might find
it useful to define a function

weakAscendingOrder :: Int -> Int -> Int -> Bool

so that weakAscendingOrder m n p is True exactly when m, n and p are in
weak ascending order, that is the sequence does not go down at any point. An
example of such a sequence is 2 3 3.

> weakAscendingOrder :: Int -> Int -> Int -> Bool
> weakAscendingOrder m n p = (p >= n) && (n >= m)

> between :: Int -> Int -> Int -> Bool
> between x y z = weakAscendingOrder x y z || weakAscendingOrder z y x

4.3 Give a definition of the function

howManyEqual :: Int -> Int -> Int -> Int

which returns how many of its three arguments are equal, so that

howManyEqual 34 25 36 = 0
howManyEqual 34 25 24 = 2
howManyEqual 34 34 34 = 3

Think about what functions you have already seen - perhaps in the exercises -
which you can use in the solution.

> howManyEqual :: Int -> Int -> Int -> Int
> howManyEqual x y z
>  | threeEqual x y z = 3
>  | threeDifferent x y z   = 0
>  | otherwise        = 2

4.4 Give a definition of the function

howManyOfFourEqual :: Int -> Int -> Int -> Int -> Int

which is analogue of howManyEqual for four numbers. You may need to
think what if...?

> fourDifferent :: Int -> Int -> Int -> Int -> Bool
> fourDifferent m n o p
>  | threeDifferent m n o = (p /= m) && (p /= n) && (p /= o)
>  | otherwise            = False

> howManyOfFourEqual :: Int -> Int -> Int -> Int -> Int
> howManyOfFourEqual w x y z
>  | fourEqual w x y z     = 4
>  | fourDifferent w x y z = 0
>  | threeEqual w x y 
>    || threeEqual w x z 
>    || threeEqual w y z 
>    || threeEqual x y z   = 3
>  | otherwise             = 2