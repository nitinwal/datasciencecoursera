---
title: "Getting and Cleaning Data - Codebook"
author: "Nitin Agrawal"
date: "Sunday, July 27, 2014"
output: html_document
---

This is the code book for coursera project "Getting and Cleaning Data"  by Professor Jeffrey Leek.

Data Source
---
The instructor of the class has provided the raw data in zipped format.
Description about data can be found at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Goal of project
---
1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##Data Details

30 Individual participated in data collection. They are represented by Numeric no from 1 to 30 , called as Subject_id


These people are subject to following activities:

- **walking**

- **walking_upstairs**

- **walking_downstairs**

- **sitting**

- **standing**

- **laying**

 Using Samsung phone , Accelerometer and gyroscope readings were captured  for above activities.

## **Important libraries used**

  1. reshape2
  2. data.table
  3. defaults libraries coming R Studio

## **OS used to develop project**<br>

   Solution was implemented on Windows 2008.
    


## **Merging of data**

The data in train folder has been merged to one table , similarly the data in test table.

train_table represents the data in train table.

test_table represents data after merging for test folder.

merged_data_table represents the merged data from both the tables.


##**Table having mean and std data only**

table_mean_std_data represents the data for all the variable having mean and std deviation.

There are 66 variable that have mean and std values as described below as their column name.

These are the features represented in features.txt and detail explanation of that is available in 
features_info.txt , features.txt and README.txt <br>

  "Mean value Body Acceleration Signal in X-Axis direction"
  
  "Mean value Body Acceleration Signal in Y-Axis direction"
  
  "Mean value Body Acceleration Signal in Z-Axis direction"
  
  "Std deviation Body Acceleration Signal in X-Axis direction"
  
  "Std deviation Body Acceleration Signal in Y-Axis direction"
  
  "Std deviation Body Acceleration Signal in Z-Axis direction"
  
  "Mean value Gravity Acceleration Signal in X-Axis direction"
  
  "Mean value Gravity Acceleration Signal in Y-Axis direction"
  
  "Mean value Gravity Acceleration Signal in Z-Axis direction"
  
  "Std deviation Gravity Acceleration Signal in X-Axis direction"
  
  "Std deviation Gravity Acceleration Signal in Y-Axis direction"
  
  "Std deviation Gravity Acceleration Signal in Z-Axis direction"
  
  "Mean value Body Acceleration during jerk Signal in X-Axis direction"
  
  "Mean value Body Acceleration during jerk Signal in Y-Axis direction"
  
  "Mean value Body Acceleration during jerk Signal in Z-Axis direction"
  
  "Std deviation Body Acceleration during jerk Signal
  In X-Axis direction"
  
  "Std deviation Body Acceleration during jerk Signal
  In Y-Axis direction"
  
  "Std deviation Body Acceleration during jerk Signal
  In Z-Axis direction"
  
  "Mean value Body Acceleration Gyroscope in X-Axis direction"
  
  "Mean value Body Acceleration Gyroscope in Y-Axis direction"
  
  "Mean value Body Acceleration Gyroscope in Z-Axis direction"
  
  "Std deviation Body Acceleration Gyroscope in X-Axis direction"
  
  "Std deviation Body Acceleration Gyroscope in X-Axis direction"
  
  "Std deviation Body Acceleration Gyroscope in X-Axis direction"
  
  "Mean value Body Gyroscope Jerk Signal in X-Axis direction"
  
  "Mean value Body Gyroscope Jerk Signal in Y-Axis direction"
  
  "Mean value Body Gyroscope Jerk Signal in Z-Axis direction"
  
  "Std deviation Body Gyroscope Jerk Signal in Z-Axis direction"
  
  "Std deviation Body Gyroscope Jerk Signal in Z-Axis direction"
  
  "Std deviation Body Gyroscope Jerk Signal in Z-Axis direction"
  
  "Mean value Magnitude Body Acceleration"
  
  "std deviation Magnitude Body Acceleration"
  
  "Mean value Magnitude Gravity Acceleration"
  
  "Std deviation Magnitude Gravity Acceleration"
  
  "Mean magnitude Body Acceleration Jerk Signals"
  
  "Std deviation Body Acceleration Jerk Signals"
  
  "Mean value Magnitude Body Gyroscope Acceleration"
  
  "Std deviation Magnitude Body Gyroscope Acceleration"
  
  "Mean magnitude Body Gyroscope Jerk signals"
  
  "Std deviation magnitude Body Gyroscope Jerk Signals"
  
  "Mean Fast Fourier Transform Applied to Body Acceleration Signal in X-Axis"
  
  "Mean Fast Fourier Transform Applied to Body Acceleration Signal in Y-Axis"
  
  "Mean Fast Fourier Transform Applied to Body Acceleration Signal in Z-Axis"
  
  "Std deviation Fast Fourier Transform Applied to Body Acceleration Signal in X-Axis"
  
  "Std deviation Fast Fourier Transform Applied to Body Acceleration Signal in Y-Axis"
  
  "Std deviation Fast Fourier Transform Applied to Body Acceleration Signal in Z-Axis"
  
  "Mean frequency Fast Fourier Transform Applied to Body Acceleration Jerk Signals in X-Axis"
  
  "Mean frequency Fast Fourier Transform Applied to Body Acceleration Jerk Signals in Y-Axis"
  
  "Mean frequency Fast Fourier Transform Applied to Body Acceleration Jerk Signals in Z-Axis"
  
  "Std deviation frequency Fast Fourier Transform Applied to Body Acceleration Jerk Signals in X-Axis"
  
  "Std deviation frequency Fast Fourier Transform Applied to Body Acceleration Jerk Signals in Y-Axis"
  
  "Std deviation frequency Fast Fourier Transform Applied to Body Acceleration Jerk Signals in -Axis"
  
  "Mean value Fast Fourier Transform Applied to Body Gyroscope in X-Axis"
  
  "Mean value Fast Fourier Transform Applied to Body Gyroscope in Y-Axis"
  
  "Mean value Fast Fourier Transform Applied to Body Gyroscope in Z-Axis"
  
  "Std deviation Fast Fourier Transform Applied to Body Gyroscope in X-Axis"
  
  "Std deviation Fast Fourier Transform Applied to Body Gyroscope in X-Axis"
  
  "Std deviation Fast Fourier Transform Applied to Body Gyroscope in X-Axis"
  
  "Mean value Magnitude Fast Fourier Transform Applied to Body Acceleration Signal"
  
  "std deviation Magnitude Fast Fourier Transform Applied to Body Acceleration Signal"
  
  "Mean value Magnitude Fast Fourier Transform Applied to Body Acceleration Jerk Signal"
  
  "std deviation Magnitude Fast Fourier Transform Applied to Body Acceleration Jerk Signal"
  
  "Mean value Magnitude Fast Fourier Transform Applied to Body Gyroscope Signal"
  
  "Std deviation Magnitude Fast Fourier Transform Applied to Body Gyroscope Signal"
  
  "Mean value Magnitude Fast Fourier Transform Applied to Body Gyroscope Jerk Signal"
  
  "Std value Magnitude Fast Fourier Transform Applied to Body Gyroscope Jerk Signal"
  


 ##**output tidy data** <br>
 
 The tidy output data is in the file "tidy_data_of_average_var_activity_subject.txt"<br>
 
 ##**tidy data set** <br>
 
 1. Each column has one associated variable
 2. Subject_id column represent subject in Numeric form
 3. Activity represent activity carried out by subject in particular time frame window
 4. 66 column for features having value mean and std
 5. Single observation per cell (meaning unique row and column)
 6. Column names as per guideline from project used spaces as non-spaced name are difficult to read
 
