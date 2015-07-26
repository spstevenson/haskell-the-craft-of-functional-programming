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

5.27 Go through the calculation
