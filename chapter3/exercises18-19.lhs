3.18 Rewrite your solutions to the earlier exercises to the recommended layout.

3.19 Given the definitions

> funny x = x+x
>  peculiar y = y

explain what happens when you remove the space in front of the peculiar.

As it stands the code above throws an error as the function funny is not
ended due to the fact that the box is not closed. The box is closed when
the interpreter encounters text at the same level of indentation as the
start of the function. Moving removing the space in front of peculiar
triggers the offside rule and ends the function funny, solving the
error.