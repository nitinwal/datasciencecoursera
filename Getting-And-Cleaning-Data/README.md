---
title: "README"
author: "Nitin Agrawal"

date: "Sunday, July 27, 2014"
output: html_document
---
This is the README for coursera project assignment on "Getting and Cleaning Data"  by Professor Jeffrey Leek.

Repository Contents
---
 1. Analysis script run_analysys.R with comments and process flow
 2. CodeBook.md providing the details of the code, variables used
 3. README.md explains how the script works
 
Script details
===========================

###**Assumptions**

 
 Solution Assumed that data directory is set as your working directory and has following folders and file in it
 
 1. README.txt
 
 2. features_info.txt
 
 3. features.txt
 
 4. activity_labels
 
 5. train folder
 
 6. test folder


###OS used


Windows 2008 


###Version of R Stdio


R-Studio Version 0.98.953 ??? ?? 2009-2013 RStudio, Inc.

R Version 3.1.1 (2014-07-10)

###Dependancies and library used

1. reshape2
2. data.table

### Steps Outlines

####Step 1 


As the folders under train and test has data under "Inertial Signals" , and is in very row format.
This has been excluded from processing

Data taken for processing includes
 \train\subject_train.txt
 \train\X_train.txt
 \train\Y_train.txt
 \test\subject_test.txt
 \test\X_test.txt
 \test\Y_test.txt
 
 
####Step 2

 
Merge data from files mentioned above  for train and test respectively to make it to one table for test and train.
Add column subject_id for subject and activity for activity performed by subject.
Achieved using cbind functions and reading the data from file into tables.

####Step 3

Merge the data in both the table and prepare one table of merged data.
Achieved using rbind

####Step 4

Manually uses Notepad++ to find out the columns having mean and std features.
Get the Ids for them. Put them in one vector.
Prepare subset of columns and put in another table, basically subset of data.
table_mean_std_data

####Step 5

Name the column name as descriptive as possible

####Step 6

Melt the data from the original format to a so called long format, where all the observed variables (called measures) appear, together with their respective value, in two adjacent columns named variable and value. For melting Subject_id and activity are used as Id variables, rest as measures.
Achieved using "melt" function.

####Step 7

Next step is to find out the average of each.
Achieved using mean functions along with dcast

##Refrences

https://class.coursera.org/getdata-004/forum/thread?thread_id=371

http://r.789695.n4.nabble.com/Remove-row-names-column-in-dataframe-td856647.html

http://stackoverflow.com
