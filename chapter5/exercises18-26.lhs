> import Prelude hiding (elem)
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

> isPrime :: Integer -> Bool
> isPrime n = divisors n == [1,n]

5.21 Define the function

matches :: Integer -> [Integer] -> [Integer]

which picks out occurences of an integer n in a list.
For instance,

matches 1 [1,2,1,4,5,1] -> [1,1,1]
matches 1 [2,3,4,6]  -> []

Using matches or otherwise, define a function

elem :: Integer  -> [Integer] -> Bool

which is True if the Integer is an element of the list,
and False otherwise. For the examples above, we have

elem 1 [1,2,1,4,5,1] -> True
elem 1 [2,3,4,6] -> False

Since elem is a prelude function, it must be hidden.

> matches :: Integer -> [Integer] -> [Integer]
> matches elem list = ([x | x <- list, elem == x])

> elem :: Integer -> [Integer] -> Bool
> elem n list = matches n list /= []

5.22 Define a function

onSeparateLines :: [String] -> String

which takes a list of strings and returns a single
string which when printed shows the strings on separate
lines.

> onSeparateLines :: [String] -> String
> onSeparateLines lines = concat [x ++ ['\n'] | x <- lines]

5.23 Give a function

duplicate :: String -> Integer -> String

which takes a string and an integer, n. The result is n copies
of the string joined together. If n is less than or equal
to 0, the result should be the empty string, "", and if
n is 1, the result will be the string itself.

> duplicate :: String -> Integer -> String
> duplicate str n
>  | n < 1 = ""
>  | n == 1 = str
>  | otherwise = str ++ (duplicate str (n-1))

5.24 Give a function

pushRight :: String -> String

which takes a string and forms a string length lineLength
by putting spaces at the front of the string. If lineLength
were 12 then pushRight "crocodile" would become "   crocodile".
How would you make linelength a parameter of this function?

> pushRight :: String -> Integer-> String
> pushRight str linelength
>  | toInteger (length str) == linelength = str
>  | otherwise = " " ++ (pushRight str (linelength-1))

5.25 Can you criticize the way the previous function is specified?
Look for a case in which it is not defined what it should do - it
is an exceptional case.

The previous function is not defined when the length of the string
is greater than linelength.

Define a function

fibTable :: Integer -> String

which produces a table of fiboncci numbers. For instance, the effect
of putStr (fibTable 6) should be

n	fib n
0           0
1           1
2           1
3           2
4           3
5           5
6           8

> padRight :: String -> Integer -> String
> padRight str linelength
>  | toInteger (length str) == linelength = str
>  | otherwise = (padRight str (linelength-1)) ++ " "

> columnSize :: Integer
> columnSize = 12

> fibTable :: Integer -> String
> fibTable n 
>  | n < 0 = (pushRight "n" columnSize) ++ (pushRight "fib n" columnSize) ++ "\n"
>  | otherwise = fibTable (n-1) ++ (pushRight (show n) columnSize) ++ (pushRight (show (fib n)) columnSize) ++ "\n"

> fib :: Integer -> Integer
> fib n
>  | n == 0 = 0
>  | n == 1 = 1
>  | otherwise = (fib (n-1)) + (fib (n-2))
