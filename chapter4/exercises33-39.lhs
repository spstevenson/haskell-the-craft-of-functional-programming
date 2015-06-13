> import Test.HUnit
> import Test.QuickCheck

4.33 Devise test data for a function

allEqual :: Integer -> Integer -> Integer -> Bool

intended to test whether its three integer inputs are equal.

We have three general cases here. Firstly, if the integer inputs are equal.
Secondly, if two are equal. Thirdly, if all three integer inputs are different.

We could start with the following test data

allEqual 1 1 1
allEqual 1 1 0
allEqual -1 1 0

The last test also tests whether the function works with negative number.
Finally, there are several different ways in which we could have two
different values. So we can expand our tests values with...

allEqual 1 0 1
allEqual 0 1 1

4.34 Use the test data from the previous question to test the function.

> solution :: Integer -> Integer -> Integer -> Bool

> solution m n p = ((m+n+p)==(3*p))

Discuss your results.

> testSolution1 = TestCase (assertEqual "for: solution 1 1 1" True (solution 1 1 1))
> testSolution2 = TestCase (assertEqual "for: solution 1 1 0" False (solution 1 1 0))
> testSolution3 = TestCase (assertEqual "for: solution -1 1 0" False (solution (-1) 1 0))
> testSolution4 = TestCase (assertEqual "for: solution 1 0 1" False (solution 1 0 1))
> testSolution5 = TestCase (assertEqual "for: solution 0 1 1" False (solution 0 1 1))

> testsSolution = TestList [testSolution1, testSolution2, testSolution3, testSolution4, testSolution5]

The third test fails. We can see that we have uncovered a flaw in the function, namely that if m+n = 2p
then the function will return true even if all three variables are not equal. If the function were a black
box, it would be difficult to devise test data that uncovers this flaw.

4.35 The function

allDifferent :: Integer -> Integer -> Integer -> Bool

should return True only if all inputs are different. Devise black box test data for this function.

We want to target the following classes of data: all the same, 2 the same and all different.

allDifferent 0 0 0
allDifferent 0 1 2
allDifferent 1 1 0

We could also check each combination for two the same.

allDifferent 1 0 1
allDifferent 0 1 1

4.36 Test the following function

> attempt :: Integer -> Integer -> Integer -> Bool
> attempt m n p = (m/=n) && (n/=p)

using the test data written in the previous question. What do you conclude from your results?

> testAttempt1 = TestCase (assertEqual "for: attempt 0 0 0" False (attempt 0 0 0))
> testAttempt2 = TestCase (assertEqual "for: attempt 0 1 2" True (attempt 0 1 2))
> testAttempt3 = TestCase (assertEqual "for: attempt 1 1 0" False (attempt 1 1 0))
> testAttempt4 = TestCase (assertEqual "for: attempt 1 0 1" False (attempt 1 0 1))
> testAttempt5 = TestCase (assertEqual "for: attempt 0 1 1" False (attempt 0 1 1))

> testAttempt = TestList [testAttempt1, testAttempt2, testAttempt3, testAttempt4, testAttempt5]

The test case attempt 1 0 1 return True instead of false so we know the provided function
is incorrect.

4.37 Devise test data for a function 

howManyAboveAverage :: Integer -> Integer -> Integer -> Integer

which returns how many of its three integer inputs are above their average value.

Firstly the case where they are all the same

howManyAboveAverage 0 0 0 

we should get zero back from this as none are above the average. The rest of the cases can
be divided into when 2 or 1 value is above the average and the permutations of the input 
parameters these values can take.

2 above the average

howManyAboveAverage 100 100 1
howManyAboveAverage 100 1 100
howmanyAboveAverage 1 100 100

1 above the average

howManyAboveAverage 100 1 1
howManyAboveAverage 1 100 1
howManyAboveAverage 1 1 100

4.38 Devise test data for a function to raise two to a positive integer power.

The first value to test would be one, as the first integer this is a boundary value
between valid and invalid input and would be useful to test.

positivePowerOfTwo 1 -> Should equal 2

The next value we could check would be a standard value, say 64 as this is 
a common power of two used in computing

positivePowerOfTwo 64 -> Should equals 1.8446744e+19

Finally if our function purports to work with any positive integer, we should test
with a very large input that gives a very large output.

positivePowerOfTwo 1000 -> Should equal 1.071509e+301

4.39 Repeat these exercises to define QuickCheck properties which can be used to test
these functions.

The first property is that allEqual should never equal allDifferent.

> prop_notAllEqualAndAllDifferent :: Integer -> Integer -> Integer -> Bool

> prop_notAllEqualAndAllDifferent m n p = not (solution m n p && attempt m n p)

The result of allEqual and allDifferent should be the same whatever order the parameters
are in.

> prop_allEqualIsCommutative :: Integer -> Integer -> Integer -> Bool
> prop_allEqualIsCommutative m n p = (solution m n p) == (solution p m n) && (solution m n p) == (solution n p m)

> prop_allDifferentIsCommutative :: Integer -> Integer -> Integer -> Bool
> prop_allDifferentIsCommutative m n p = (attempt m n p) == (attempt p m n) && (attempt m n p) == (attempt n p m)

We have already defined quick check properties for howManyAboveAverage in exercise 3.21

> averageThree :: Integer -> Integer -> Integer -> Float
> averageThree x y z = fromIntegral (x + y + z) / 3.0

> boolToInt :: Bool -> Integer
> boolToInt True = 1
> boolToInt False = 0

> howManyAboveAverage :: Integer -> Integer -> Integer -> Integer

> howManyAboveAverage x y z =
>  boolToInt (fromIntegral x > averageThree x y z) +
>  boolToInt (fromIntegral y > averageThree x y z) +
>  boolToInt (fromIntegral z > averageThree x y z)

> prop_lessThanThree :: Integer -> Integer -> Integer -> Bool
> prop_lessThanThree x y z = howManyAboveAverage x y z < 3

> prop_greaterThanZero :: Integer -> Integer -> Integer -> Bool
> prop_greaterThanZero x y z 
>  = howManyAboveAverage x y z > 0 || (x == y && x == z)

With powers of two, n+1 should be double n.

Need to figure out how to define input ranges in quick test so we can avoid quick check using 0.


> prop_double :: Integer -> Bool
> prop_double n 
>  | n == 0 = True
>  | otherwise = recursivePower (abs n+1) == 2 * (recursivePower (abs n))

> recursivePower :: Integer -> Integer

> recursivePower n
>  | n == 1 = 2
>  | n `rem` 2 == 0 = recursivePower m * recursivePower m
>  | n `rem` 2 == 1 = recursivePower m * recursivePower m * 2
>   where
>   m = n `div` 2
