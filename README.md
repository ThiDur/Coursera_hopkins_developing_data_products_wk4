## Introduction

The app shows the amount of US arrests for murders per 100.000 people against the amount of US arrests for assualts per US state. The colours of the points (blue or red) indicate if Obama or Romney won that state in the 2012 elections. Two hypothesis are thereby visualized:
1) There is a relation between murders per 100.000 people and assaults per state
2) Red states with usually more liberal gun laws have higher violence rates

A third hypothesis (cities tend to have more violence than the country side) can be visualized by switching between the first plot (general numbers) and the second plot (numbers multiplied by the percentage of people living in urban areas).

## Usage
On the left sidebar (named 'Plot information') there are radio buttens
-- The first radio butten makes the graph show only the number of murders / assults per 100.000 people
-- The second radio butten makes the graph show the number of murders / assults per 100.000 people multiplied by the percentage of people living in urban areas

## Data
-- The murder, assault and percentage of people living in urban areas used comes from the R packages USArrests
-- The data on the US elections comes from the Wikipedia page on US elections 2012 (https://en.wikipedia.org/wiki/2012_United_States_presidential_election)