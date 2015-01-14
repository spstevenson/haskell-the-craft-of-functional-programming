-- Exercise 3.1 An alternative version of exclusive or

exOr :: Bool -> Bool -> Bool
exOr x y = (x && not y ) || (not x && y)


-- Exercise 3.3 Using literals on the left hand side

exOr :: Bool -> Bool -> Bool
exOr True True = False
exOr True False = True
exOr False True = True
exOr False False = False

-- Exercise 3.4 Two versions of the nAnd function

nAnd :: Bool -> Bool -> Bool
nAnd x y = not (x && y)

nAnd2 :: Bool -> Bool -> Bool
nAnd2 True True = False
nAnd2 False False = True
nAnd2 True False = True
nAnd2 False False = True

