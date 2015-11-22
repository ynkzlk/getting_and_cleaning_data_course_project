# CodeBook

## General

The R script ```run_analysis.R``` has been implemented to accomplish 5 tasks given by Coursera's Course Project for Week 3 in the **Getting and Cleaning Data Course**

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Properties

- The script sets the working directory in the programming. if you want to run it on your computer, you need to adjust the the variable
*filename*
- The raw data set is downloaded to the previously set working directory
- It is also checked if the the downloaded zip has been already unzipped (in your corrent working directory)
- *URL* was given by Coursera Project in the Course Project description
- Similiar data is merged by using the ```rbind()``` function.
- Full data set is merged by using the ```cbind()``` function.
- Mean and standard deviation has been extract with the correct names, retrieved from the *features.txt*
- Since the activities were described by values 1-6, we updated those with information from *the activity_labels.txt*
- The columns name have been updated to make them more readible. 
- Eventually, a new dataset is created for each subject and activity type and is written to *tidy_data_set.txt*
- ```ddply()``` from the **plyr** package is used to use the function ```colMeans()``` (You can install it via ```install.packages("plyr")```)

## Variables

- Train datasets: *x_train*, *subject_train*, *y_train*
- Test datasets: *x_test*, *subject_test*, *y_test*
- Merged datasets: *x_full*, *subject_full*, *y_full*
- Correct names for *x_full*: *features* contains them and are applied to the column names in *mean_and_stdev_features*
- *full_data*: merges *x_full*, *subject_full*, *y_full*
- *full_data_average*: contains the average of each variable for each activity and each subject. This data will be later stored in *tidy_dataset.txt*



