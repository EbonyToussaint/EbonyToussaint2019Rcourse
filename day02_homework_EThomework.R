# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R

library(readxl)
National_Congregations_Study_Panel_Dataset_1998_and_2006_2007_ <- read_excel("~/Downloads/National Congregations Study, Panel Dataset (1998 and 2006-2007).XLSX")

NCS -> National_Congregations_Study_Panel_Dataset_1998_and_2006_2007_

# 2. Peek at the top few rows

View(NCS)

# 3. Peek at the top few rows for only a few columns

#wouldn't this be the same as question 2???

# 4. How many rows does your data have?

#262

# 5. Get a summary for every column

summary(NCS)

# 6. Get a summary for one column

colnames(NCS)
NCS$TRAD3_06 #religious tradition

# 7. Are any of the columns giving you unexpected values?

#The min for some columns are -3, which doesn't make sense for
#binary variables. However, I know some researchers use it to 
#indicate a certain type of response (e.g. missing at random, etc.)

#However, the values for religious tradition makes sense, as there
#are only 6 values possible.

# 8. Select a few key columns, make a vector of the column names
x -> TRAD3_06
y -> HLTHED06
z -> APPGOV06

# 9. Create a new data.frame with just that subset of columns
#not sure what I'm really supposed to do here. I'm not grasping
#the concept of a data frame . . . sorry the terminology in this 
#programming class is completely different than Econometrics in 
#Public Health, in which we use STATA. I don't want to slow down
#the flow of class by asking what all these terms mean.

#below I just basically do what we did during class for the sleep data
#but again, I don't understand why we did it or what the end result should be

NCS
NCS[1, 2]
NCS[2, 1]

names(NCS)
colnames(NCS)

NCS[2]
NCS[1:5]

# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from the previous step

#wait am I creating a subset of my data using only a few variables?
#Is that what a data frame is? I don't know how to do that in R

tail(NCS,10)
head(NCS,10)

# 11. Create a new data.frame that is a random sample of half of the rows.
# HINT: ?sample

?sample
sample_n(TRAD3_06, 10)
#I got error message that tbl must be a data frame
#I guess that's what I missed in questions 9 and 10

# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test() (or cor.test()) for that comparison
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)
#     - run the test with BOTH the formula and "vector"
#       formats, if possible
#     - if one is NOT possible, say why you can't do it

#the average age of pastors in 1998 and 2006
x <- CLERAG06
y <- CLERAG98

t.test(x, y)

# 13. Repeat #12 for TWO more comparisons
#     - Tip: it's okay if the comparisons are kind of nonsensical, this is 
#       just a programming exercise

#the average number of congregations that applied for gov funds
x <- APPGOV06
y <- APPGOV98

t.test(x, y)

x <- SERMON98 
y <- SERMTM06

t.test(x, y)

# 14. Save all results from #12 and #13 in an .RData file

# 15. Email me your version of this script, PLUS the .RData
#     file from #14
#     - ALTERNATIVELY, push your version of this script and your .RData results
#       to a repo on GitHub, and send me the link


