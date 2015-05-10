4.15 Define a type of seasons, Season, and give a function from seasons
to temperature given by the type

data Temp = Cold | Hot
 deriving (Eq, Show, Ord)

In defining this function assume that you're in the UK.

> data Season = Spring | Summer | Autumn | Winter
>  deriving (Eq, Show, Ord)

> data Temp = Cold | Hot
>  deriving (Eq, Show, Ord)

> seasonalTemperature :: Season -> Temp
> seasonalTemperature Spring = Cold
> seasonalTemperature Summer = Hot
> seasonalTemperature Autumn = Cold
> seasonalTemperature Winter = Cold

4.16 Define a type Month and a function from this type to Season,
assuming that you're in the northern hemisphere.

> data Month =
>  January |
>  February |
>  March |
>  April |
>  May |
>  June |
>  July |
>  August |
>  September |
>  October |
>  November |
>  December
>  deriving(Eq, Show, Ord)

> getSeason :: Month -> Season
> getSeason January = Winter
> getSeason February = Winter
> getSeason March = Spring
> getSeason April = Spring
> getSeason May = Spring
> getSeason June = Summer
> getSeason July = Summer
> getSeason August = Summer
> getSeason September = Autumn
> getSeason October = Autumn
> getSeason November = Autumn
> getSeason December = Winter
