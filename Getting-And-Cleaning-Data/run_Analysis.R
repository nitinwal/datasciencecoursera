
######----- Goal 1 :- Merger train & test Datasets
## Description:-
##                 To make this happen the data for both test and train is scattered in 3 different files
##                 We need to combine them in one Table, think of this as ideal table having following fields
##                 Subject_id ( showing people ids are part of the exercise)
##                 Activity_id ( showing the activity they were performing)
##                 Data  Columns - Values for their activity
######----- Goal 1.1 :- 
######-----Read data in train and get it in above table format
## Following code read the file and Put the data against the Subject_id
## read subjet_test and get it in table
train_dataset_subject_table <- read.table(".\\train\\subject_test.txt")
## read activities from y_test and get it in table
train_dataset_activities_table <- read.table(".\\train\\y_test.txt")
## read feature values from X_test ( accelerometer and gyro and others and get it in table
train_dataset_dataValues <- read.table (".\\train\\X_test.txt", sep="") 

## Now lets combine them
## We are putting activity first as its column will appear first
train_table <- cbind (train_dataset_activities_table , train_dataset_dataValues)
head(train_table,n=2)
colnames(train_table)[1] <- "activity"
## Now lets put subjects
train_table <- cbind (test_dataset_subject_table , test_table)
colnames(train_table)[1] <- "Subject_id"
head(train_table,n=1)


######----- Goal 1.2 :- Read data in test and get it in above table format
## Following code read the file and put respective data in tables
## read subjet_test and get it in table
test_dataset_subject_table <- read.table(".\\test\\subject_test.txt")
## read activities from y_test and get it in table
test_dataset_activities_table <- read.table(".\\test\\y_test.txt")
## read feature values from X_test ( accelerometer and gyro and others and get it in table
test_dataset_dataValues <- read.table (".\\test\\X_test.txt", sep="") 

## Now lets combine them
## We are putting activity first as its column will appear first
test_table <- cbind (test_dataset_activities_table , test_dataset_dataValues)
head(test_table,n=2)
colnames(test_table)[1] <- "activity"
## Now lets put subjects
test_table <- cbind (test_dataset_subject_table , test_table)
colnames(test_table)[1] <- "Subject_id"
######----- Goal 1.3 :- 
######-----Metger Train and Test to get one dataset table 
head(train_table,n=1)
head(test_table,n=1)
meged_data_table <- rbind (train_table, test_table)
head(meged_data_table,1)
nrow(meged_data_table)
######----- Goal 1.4:-
######-----Look for Quantitive and Qualitative values and Create variables for them
## Factor Subject_id
meged_data_table[1] <- factor(meged_data_table[[1]]) 
## Factor activity
meged_data_table[2] <- factor(meged_data_table[[2]]) 
######----- Goal 1.5:-
######----- Deal with missing data if any
missing_values <- sum(is.na(meged_data_table))
print(paste("Total Missing values found are = ", missing_values," Missing = .", collapse=""))

######----- Goal 2:- 
######----- Extracts only the measurements on the mean and standard deviation for each measurement.
######----- Description:-
######----- To get this, we need all those features that have mean and standard deviation
######----- Look at features.txt and find out the features that have  mean or std
######----- Using any find tool this can be done
######----- My list are as below indicates column no.
#####------ Since first 2 columns are subject and activity to get correct column id need to 
######----- add 2 to get correct column index
column_ids_mean_std_vector <- c((1 + 2), (2 + 2), (3 + 2), (4 + 2), (5 + 2), (6 + 2),
                                (41 + 2), (42 + 2), (43 + 2), (44 + 2), (45 + 2), 
                                (46 + 2), (81 + 2), (82 + 2), (83 + 2), (84 + 2), 
                                (85 + 2), (86 + 2), (121 + 2), (122 + 2), (123 + 2), 
                                (124 + 2), (125 + 2), (126 + 2), (161 + 2), (162 + 2), 
                                (163 + 2), (164 + 2), (165 + 2), (166 + 2), (201 + 2),
                                (202 + 2), (214 + 2), (215 + 2), (227 + 2), (228 + 2), 
                                (240 + 2), (241 + 2), (253 + 2), (254 + 2), (266 + 2), 
                                (267 + 2), (268 + 2), (269 + 2), (270 + 2), (271 + 2), 
                                (345 + 2), (346 + 2), (347 + 2), (348 + 2), (349 + 2), 
                                (350 + 2), (424 + 2), (425 + 2), (426 + 2), (427 + 2), 
                                (428 + 2), (429 + 2), (503 + 2), (504 + 2), (516 + 2), 
                                (517 + 2), (529 + 2), (530 + 2), (542 + 2), (543 + 2) )
## 21 -- 162
column_id_subject_ativity_vector <-c(1,2) 
column_SubActivity_MeanStd <- append(column_id_subject_ativity_vector, column_ids_mean_std_vector)
table_mean_std_data <- meged_data_table[ , column_SubActivity_MeanStd]

####-----Goal 3. 
####-----Uses descriptive activity names to name the activities in the data set.
####-----Conversion table:
####----- read activity_labels.txt
convert_activity_to_text <- function(in_data_frame,col_index_to_convert) {
  
  levels(in_data_frame[[col_index_to_convert]])[levels(in_data_frame[[col_index_to_convert]])==
                                          "1"] <- "walking"
  levels(in_data_frame[[col_index_to_convert]])[levels(in_data_frame[[col_index_to_convert]])==
                                          "2"] <- "walking_upstairs"
  levels(in_data_frame[[col_index_to_convert]])[levels(in_data_frame[[col_index_to_convert]])==
                                          "3"] <- "walking_downstairs"
  levels(in_data_frame[[col_index_to_convert]])[levels(in_data_frame[[col_index_to_convert]])==
                                          "4"] <- "sitting"
  levels(in_data_frame[[col_index_to_convert]])[levels(in_data_frame[[col_index_to_convert]])==
                                          "5"] <- "standing"
  levels(in_data_frame[[col_index_to_convert]])[levels(in_data_frame[[col_index_to_convert]])==
                                          "6"] <- "laying"
  in_data_frame
}

table_mean_std_data <- convert_activity_to_text(table_mean_std_data, 2)
#head(table_mean_std_data,n=1)
######-----Goal 4:- 
######-----Appropriately labels the data set with descriptive variable names.
######-----Column 1 = Subject_id
######-----Column 2 = activity
######-----Column 3, 4, 5 
colnames(table_mean_std_data)[3:5] <- c(
  "Mean value Body Acceleration Signal in X-Axis direction",
  "Mean value Body Acceleration Signal in Y-Axis direction",
  "Mean value Body Acceleration Signal in Z-Axis direction")
######-----Column 6, 7, 8  
colnames(table_mean_std_data)[6:8] <- c(
  "Std deviation Body Acceleration Signal in X-Axis direction",
  "Std deviation Body Acceleration Signal in Y-Axis direction",
  "Std deviation Body Acceleration Signal in Z-Axis direction")
#head(table_mean_std_data,n=1)
######-----Column 9, 10, 11 
colnames(table_mean_std_data)[9:11] <- c(
  "Mean value Gravity Acceleration Signal in X-Axis direction",
  "Mean value Gravity Acceleration Signal in Y-Axis direction",
  "Mean value Gravity Acceleration Signal in Z-Axis direction")
######-----Column 12, 13, 14 , ids 44, 45, 46
colnames(table_mean_std_data)[12:14] <- c(
  "Std deviation Gravity Acceleration Signal in X-Axis direction",
  "Std deviation Gravity Acceleration Signal in Y-Axis direction",
  "Std deviation Gravity Acceleration Signal in Z-Axis direction") 
######-----Column 15, 16, 17 , ids 81 - 86
colnames(table_mean_std_data)[15:17] <- c(
  "Mean value Body Acceleration during jerk Signal in X-Axis direction",
  "Mean value Body Acceleration during jerk Signal in Y-Axis direction",
  "Mean value Body Acceleration during jerk Signal in Z-Axis direction")
######-----Column 18, 19, 20
colnames(table_mean_std_data)[18:20] <- c(
  "Std deviation Body Acceleration during jerk Signal
  In X-Axis direction",
  "Std deviation Body Acceleration during jerk Signal
  In Y-Axis direction",
  "Std deviation Body Acceleration during jerk Signal
  In Z-Axis direction")
## id 121 - 123
colnames(table_mean_std_data)[21:23] <- c(
  "Mean value Body Accelaration Gyroscope in X-Axis direction",
  "Mean value Body Accelaration Gyroscope in Y-Axis direction",
  "Mean value Body Accelaration Gyroscope in Z-Axis direction")

## id 124 - 126
colnames(table_mean_std_data)[24:26] <- c(
  "Std deviation Body Accelaration Gyroscope in X-Axis direction",
  "Std deviation Body Accelaration Gyroscope in X-Axis direction",
  "Std deviation Body Accelaration Gyroscope in X-Axis direction") 

## id 161 - 163
colnames(table_mean_std_data)[27:29] <- c(
  "Mean value Body Gyroscope Jerk Signal in X-Axis direction",
  "Mean value Body Gyroscope Jerk Signal in Y-Axis direction",
  "Mean value Body Gyroscope Jerk Signal in Z-Axis direction")

## id 164 - 166
colnames(table_mean_std_data)[30:32] <- c(
  "Std deviation Body Gyroscope Jerk Signal in Z-Axis direction",
  "Std deviation Body Gyroscope Jerk Signal in Z-Axis direction",
  "Std deviation Body Gyroscope Jerk Signal in Z-Axis direction") 

## ids 201 - 202
colnames(table_mean_std_data)[33:34] <- c(
  "Mean value Magnitude Body Acceleration",
  "std deviation Magnitude Body Acceleration")

## ids 214 - 215
colnames(table_mean_std_data)[35:36] <- c(
  "Mean value Magnitude Gravity Acceleration",
  "Std deviation Magnitude Gravity Acceleration")

## ids 227 - 228
colnames(table_mean_std_data)[37:38] <- c(
  "Mean magnitude Body Acceleration Jerk Signals",
  "Std deviation Body Acceleration Jerk Signals")

## ids 240 - 241
colnames(table_mean_std_data)[39:40] <- c(
  "Mean value Magnitude Body Gyrosciope Accelerartion",
  "Std deviation Magnitude Body Gyrosciope Accelerartion")

## ids 253 - 254
colnames(table_mean_std_data)[41:42] <- c(
  "Mean magnitude Body Gyroscope Jerk signals",
  "Std deviation magnitude Body Gyroscope Jerk Signals")

## ids 266 - 271
colnames(table_mean_std_data)[43:45] <- c(
  "Mean Fast Fourier Transform Applied to Body Acceleration Signal in X-Axis",
  "Mean Fast Fourier Transform Applied to Body Acceleration Signal in Y-Axis",
  "Mean Fast Fourier Transform Applied to Body Acceleration Signal in Z-Axis")
colnames(table_mean_std_data)[46:48] <- c(
  "Std deviation Fast Fourier Transform Applied to Body Acceleration Signal in X-Axis",
  "Std deviation Fast Fourier Transform Applied to Body Acceleration Signal in Y-Axis",
  "Std deviation Fast Fourier Transform Applied to Body Acceleration Signal in Z-Axis")

## ids 345 - 350
colnames(table_mean_std_data)[49:51] <- c(
  "Mean frequency Fast Fourier Transform Applied to Body Acceleration Jerk Signals in X-Axis",
  "Mean frequency Fast Fourier Transform Applied to Body Acceleration Jerk Signals in Y-Axis",
  "Mean frequency Fast Fourier Transform Applied to Body Acceleration Jerk Signals in Z-Axis") 

colnames(table_mean_std_data)[52:54] <- c(
  "Std deviation frequency Fast Fourier Transform Applied to Body Acceleration Jerk Signals in X-Axis",
  "Std deviation frequency Fast Fourier Transform Applied to Body Acceleration Jerk Signals in Y-Axis",
  "Std deviation frequency Fast Fourier Transform Applied to Body Acceleration Jerk Signals in Z-Axis")

## ids 424 - 429
colnames(table_mean_std_data)[55:57] <- c(
  "Mean value Fast Fourier Transform Applied to Body Gyroscope in X-Axis",
  "Mean value Fast Fourier Transform Applied to Body Gyroscope in Y-Axis",
  "Mean value Fast Fourier Transform Applied to Body Gyroscope in Z-Axis")
colnames(table_mean_std_data)[58:60] <- c(
  "Std deviation Fast Fourier Transform Applied to Body Gyroscope in X-Axis",
  "Std deviation Fast Fourier Transform Applied to Body Gyroscope in X-Axis",
  "Std deviation Fast Fourier Transform Applied to Body Gyroscope in X-Axis") 

## ids 503 - 504
colnames(table_mean_std_data)[61:62] <- c(
  "Mean value Magnitude Fast Fourier Transform Applied to Body Acceleration Signal",
  "std deviation Magnitude Fast Fourier Transform Applied to Body Acceleration Signal") 

## ids 516 - 517 
colnames(table_mean_std_data)[63:64] <- c(
  "Mean value Magnitude Fast Fourier Transform Applied to Body Acceleration Jerk Signal",
  "std deviation Magnitude Fast Fourier Transform Applied to Body Acceleration Jerk Signal") 

## ids 529 - 530 
colnames(table_mean_std_data)[65:66] <- c(
  "Mean value Magnitude Fast Fourier Transform Applied to Body Gyroscope Signal",
  "Std deviation Magnitude Fast Fourier Transform Applied to Body Gyroscope Signal")

## ids 542 - 543 
colnames(table_mean_std_data)[67:68] <- c(
  "Mean value Magnitude Fast Fourier Transform Applied to Body Gyroscope Jerk Signal",
  "Std value Magnitude Fast Fourier Transform Applied to Body Gyroscope Jerk Signal")
#head(table_mean_std_data,n=1)


######-----Goal 5:-
######-----Creates a second, independent tidy data set with the average of each
######-----variable for each activity and each subject.
#####------ 3 lecture `Reshaping Data`
library(reshape2)
melted_data_by_ids_activity <- melt(table_mean_std_data, id.vars=c("Subject_id", "activity"))
## recast the dataset a per lecture 'Reshaping data , slide 5"
tidy_data_of_average_var_activity_subject <- dcast(melted_data_by_ids_activity, Subject_id + activity ~ variable, mean)
head(tidy_data_of_average_var_activity_subject)
## Write tidy data set
write.table(tidy_data_of_average_var_activity_subject, "tidy_data_of_average_var_activity_subject.txt")
