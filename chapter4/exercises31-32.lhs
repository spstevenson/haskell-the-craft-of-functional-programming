4.31 Give a recursive definition of a function to find the highest
common factor of two positive integers.

> dijkstrasAlgorithm :: Integer -> Integer -> Integer

> dijkstrasAlgorithm m n
>  | m == n = m
>  | m > n = dijkstrasAlgorithm (m-n) n
>  | n > m = dijkstrasAlgorithm (n-m) m

4.32 Suppose we have to raise 2 to the power n. If n is even, 2*m say, then

2^n = 2^(2*m) = (2^m)^2

If n is odd, 2*m+1 say, then

2^n = 2^(2*m+1) = (2^m)^2 * 2

Give a recursive function to compute 2^n which uses these insights.

> recursivePower :: Integer -> Integer

> recursivePower n
>  | n == 1 = 2
>  | n `rem` 2 == 0 = recursivePower m * recursivePower m
>  | m `rem` 2 == 1 = recursivePower m * recursivePower m * 2
>   where
>   m = n `div` 2
