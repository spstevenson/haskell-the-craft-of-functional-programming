6.1 Give the most general types for the functions snd and sing defined by

snd (x, y) = y
sing x = [x]

snd :: (a, b) -> b
sing :: a -> [a]

6.2 Explain why

[[a]] -> [[a]]

is a type for id but why it is not the most general type for this function.

The most general type for this function is a -> a. This type is more general
as it includes the type [[a]] -> [[a]] . The id
function simply returns the input, so a -> a works for this function.

6.3 Earlier in the chapter we saw the example of

shift :: ((Integer, Integer), Integer) -> (Integer,(Integer,Integer)
shift ((x,y),z) = (x,(y,z))

What is the most general type for shift, if the type declaration is omitted?

((a,b),c) -> (a,(b,c))
