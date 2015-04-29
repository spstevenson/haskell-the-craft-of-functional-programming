> import Prelude hiding (max, (&&), (||))
> import Test.QuickCheck

3.1 Give another version of the definition of 'exclusive or' which works informally like this:
'exclusive or of x and y will be True if either x is True and y is False or x is False and y is True

> exOr :: Bool -> Bool -> Bool
> exOr x y = (x && not y ) || (not x && y)

3.2 Give the 'box and line' diagram (like the one on page 42) corresponding to your answer to the previous
question.

Diagram in SVG file.

3.3 Using literals on the left-hand side we can make the truth table for a function into its Haskell
definition. Complete the following definition of exOr in this style

> exOr2 :: Bool -> Bool -> Bool
> exOr2 True True   = False
> exOr2 True False  = True
> exOr2 False True  = True
> exOr2 False False = False

3.4 Give your own definitions of the builtin && and ||. If you want to use the same operator for &&, say,
you will need to make sure you hide its import. You can do this by adding it to the list of what is hidden, thus

import Prelude hiding (max, (&&))

after the module declaration at the start of the Chapter 3 module.

> (&&) :: Bool -> Bool -> Bool
> (&&) a b = not ( not a || not b)

> (||) :: Bool -> Bool -> Bool
> (||) True a = True
> (||) a True = True
> (||) False False = False

3.5 Give teo different definitions of the nAnd function

nAnd :: Bool -> Bool -> Bool

which returns the result True except when both its arguments are True. Give a diagram illustrating one of 
your definitions.

> nAnd :: Bool -> Bool -> Bool
> nAnd a b = not (a && b)

> nAnd2 :: Bool -> Bool -> Bool
> nAnd2 True True = False
> nAnd2 a False = True
> nAnd2 False a = True

3.6 Give line-by-line calculations of 

nAnd True True
nAnd True False

nAnd True True
not ( a && b )
not ( True && b ) 		- From a
not ( True && True ) 	- From b
not True
False

nAnd True False
not (a && b)
not (True && b)			- From a
not (True && False)		- From b
not (False)
True

nAnd2 True True
False

nAnd2 True False
a False
True

for each of your definitions of nAnd in the previous exercise.

3.7 Write QuickCheck properties to test the functions you have written in the earlier exercises. You might
be able to check one version of a function against another, or perhaps think up different properties for
your functions.

> prop_exOr :: Bool -> Bool -> Bool
> prop_exOr x y = exOr x y == exOr2 x y

> prop_deMorgans :: Bool -> Bool -> Bool
> prop_deMorgans x y = not x && not y == not (x || y)

> prop_nAnd :: Bool -> Bool -> Bool
> prop_nAnd x y = nAnd x y == not (x && y)