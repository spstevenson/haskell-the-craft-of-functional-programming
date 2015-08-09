import Test.QuickCheck

> type Person = String
> type Book = String
> type Record = (Person, Book)

> type Database = [Record]

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

person	=	"Alice"		"Anna"		"Alice"		"Rory"
book	=	"Tintin"	"Little Women"	"Asterix"	"Tintin"
(person ==	F		F		F		F
 "Charlie")
book	=

person	=	"Alice"		"Anna"		"Alice"		"Rory"
book	=	"Tintin"	"Little Women"	"Asterix"	"Tintin"
(person ==	F		F		F		T
 "Rory)
book 	=							"Tintin"

5.28 Define the functions borrowers, borrowed and numBorrowed. To
define numBorrowed you will probably need the length function which
returns the length of a list.

> borrowers :: Database -> Book -> [Person]
> borrowers dBase findBook = [pers | (pers, book) <- dBase, book == findBook]

> borrowed :: Database -> Book -> Bool
> borrowed dBase findBook = [book | (pers, book) <- dBase, book == findBook] /= []

> numBorrowed :: Database -> Person -> Int
> numBorrowed dBase pers = length (books dBase pers)

5.29 Give calculations of

returnLoan exampleBase "Alice" "Asterix"
returnLoad exampleBase "Alice" "Little Women"

pair =			("Alice","Tintin")	("Anna","Little Women")	("Alice","Asterix")	("Rory","Tintin")
(pair /=
("Alice","Asterix")	T			T			F			T
pair	=		("Alice",Tintin")	("Anna","Little Women")				("Rory","Tintin")

pair =			("Alice","Asterix")	("Anna","Little Women")	("Alice","Asterix")	("Rory","Tintin")
(pair /=		
("Alice",
"Little Women")		T			T			T			T
pair =			("Alice","Asterix")	("Anna","Little Women")	("Alice","Asterix")	("Rory","Tintin")

5.30 How would you have to modify the database if you had used the type

data Loan = Loan Person Book

to model individual loans, rather than the tuple type?

> data Loan = Loan Person Book
> 	deriving (Show, Eq, Ord)

> type LoanDatabase = [Loan]

> getBook :: Loan -> Book
> getBook (Loan _ book) = book

> getPerson :: Loan -> Person
> getPerson (Loan person _) = person

> exampleLoanDatabase :: LoanDatabase
> exampleLoanDatabase = [Loan "Alice" "Tintin", Loan "Anna" "Little Women", Loan "Alice" "Asterix", Loan "Rory" "Tintin"]

> loanBooks :: LoanDatabase -> Person -> [Book]
> loanBooks db findPers = [getBook loan | loan <- db, findPers == getPerson loan]

> loanBorrowers :: LoanDatabase -> Book -> [Person]
> loanBorrowers db findBook = [getPerson loan | loan <- db, getBook loan == findBook]

5.31 How would you express this as a QuickCheck property:

	"Suppose that a particular bk is not loaned to a pers. Now make a
	random loan of bk2 to pers2. bk should not be loaned to pers."

Would you expect this property to hold? If so, why? If not, why not, and how
would you modify it so it does hold?

> prop_notAddedNotLoaned :: Book -> Person -> Bool
> prop_notAddedNotLoaned bk pers = notElem "bk" (books (makeLoan [] pers bk) "pers")

This would hold unless the bk == bk2 and pers == pers2, the property could be modified
as follows.

> prop_notAddedNotLoaned2 :: Book -> Person -> Bool
> prop_notAddedNotLoaned2 bk2 pers2
>  | bk == bk2 || pers == pers2 = True
>  | otherwise = notElem bk (books (makeLoan [] pers2 bk2) pers)
>  where
>   bk = "Rick"
>   pers = "Moby Dick" 

5.32 Discuss how you would implement the database functions had you used the representation
[(Person, [Book])] rather than [(Person, Book)] for the database.

If this representation was used we would have to write a function to find the person from the
list first, and then modify the list of books for that person. When a person doesn't exist,
we would have to create the tuple with an empty list and then start adding books. Likewise,
when removing books we would have to check if the books list is now empty and remove the
(Person, [Book]) tuple.

When getting the lists of all Person we could do a list comprehension that extracts the
all the Persons into a list. When getting a list of all the Books we would have to extract
all the lists of books with a list comprehension and concatenate all these lists.

5.33 How would the tests for the database have to be modified to work with the implementation
defined in the previous question? Would the QuickCheck properties have to be modified: if so,
how? If not, why not?
 
We would not have to modify the tests too much. The properties of the function should remain
the same, but the database parameter will have to change if it explicitly defined as the function
uses a different database representation. The property that we defined in 5.31 would not have
to change.

5.34 Define functions to give more readable output from the database operations of this section.

> showEntry :: (Person, Book) -> String
> showEntry (pers, bk) = "Borrower: " ++ pers ++ ", Book: " ++ bk ++ "\n"

> showDatabase :: Database -> String
> showDatabase db = concat [showEntry entry | entry <- db]
