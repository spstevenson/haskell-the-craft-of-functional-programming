{-############################################################

	FirstScript.hs
	
	Simon Thompson, June 1998
	
	The purpose of this script is
		- to illustrate some simple definitions
		  over integers (Int);
		- to give a first example of a script.
		
############################################################-}

module FirstScript where

--	The value size is an Integer (Int), defined to be
--  the sum of twelve and thirteen.

size :: Integer
size = 12 + 13

--	The function to square an integer.

square :: Integer -> Integer
square n = n*n

-- The function to double an integer.

double :: Integer -> Integer
double n = 2*n

--	An example using double, square and size.

example :: Integer
example = double (size - square (2+2))