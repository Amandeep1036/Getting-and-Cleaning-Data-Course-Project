library(dplyr)

## For reading train data
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## For reading test data
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## For reading features
features <- read.table("./UCI HAR Dataset/features.txt")

## For reading activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Merging train and test data set to create one data set
Xtotal <- rbind(Xtrain, Xtest)
Ytotal <- rbind(Ytrain, Ytest)
Subject_total <- rbind(Subject_train, Subject_test)

## Extracts only the measurements on the mean and standard deviation for each measurement
selected_var <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
Xtotal <- Xtotal[,selected_var[,1]]

## Uses descriptive activity names to name the activities in the data set
colnames(Ytotal) <- "activity"
Ytotal$activitylabel <- factor(Ytotal$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Ytotal[,-1]

## Labels the data set with descriptive variable names.
colnames(Xtotal) <- features[selected_var[,1],2]

## Here we create an independent tidy data set from step 4 data set, with the average
## of each variable for each activity and each subject.
colnames(Subject_total) <- "subject"
total <- cbind(Xtotal, activitylabel, Subject_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarise_each(funs(mean))
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
