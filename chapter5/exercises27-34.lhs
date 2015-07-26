> type Person = String
> type Book = String

> type Database = [(Person, Book)]

> exampleBase :: Database
> exampleBase
>  = [ ("Alice", "Tintin"), ("Anna", "Little Woman"),
>     ("Alice", "Asterix"), ("Rory", "Tintin") ]

> books :: Database -> Person -> [Book]
> books dBase findPerson
>  = [ book | (person, book) <- dBase, person == findPerson ]

> makeLoan :: Database -> Person -> Book -> Database
> makeLoan dBase pers bk = [(pers,bk)] ++ dBase

> returnLoan :: Database -> Person -> Book -> Database
> returnLoan dBase pers bk
>  = [pair | pair <- dBase, pair /= (pers,bk)]

5.27 Go through the calculation of

books exampleBase "Charlie"
books exampleBase "Rory"



5.28 Define the functions borrowers, borrowed and numBorrowed. To
define numBorrowed you will probably need the length function which
returns the length of a list.

> borrowers :: Database -> Book -> [Person]
> borrowers dBase findBook = [pers | (pers, book) <- dBase, book == findBook]

