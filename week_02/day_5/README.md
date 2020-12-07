---
title: "1.3 weekend_homework_cleaning_and_analysis"
output: html_document
---


1.1.1 

Read in document using read_csv

1.1.2 

Used the rename function to change names of variables to conform to snakecase. Renamed "mass (g)' to mass_in_grams and "fall" to fall_status

1.1.3

Used pivot_wider function to split GeoLocation into latitude and longitude. Seperator was a comma.

Followed with the mutate function to create new versions of the columns that removed the unnecessary brackets within the values. Used the str_replace_all function to find and replace the characters. 

Finished question by using transform function and as.numeric to change the column values from character to numeric.

Renamed meteorite_landings at every step of this process so it would overwrite the original file.

1.1.4

Replaced all missing values with zero by using the coalesce function. Set NA remove to TRUE so it would replace any NA values with zero. Wrapped the code in the mutate function so that it would create new columns, and assigned this code to meteorite_landings so that it would overwrite it. 


1.1.5

Used the filter function, setting the filter within the bracket mass_in_grams to anything less than 1000. Assigned to a new variable meteorite_landings_filtered because it removed some of the data

1.1.6

Called on the arrange function, followed by desc, to arrange meteorite landings by year (desc so it would show from most recent to least). 



I wasn't sure how to use assertive programming for the first question, but for the second I took a stab by using the verify function and setting the parameters for longitude and latitude to within what was specified by the question. The code ran but nothing popped up, which I assume is a good thing.




1.2.1

Used read_csv after loading tidyverse.

1.2.2

Used the arrange and desc functions in first part of pipeline to arrange in descending order by mass_in_grams, and then head(10) to pull up the top 10 largest meteorites in the data.

1.2.3

Assigned two new variables for fell and found meteorites. 

For both, I used the filter function first to single them out, and then the summarise function wrapped around the mean function to find the average mass.


1.2.4

I used the filter function to pull anything with a value of 2000 or greater, which gives me the years required. In the next bit of my pipeline I simply used nrow- the number of rows should tell us how many meteorites there were this millenium.






















































































