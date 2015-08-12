# GetCleanData

A single script called run_analysis.R was created to process the Human Activity Recognition Using Smartphones (UCI HAR) Dataset.  The analysis was performed as part of a Coursera course on "Getting and Cleaning Data," taught during August 2015.  In this case, the dataset was downloaded from the following web site:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

It is not known whether the downloaded dataset is the same as the original (or current) UCI HAR Dataset, or whether the script would run in the same manner on the source dataset.  The actual, current UCI HAR Dataset may be accessed through the link below:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The following steps should be followed to obtain proper output:

1. Download the zip file from the web site and extract all the files to a folder on your active (local) directory
2. Rename the folder "UCI_HAR_Dataset" (with the added underscores).  
3. Run run_analysis.R in the R console.  The script will create a "tidy" dataset called "UCIHAR_TidyAverages.txt" in the local directory.
 
Note the the script performs the following general operations on the dataset:  
 
1. Merges the "training" and the "test" sets to create one data set.
1. Extracts the measurements on the mean and standard deviation for each measurement. 
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names. 
1. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. The second dataset is output.
