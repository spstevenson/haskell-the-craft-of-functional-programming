> import Data.Char

5.18 Give a definition of the function

doubleAll :: [Integer] -> [Integer]

which doubles all the elements of a list of integers.

> doubleAll ::[Integer] -> [Integer]
> doubleAll input = [2*n | n <- input]

5.19 Give a definition of a function

capitalize :: String -> String

which converts all small letters in a String into
capitals, leaving the other characters unchanged.
How would you modify this function to give

capitalizeLetters :: String -> String

which behaves in the same way except that all
non-letters are removed from the list?

> capitaliseLetters :: String -> String
> capitaliseLetters letters = ([toUpper x | x <- letters])

> capitaliseAndRemove :: String -> String
> capitaliseAndRemove letters= ([toUpper x | x <- letters, isLetter x])

5.20 Define the function

divisors :: Integer -> [Integer]

which returns the list of divisors of a positive integer (and the empty)
list for other inputs). For instance,

divisors 12 -> [1,2,3,4,6,12]

A prime number is a number whose only divisors are 1 and n. Using
divisors or otherwise define a function

isPrime :: Integer -> Bool

which checks whether or not a positive integer is prime (and returns
False if its input is not a positive integer).

> divisors :: Integer -> [Integer]
> divisors n = ([ x | x <- [1..n], n `rem` x == 0])
