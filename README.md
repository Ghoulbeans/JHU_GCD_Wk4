## Getting and Cleaning Data Week 4 Project

Welcome reviewer! This is my repo for Coursera's "Getting and Cleaning Data" Week 4 project. 
Contains an R code file ("run_analysis.R"), a codebook (the best overview for the transform process), and the resulting tidy data set.

I wasn't 100% sure what to put here, so if information isn't here that you would expect - please check the codebook. :)

No external files are required for "run_analysis.R" which performs the following steps:
1. Download data into working directory (PROJECT PART 1/5)
2. Import & define the data sets (PROJECT PART 4/5)
3. Merge each set (inc. PROJECT PART 3/5)
4. Separate mean & standard dev.(PROJECT PART 2/5)
5. Create new dataset of means (PROJECT PART 5/5)

tidyData.txt is this output of the final step

## Variables/files
Based on information the following code info connects the provided data:
"x_test", "y_test", "subject_test", "x_train", "y_train", and "subject_train" are the primary downloaded data that is manipulated - comprising the results of two rounds of accelerometer testing.

These are combined into "full_test" and "full_train", then into "full_combined", using the "features" and "activity_labels" files to provide detail.

"full_combined" is lastly sliced into the "TidyDataset.txt" output.
