#########################################################

	FirstLiterate.lhs
	
	Simon Thompson, June 1998
	
	The purpose of this script is
		-	to illustrate some simple definitions
			over integers (Int);
		-	to give a first example of a literate script.
		
#########################################################

The value size is an integer (Int), defined to be the sum of
twelve and thirteen.

>	size :: Int
> 	size = 12 + 13

The function to square an integer

>	square :: Int -> Int
>	square n = n*n

The function to double an integer

>	double :: Int -> Int
>	double n = 2*n

An example using double, square and size

>	example :: Int
>	example = double(size - square(2+2))

The function for task 4 that doubles the input and squares the result

>	squareDouble :: Int -> Int
>	squareDouble n = square (double n)

The function for task 4 that squares the input and doubles the result

>	doubleSquare :: Int -> Int
>	doubleSquare n = double (square n)