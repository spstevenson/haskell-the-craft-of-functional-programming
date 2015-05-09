> import Prelude
> import Test.QuickCheck

4.11 Define a data type Result which represents the outcome of a round
of Rock - Paper - Scissors, which will be a win, lose or draw.

First lets define all the types and function from the book.

> data Move = Rock | Paper | Scissors
>  deriving (Show, Eq)

> beat :: Move -> Move
> beat Rock = Paper
> beat Paper = Scissors
> beat Scissors = Rock

> lose :: Move -> Move
> lose Rock = Scissors
> lose Paper = Rock
> lose _ = Paper

> data GameResult = Win | Lose | Draw
>  deriving (Show, Eq)

4.12 Define a function

outcome :: Move -> Move -> GameResult

so that this gives the outcome of a round for the first
player. For example, we should expect that outcome Rock
Scissor should be a win.

> outcome :: Move -> Move -> GameResult
> outcome myMove theirMove
>  | myMove == (beat theirMove) = Win
>  | myMove == (lose theirMove) = Lose
>  | otherwise = Draw

4.13 We have added some 'magic' to the Chapter4 module
to allow QuickCheck properties to be tested over the 
type. Define a QuickCheck property which connects the
results of beat and lose.

> instance Arbitrary Move where
>  arbitrary = elements [Rock, Paper, Scissors]

> prop_inverse :: Move -> Bool
> prop_inverse mv = mv == (lose (beat mv))

4.14 How would you define a QuickCheck property to test
the output function?

> prop_loseOutcome :: Move -> Bool
> prop_loseOutcome mv = outcome mv (lose mv) == Win

> prop_beatOutcome :: Move -> Bool
> prop_beatOutcome mv = outcome mv (beat mv) == Lose
