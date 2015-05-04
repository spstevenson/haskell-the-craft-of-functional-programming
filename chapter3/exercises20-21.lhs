> import Test.QuickCheck

3.20 Give a function to return the average of three integers

averageThree :: Integer -> Integer -> Integer -> Float

Using this function define a function 

howManyAboveAverage :: Integer -> Integer -> Integer -> Integer

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

3.21 How would you write QuickCheck properties to test the functions
averageThree and howManyAboveAverage?

> prop_lessThanThree :: Integer -> Integer -> Integer -> Bool
> prop_lessThanThree x y z = howManyAboveAverage x y z < 3

> prop_greaterThanZero :: Integer -> Integer -> Integer -> Bool
> prop_greaterThanZero x y z 
>  = howManyAboveAverage x y z > 0 || (x == y && x == z)

> prop_notLess :: Integer -> Integer -> Integer -> Bool
> prop_notLess x y z = not ( fromIntegral x < averageThree x y z
>  && fromIntegral y < averageThree x y z 
>  && fromIntegral z < averageThree x y z)

> prop_notGreater :: Integer -> Integer -> Integer -> Bool
> prop_notGreater x y z = not ( fromIntegral x > averageThree x y z
>  && fromIntegral y > averageThree x y z 
>  && fromIntegral z > averageThree x y z)