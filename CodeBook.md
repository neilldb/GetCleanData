# The Project Code Book

The following code book describes the variables, data, and any transformations or work that  performed to clean up the data.

## The Source Dataset

The dataset used in this analysis was the UCI Human Activity Recognition Using Smartphones (UCI HAR) Dataset.  The information 
given here on the dataset is derived from the documentation that comes with the dataset (README.txt).

The experiments were carried out with a group of 30 volunteer subjects. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, the experimentors captured 3-axial linear acceleration and 3-axial angular
velocity. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating
the training data and 30% the test data.  Additional experimental information is available on the UCI HAR web site (see also the 
paper cited below).

For each record, the dataset provides the following:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The 561-feature vector was derived from the raw signal data ("features") and represent various statistical parameters for each 
observation, which were then normalized (i.e., unitless) and bounded within [-1,1].  The following 33 features were reported (note that 
'-XYZ' has been used to denote 3-axial signals in the X, Y and Z directions):

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

## Dataset Reshaping & Other Processing

The following UCI HAR files were read into R and processed: 

- 'features.txt': List of all features (561 features).
- 'activity_labels.txt': Links the class labels with their activity name (6 activities).
- 'train/X_train.txt': Training set (7352 observations of 561 features).
- 'train/y_train.txt': Training labels (identifies the activity performed for the 7352 observations).
- 'test/X_test.txt': Test set (2947 observations of 561 features).
- 'test/y_test.txt': Test labels (identifies the activity performed for the 2947 observations).
- 'train/subject_train.txt': Identifies the subject performing the activity (7352 records ranging from 1 to 30). 
- 'tesy/subject_test.txt': Identifies the subject performing the activity (2947 records ranging from 1 to 30).

Because the training and test datasets were derived by randomly selecting subjects from the original dataset, no experimental 
concerns arise from merger of the two datasets.  Column labels and observation identifiers (subject, activity and statistic) 
were appended to the dataset before merging to help ensure that the unlabeled raw data files did not get scrambled.  Of the 561 
feature statistics, only 33 values for both mean and standard deviation (std) were extracted.

Aside from sorting the dataset by subject, activity and statistic (mean or std), the actual numerical feature (variable) values 
were not changed in the basic dataset.  The output dataset ("UCIHAR_TidyAverages.txt"), however, averaged (arithmatic mean) the
normalized feature values for each statistic by subject and activity.  This transformation resulted in 360 records, each with 36
fields -- three identifiers (subject, activity and statistic) and 33 feature values.

The data processing was performed on a Dell Latitude 6220 with a 2.8 GHz CPU (64-bit) and 8.0 GB RAM using R version 3.2.1.

Dataset Citation:  Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity 
Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.  This dataset is distributed AS-IS and no responsibility 
implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is 
prohibited.  Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
