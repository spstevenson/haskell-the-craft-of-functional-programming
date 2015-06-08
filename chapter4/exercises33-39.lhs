> import Test.HUnit

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

> testSolution1 = TestCase (assertEqual "for: solution 1 1 1" True (solution 1 1 1))
