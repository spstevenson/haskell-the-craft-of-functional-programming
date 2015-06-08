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
