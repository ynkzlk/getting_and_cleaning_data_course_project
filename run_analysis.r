## Important information:
## I am merging the test + train datasets (that was my understanding of the task 1)
## and combine x, y, subject to a full dataset later on (Task 4).
## (You could probably understand the first task in a different way)


## Set your working directory
## You need to adjust your path to your working directory
setwd("~/dev/r/coursera/Getting and Cleaning Data/getting_and_cleaning_data_course_project")

filename <- "UCI_HAR_raw.zip"

## Download the dataset. Link to the dataset was provided by Coursera in the course project description
if (!file.exists(filename)){
    URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(URL, filename, method="curl")
}
## Unzip only if the .zip isn't already unzipped.
if (!file.exists("UCI HAR Dataset")) { 
    unzip(filename) 
}

## Task 1
## Merge the train and the test dataset to a data set.

# Read the data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Combine train and test sets, by using rbind
x_full <- rbind(x_train, x_test)
y_full <- rbind(y_train, y_test)
subject_full <- rbind(subject_train, subject_test)

## Task 2
## Extract only the measurements on the mean and standard deviation for each measurement

# read features file
features <- read.table("UCI HAR Dataset/features.txt")

# get only columns with 'mean' OR 'std' 
mean_and_stdev_features <- grep(".*mean.*|.*std.*", features[, 2])

# subset columns in the merged dataset
x_full <- x_full[, mean_and_stdev_features]


## Task 3
## Uses descriptive activity names to name the activities in the data set

# read activity labels file
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")

# update the merged dataset with correct activity labels
y_full[, 1] <- activitylabels[y_full[, 1], 2]


## Task 4
## Appropriately label the data sets with descriptive variable names

# correct column names
names(subject_full) <- "subject"
names(y_full) <- "activity"
names(x_full) <- features[mean_and_stdev_features, 2]

# create a full data set
full_data <- cbind(x_full, y_full, subject_full)

# Extract the column names
colNames  = colnames(full_data); 

# Make the column names more pretty
for (i in 1:length(colNames)) 
{
    colNames[i] = gsub("\\()","",colNames[i])
    colNames[i] = gsub("-std$","StdDev",colNames[i])
    colNames[i] = gsub("-mean","Mean",colNames[i])
    colNames[i] = gsub("^(t)","time",colNames[i])
    colNames[i] = gsub("^(f)","freq",colNames[i])
    colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
    colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
    colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
    colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
    colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
    colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
    colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};

# Update the column names
colnames(full_data) = colNames;

## Task 5
## From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

## Use Plyr (=Tools for Splitting, Applying and Combining Data)
library(plyr)
full_data_average <- ddply(full_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(full_data_average, "tidy_dataset.txt", row.name=FALSE)
