##  Coursera Getting and Cleaning Data Course Project
##
##  Accesses the Human Activity Recognition Using Smartphones Dataset (UCI HAR) and performs

##
##  
##
##  The dataset was downloaded and unzipped before processing.  The file was accessed at:
##  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
##  Citation: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human
##  Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
##  International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.
##
##
##  Read the raw dataset from local "UCI_HAR_Datase" folder
##
        act_lab <- read.table("./UCI_HAR_Dataset/activity_labels.txt")
        feat <- read.table("./UCI_HAR_Dataset/features.txt")
        sub_test <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")
        x_test <- read.table("./UCI_HAR_Dataset/test/x_test.txt")
        y_test <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
        sub_train <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")
        x_train <- read.table("./UCI_HAR_Dataset/train/x_train.txt")
        y_train <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
##  
##  Some initial setup and manipulation for the Variable names
##
        library(plyr)
        library(dplyr)
        library(tidyr)
        colnames(y_test) <- "Activity"; colnames(y_train) <- "Activity"
        colnames(sub_test) <- "Subject"; colnames(sub_train) <- "Subject"
        feat <- as.character(feat$V2)
##
##  Extract the measurements on the mean and standard deviation for each measurement
##  Appropriately label the data set with descriptive variable names
##
        indmean <- grep("mean()",feat, fixed = TRUE)
        indstd <- grep("std()", feat, fixed = TRUE)
        cnames <- sub("-mean()-","_",feat[indmean], fixed = TRUE)
        cnames <- c("Subject", "Activity", "Data_Subset", "Statistic",sub("-mean()","",cnames, fixed = TRUE))
        Data_Subset <- rep("test",nrow(y_test))
        Statistic <- rep("mean",nrow(y_test))
        test_mean <- cbind(sub_test,y_test,Data_Subset, Statistic, x_test[,indmean])
        colnames(test_mean) <- cnames
        Statistic <- rep("std",nrow(y_test))
        test_std <- cbind(sub_test,y_test,Data_Subset, Statistic, x_test[,indstd])
        colnames(test_std) <- cnames
        Data_Subset <- rep("train",nrow(y_train))
        Statistic <- rep("mean",nrow(y_train))
        train_mean <- cbind(sub_train,y_train,Data_Subset, Statistic, x_train[,indmean])
        colnames(train_mean) <- cnames
        Statistic <- rep("std",nrow(y_train))
        train_std <- cbind(sub_train,y_train,Data_Subset, Statistic, x_train[,indstd])
        colnames(train_std) <- cnames
##
##  Merge the training and test data sets to create one data set
##
        HAR <- rbind(test_mean, test_std, train_mean, train_std)
        rownames(HAR) <- 1:nrow(HAR)
## 
##  Assign descriptive activity names to the activities in the data set
##
        HAR[,1] <- factor(HAR[,1])
        HAR[,2] <- factor(HAR[,2], labels = act_lab[,2])
        HAR <- arrange(HAR, Subject, Activity, Statistic)
##  	
##  Create a second data set with the average of each variable for each activity and each subject   
##
        HAR <- group_by(HAR, Subject, Activity, Statistic)
        subHAR <- summarize(HAR,
                            mean(tBodyAcc_X),mean(tBodyAcc_Y),mean(tBodyAcc_Z),
                            mean(tGravityAcc_X),mean(tGravityAcc_Y),mean(tGravityAcc_Z),
                            mean(tBodyAccJerk_X),mean(tBodyAccJerk_Y),mean(tBodyAccJerk_Z),
                            mean(tBodyGyro_X),mean(tBodyGyro_Y),mean(tBodyGyro_Z),
                            mean(tBodyGyroJerk_X), mean(tBodyGyroJerk_Y),mean(tBodyGyroJerk_Z),
                            mean(tBodyAccMag),mean(tGravityAccMag),mean(tBodyAccJerkMag),
                            mean(tBodyGyroMag),mean(tBodyGyroJerkMag),
                            mean(fBodyAcc_X),mean(fBodyAcc_Y),mean(fBodyAcc_Z),
                            mean(fBodyAccJerk_X),mean(fBodyAccJerk_Y),mean(fBodyAccJerk_Z),
                            mean(fBodyGyro_X),mean(fBodyGyro_Y),mean(fBodyGyro_Z),
                            mean(fBodyAccMag),mean(fBodyBodyAccJerkMag),mean(fBodyBodyGyroMag),
                            mean(fBodyBodyGyroJerkMag)
                            )
##
##  The resulting dataset is then written to a txt file with write.table() using row.name=FALSE
##
        write.table(subHAR,file = "UCIHAR_TidyAverages.txt",row.names = FALSE)
##
##