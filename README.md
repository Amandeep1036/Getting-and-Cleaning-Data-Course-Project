# Getting-and-Cleaning-Data-Course-Project
The repo is created for the week 4 project of Getting and Data Course Project.
* First of all download the data set and extract the files.
* Write the R script names run_analysis.R and execute.
* Store the generated tidy file as tidydata.txt
## Data set
The variables in data X are sensor signals measured with waist-mounted smartphone form 30 subjects. 
The variable in the data Y indicates activity type the subjects performed during recording.
## R Code description as per course instructions
Read training and test dataset into R environment. Read variable names into R envrionment. Read subject index into R environment.

1. Merges the training and the test sets to create one data set. Use command rbind to combine training and test set
2. Extracts only the measurements on the mean and standard deviation for each measurement. Use grep command to get column indexes for variable name contains "mean()" or "std()"
3. Uses descriptive activity names to name the activities in the data set Convert activity labels to characters and add a new column as factor
4. Appropriately labels the data set with descriptive variable names. Give the selected descriptive names to variable columns
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package
## New data set
The new data set is stored in file named tidydata.txt. In this,variables are calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.
