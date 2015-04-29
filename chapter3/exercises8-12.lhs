> import Test.QuickCheck

3.8 Explain the effect of the function defined here:

mystery :: Integer -> Integer -> Integer -> Bool
mystery m n p = not ((m==n) && (n==p))

This function will return true if m, n and p are not all the same.

3.9 Define a function 

threeDifferent :: Integer -> Integer -> Integer -> Bool

so that the result of threeDifferent m n p is True only if all three
of the numbers m, n and p are different.

What is your answer for threeDifferent 3 4 3? Explain why you get the
answer that you do.

> threeDifferent :: Integer -> Integer -> Integer -> Bool
> threeDifferent m n p = not ((m==n) || (m==p) || (n==p))

My answer for 3 4 3 is False. This is because the inside or statement
will return true if any input variables are identical, the not operator
will then negate this.

3.10 This question is about the function

fourEqual :: Int -> Int -> Int -> Int -> Bool

which returns the value True only if all four of its arguments are equal.

> threeEqual :: Integer -> Integer -> Integer -> Bool
> threeEqual m n p = (m==n) && (n==p)

Give a definition of fourEqual modelled on the definition of threeEqual
above. Now give a definition of fourEqual which uses the function threeEqual
in its function. Compare your two answers.

> fourEqual :: Integer -> Integer -> Integer -> Integer -> Bool
> fourEqual m n p o = (m==n) && (n == p) && (p == o)

> fourEqual2 :: Integer -> Integer -> Integer -> Integer -> Bool
> fourEqual2 m n p o = (threeEqual m n p) && (p == o)

Although both answers produce the same output the second function is much more
concise and could be the better solution. Reusing functions rather than duplicating
functionality makes programs easier to understand and maintain.

3.11 Give line-by-line calculations of

threeEqual (2+3) 5 (11 `div` 2)
mystery (2+4) 5 (11 `div` 2)
threeDifferent (2+4) 5 (11 `div` 2)
fourEqual (2+3) 5 (11 `div` 2) (21 `mod` 11)

threeEqual (2+3) 5 (11 `div` 2)
(m == n) && (n == p)
((2+3)== n) && (n == p)				- From m
((2+3)==5) && (5 == p) 				- From n
((2+3)==5) && (5 == (11 `div` 2)	- From p
(5==5)&&(5 == (11 `div` 2))
(5==5)&&(5==5)
True && (5==5)
True && True
True

mystery (2+4) 5 (11 'div' 2)
not ((m==n) && (n==p))				
not (((2+4)==n) && (n==p))				- from m
not (((2+4)==5) && (5==p))				- from n
not (((2+4)==5) && (5==(11 `div` 2)))	- from p
not ((6==5) && (5==(11 `div` 2)))
not ((6==5) && (5==5))
not (False && (5==5))
not (False && True)
not False
True

threeDifferent (2+4) 5 (11 `div` 2)
not ((m==n) || (m==p) || (n==p))
not (((2+4)==n) || ((2+4)==p) || (n==p))						- from m
not (((2+4)==5) || ((2+4)==p) || (5==p))						- from n
not (((2+4)==5) || ((2+4)==(11 `div` 2)) || (5==(11 `div` 2)))	- from p
not (((6==5) || ((2+4)==(11 `div` 2)) || (5==(11 `div` 2))))
not (((6==5) || (6==(11 `div` 2)) || (5==(11 `div` 2))))
not (((6==5) || (6==5) || (5==(11 `div` 2))))
not (((6==5) || (6==5) || (5==5)))
not ((False || (6==5) || (5==5)))
not ((False || False || (5==5))
not (False || False || True)
not (False || True)
not True
False

fourEqual (2+3) 5 (11 `div` 2) (21 `mod` 11)
(m==n) && (n == p) && (p == o)
((2+3)==n) && (n == p) && (p == o)										- from m
((2+3)==5) && (5 == p) && (p == o)										- from n
((2+3)==5) && (5 ==(11 `div` 2)) && ((11 `div` 2) == o)					- from o
((2+3)==5) && (5 ==(11 `div` 2)) && ((11 `div` 2) == (21 `mod` 11)) 	- from p
(5==5) && (5 ==(11 `div` 2)) && ((11 `div` 2) == (21 `mod` 11))
(5==5) && (5 ==5) && ((11 `div` 2) == (21 `mod` 11))
(5==5) && (5 ==5) && (5 == (21 `mod` 11))
(5==5) && (5 ==5) && (5 == 10)
True && (5 ==5) && (5 == 10)
True && True && (5 == 10)
True && True && False
False

3.12 Devise QuickCheck tests for the functions that you have defined here.

> prop_noEquals1 :: Integer -> Integer -> Bool
> prop_noEquals1 x y = threeEqual x x y == (x == y) 

> prop_noEquals2 :: Integer -> Integer -> Bool
> prop_noEquals2 x y = threeEqual x y x == (x == y) 

> prop_noEquals3 :: Integer -> Integer -> Bool
> prop_noEquals3 x y = threeEqual y x x == (x == y)

> prop_fourEqual :: Integer -> Integer -> Integer -> Integer -> Bool
> prop_fourEqual w x y z = threeEqual x y z == fourEqual w x y z || not (w == x)