4.5 Define the function rangeProduct which when given natural numbers m and n
returns the product

m*(m+1)*...*(n-1)*n

You should include in your definition the type of the function, and your function
should return 0 when n is smaller than m.
Hint: you do not need to use recursion in your definition, but you may if you
wish.

> rangeProduct :: Int -> Int -> Int
> rangeProduct m n
>  | m > n = (rangeProduct (m-1) n) * m
>  | m == n = n
>  | otherwise = 0

4.6 As fac is a special case of rangeProduct, write a definition of fac which uses
rangeProduct.

> fac :: Int -> Int
> fac x = rangeProduct x 1