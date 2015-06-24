5.15 What value has the expression [0, 0.1 .. 1]? Check your answer
in GHCi and explain any discrepency there might be between the two.

The value would be [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]

When we check in GHCi we see that the above is not strictly correct as floating
point precision does not allow us to represent some numbers exactly.

5.16 How many items does the list [2,3] contain? How many does [[2,3]] contain?
What is the type of [[2,3]]?

[2,3] contains two elements. [[2,3]] contains only one element. [[2,3]] is
a list of integer lists.

[[Integer]]

5.17 What is the result of evaluating [2 .. 2]? What about [2,7 .. 4]? Try
evaluating [2,2 .. 2].

[2..2] = [2]. The result of evaluating [2,7 .. 4] is [2]. Trying
to evaluate [2,2..2] results in an infinitely long list of 2.
