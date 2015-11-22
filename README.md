# Getting and Cleaning Data - Week 3 - Course Project

This is the course project for the **Getting and Cleaning Data course**.

## Important Information

The first task could be understand in two different ways:
1. Merge/combine the train and test data sets to create one data
sets (e.g. merge x_train and x_test, y_train and y_test, ..).
2. Merge/combine the train and test data sets to create one data sets (e.g. merge x_train and y_train, x_test and y_test, ..).

What I did: I did the first option (it was reasonable to do it like this, since they have the same data structure). Eventually we needed to create a full data set in the end, please look at Task 4.

## What does the script do?

The R script *run_analysis.R* will do the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
