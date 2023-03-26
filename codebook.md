## JHU Coursera - Getting & Cleaning Data Week 4 project

Source data is from the "the Human Activity Recognition Using Smartphones Data Set". More information about this dataset can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

While the provided R script will automate download of the required data, the raw datset used can also be found at:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

All data and links provided by John Hopkins Uni

##Script & Instructions Breakdown
The 'run_analysis.R' file contains all needed scripts. This file has been annotated with the following steps, including how they relate to the 5 stages requested by JHU (I found it easier to do some parts out of order!).

JHU Instructions:
You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

"run_analysis.R" steps:
1. Download data into working directory (PROJECT PART 1/5)
2. Import & define the data sets (PROJECT PART 4/5)
3. Merge each set (inc. PROJECT PART 3/5)
4. Separate mean & standard dev.(PROJECT PART 2/5)
5. Create new dataset of means (PROJECT PART 5/5)

##Variables/files
Based on information the following code info connects the provided data:
"x_test", "y_test", "subject_test", "x_train", "y_train", and "subject_train" are the primary downloaded data that is manipulated - comprising the results of two rounds of accelerometer testing.

These are combined into "full_test" and "full_train", then into "full_combined", using the "features" and "activity_labels" files to provide detail.

"full_combined" is lastly sliced into the "TidyDataset.txt" output.