library(dplyr)
##Download data into working directory
##PROJECT PART 1/5:
downloadurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir.create("./rawdata")

download.file(downloadurl,destfile="./rawdata/rawdata.zip")
unzip("./rawdata/rawdata.zip", exdir="./rawdata")

##Inport & defining data sets
x_test <- read.table("./rawdata/UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("./rawdata/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./rawdata/UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("./rawdata/UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./rawdata/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./rawdata/UCI HAR Dataset/train/subject_train.txt")

features <- read.table("./rawdata/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./rawdata/UCI HAR Dataset/activity_labels.txt")

##PROJECT PART 4/5:
colnames(x_test) <- features[,2]
colnames(x_train) <- features[,2]

colnames(y_test) <- "activity_code"
colnames(y_train) <- "activity_code"

colnames(subject_test) <- "subject_code"
colnames(subject_train) <- "subject_code"

colnames(activity_labels) <- c("activity_code","activity_actual")

##Merge each set
full_test <- cbind(subject_test,y_test,x_test)
full_train <- cbind(subject_train,y_train,x_train)

full_combined <- rbind(full_test,full_train)

##PROJECT PART 3/5:
full_combined <- merge(full_combined,activity_labels,by = "activity_code",all.x = TRUE)
full_combined <- relocate(full_combined,activity_actual,.after = activity_code)

##Separate mean & standard dev.
##PROJECT PART 2/5:
mean_stnd_locations <- (grepl("activity_actual", colnames(full_combined)) | 
                        grepl("subject_code", colnames(full_combined)) |
                        grepl("mean", colnames(full_combined)) |
                        grepl("std", colnames(full_combined))
                        )
ms_combined <- full_combined[,mean_stnd_locations == TRUE]

##Create new dataset of means
##PROJECT PART 5/5:

means_data <- aggregate(. ~activity_actual + subject_code, ms_combined, mean)
means_data <- means_data[order(means_data$activity_actual, means_data$subject_code),]

write.table(means_data, "TidyDataset.txt", row.names = FALSE)
