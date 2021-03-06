# Day 2 lecture

##############################
# Review
# - cloning a repo from GitHub
# - pulling changes from that repo

# - setting up your own repo (locally)
# - setting up a repo on GitHub
# - pushing changes to GitHub

# - last resort for today: zip-file download from GitHub

# - workflow recommendations
# 
#   Option 1: add to Scott's repo
#   - pull changes from r_programming_bsos_winter2019
#   - DON'T modify any of Scott's files
#   - DO make new copies of files to make notes in (e.g., "day02_lecture_notes.R")
#   - DO commit your own changes (additions) before pulling new changes from GitHub
#   - NOTE: you'll need to set up a different remote to push to if you want your
#     "fork" to also live on GitHub
# 
#   Option 2: merge with Scott's repo
#   - pull changes from Scott
#   - make your own notes in the files
#   - DO commit your changes before pulling new changes from Scott
#   - MERGING: you will need to merge changes "manually" when we edit the same file

# - other workflow tips for class
#   - if you get muddled/confused, you can always clone Scott's repo in a fresh start
#   - COMMIT, COMMIT, COMMIT

# - (Drop)Box tip: a "bare" repo can serve as a kind of "just for sharing" master repo
#   1. make a repo (normal ways), make first commit, etc.
#   2. make a copy onto a "synced" folder
#   3. open a shell (Git Bash, Terminal, etc.)
#   4. use "cd" command to navigate to the repo in the synced folder
#   5. make the synced folder "bare" with:
#      git config --bool core.bare true
#   6. go back in your original repo in your normal folder
#   7. set the "origin" remote to the location of the synced repo
#      git remote add origin [PATH TO REPO IN SYNCED FOLDER]
#   8. do NOT work directly on the synced folder repo
#   9. work on your local (not synced) repo, push/pull to/from synced (bare) repo

# - other questions?

#############################
# Topics:
# - console interface - (note: temporary work space)
# - calculator and simple interactive use in the console
# - syntax/formatting basics
# - interface: scripts
# - workbench analogy
# - object basics: creating/assigning, naming
# - simple object structure: 1- and 2-dimensional structures
# - functions as "tools"
# - function structure
# - help
# - packages
# - environments
# - saving environments and objects
# - reading data from files

####################################################################

# Console
# - most "bare bones" interface with R
# - type commands at the command line, hit Enter after each command
# - code run and evaluated every time you hit Enter
# - can (usually) use up/down arrows to scroll through previous commands

# Basic calculator examples (type along!)


# Some syntax basics
# - whitespace (mostly) doesn't matter
# - no "line end" character
# - "plus" sign instead of ">" prompt when a line is "incomplete"
#    can hit Esc (or equivalent) to bail out


#########
# Scripts (note: this document is a script)
# - End with .R
# - written *entirely* in R
# - this document is a script!
# - the "comment" symbol is # or HASHTAG/ POUND SIGN
#   anything to the right of a # symbol is ignored when running code
#   (exception: if the # is part of a string, as indicated by quotes,
#   it's treated as part of that string and not as a comment character)
# - you can run entire scripts using `source()` function

# - you can use the Code tab and select comment/uncomment to
# - block an entire paragraph of text

2 + 2 # this is trivial math, can highlight and run lines or sections

# RStudio note: switching back and forth between script & console

#############################
# Workbench analogy for R use
# - R has a "workspace"
# - you add/remove/manipulate things in this workspace

##############################
# Objects: creating and naming

2 + 3 

# assignment: creating something in your workspace
x <- 2 + 3
y <- 43 * 760 # y is the variable name attached to the assigned value
x
y

y/3 #10893.33
x^5 #3125

# alternatives to <-
z = 5 # same as z <- 5

5 -> z #alternative -- I like this way because it's clear 
# that I have assigned the value of 5 to the variable z

# checking the workspace contents
# (note): this tells you all the variables you have
# (note): global environment and workspace are the same thing
objects()
ls() 

# removing things from the workspace
rm("x")
objects()
x <- 10
y <- 20
mean(x, y)

# rm(list = objects()) # remove everything from the workspace
# (note): can use broom icon next to Import Dataset

x <- 37
y <- 5
z <- 42

# object naming conventions
# cannot start with a number
b1 <- 10
# 1b <- 10 

# b1*w <- 10 # no "meaningful" symbols in object names

# some principles
# 1. make them meaningful
# 2. make them easy to type

big_long_name_that_describes_things_in_detail <- 10 # not a great name

# RStudio helps with #2
# tab-completion
big_long_name_that_describes_things_in_detail

# some different "style" options
camelCase <- 10 # Camel Case is very common and easy to read
thisIsaVariableInCamelCase <- 11
thisisavariablenotincamelcase <- 12 # harder to read
dot.delimited <- 13 # I'm not a fan of dots
underscore_delimited <- 14 # I'm a fan of underscore

# other style examples:
# https://google.github.io/styleguide/Rguide.xml
# http://adv-r.had.co.nz/Style.html


# case matters
x <- 10
X <- 10
x
X
I <- 10
l <- 10
# upshot: avoid upper-case or "ambiguous" characters to help avoid confusion


######################
# Structure of objects

# simple structure: vectors
# c() # means concatenate -- link (things) together in a chain or series 
# seq() for sequences
# x:y as a shortcut for seq(from = x, to = y, by = 1)
# [] for subsetting
x <- c(1, 2, 3, 4)
x
seq(from = 1, to = 20)
seq(from = 2, to = 20, by = 2)
1:100

x <- c(4, 60, 5, 10)
x
x[3]
x[4]

y <- seq (3, 60, 3)
y
y[7:11]

y [c(7, 11, 8, 13, 2)]

# syntax note: [square brackets] are used ONLY for "extraction"/subsetting
#              (parentheses) are used in math, and in functions (more below)


##########
# Vectors:
# - all a single data type
# - always one-dimensional
# - multi-dimensional things are other types of objects
#   - data frames
#   - lists
#   - matrices
#   - arrays

#############
# Data frames
# - two dimensional
# - columns act as vectors (all same data type)
# - ideal standard format for (most) data
# - columns = variables, rows = cases
data() # use to find R data sets
?sleep

# [rows, columns]  
sleep
sleep[1, 2]
sleep[2, 1]

# names
names(sleep)
colnames(sleep)

sleep[2, "extra"] # names >> numbers (usually)

sleep["2", "extra"] # in practice, don't use rownames!

sleep[1:5, c("ID", "extra")]

# $

sleep$extra
sleep$extra[1:5]
(sleep$extra * 4)[1:5]


# Some handy functions for inspecting data frames
# head(), tail()
# nrow(), ncol()
# summary()
# colnames()
# View()
head(sleep)
tail(sleep)
head(sleep,10)
summary(sleep)
View(sleep) # nice to see a visual of the variable values

mysleep <- sleep

View(mysleep)

colnames(sleep)

###########
# Functions
# - everything in R is an object!
# - some objects function as "tools" -- they *do* stuff
# - these are "functions"
# - functions are still objects, too!

# syntax: FUNCTIONNAME(arg1, arg2, arg3...)

# functions return a single value, but may have other "side effects"
# the returned value may be complex, but it is still a single *object*

# examples: rnorm(), t.test()
# with made-up vectors
rnorm(10)
x <- rnorm(10000)

set.seed(42)
rnorm(5)


################
# Quick practice

# using [ ] and <-, pull out some numbers from the sleep data, and compare with t.test

sleep

x <- sleep [1:10, 1] # separate into two groups for analysis
y <- sleep [11:20, 1]

t.test(x,y)
t.test(sleep[1:10, 1], sleep [11:20, 1])

x <- sleep$extra[1:10]
y <- sleep$extra[11:20]
y <- sleep [1:10, "extra"]

###################
# More on arguments
# - names
# - order
# - optional vs. required

?rnorm # The Normal Distribution
help(rnorm)
rnorm(10)
rnorm(n = 10)
rnorm(5, 1, 3)
x <- rnorm(10000, 10, 3)
mean(x)
sd(x)

x <- rnorm(10000, mean = 10, sd = 3)
rnorm(5, mean = 10)
rnorm(5,sd = 70)
rnorm(5, 10, 2)
rnorm(5, sd = 2, mean = 10)
rnorm(5, sd = 2, 10)

# getting help()


# finding help
# Google
# "fuzzy matching" with ??

# sometimes hints from tab-completion in RStudio

# can be sloppy with argument names
rnorm(5, me = 10)

x <- rnorm(20, 2, 1)
y <- rnorm(20, 4, 1)

t.test(x, y)
?t.test

ttest.result <- t.test(x,y)
print(ttest.result)
names(ttest.result)

# return to t-test (options)
t.test(x, y, paired = TRUE)

########################################
# PRACTICE TIME!
# Complete items 1-3 in day02_practice.R
########################################
?iris
my.iris <- iris
head(my.iris)
View(my.iris)

##########
# Packages

library(MASS)
install.packages("dplyr")
library(dplyr)
install.packages(c("ggplot2", "tidyr"))
library(ggplot2)
install.packages("tidyverse") # https://www.tidyverse.org/


Yes
# update.packages()

##############
# Environments

# workspaces

# naming conflicts

# MASS::select(x)  # 
# select(x) # this will run the dplyr version of select()

# saving workspaces & objects
# save(), load()
# .RData


########################################
# PRACTICE TIME!
# Complete items 4-7 in day02_practice.R
########################################


#########################
# Reading data from files

# read.table() family
?read.table
# for SPSS
# old package: `foreign`
# new package: `haven`

# for Excel: `readxl`
# install.packages("readxl")
# library(readxl)

# Others?

####################################
# PRACTICE: Try to read in your data
####################################

library(readxl)
National_Congregations_Study_Panel_Dataset_1998_and_2006_2007_ <- read_excel("~/Downloads/National Congregations Study, Panel Dataset (1998 and 2006-2007).XLSX")
