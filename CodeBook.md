#Data Dictionary – TidyDataSet
##Project description
The purpose of this project is to prepare tidy data that can be used for later analysis. The tidy data set contains the average of each variable (with mean or std in its name) for each activity and each subject.

##Study design and data processing
###Collection of the raw data
The raw data for the project can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
###Notes on the (original) raw data
See also: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The raw dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

##Creating the tidy data file
###Guide to create the tidy data file
1. Load raw data and merge the training and test sets to one data set
2. Rename variables
3. Rename activities
4. Extract only measurements on mean and standard deviation for each measurement (variables with either mean or std in their names)
5. Create independent tidy data set with average of each variable for each activity and each subject
6. Save TidyDataSet.txt

##Cleaning of the data
Link to readme document that describes the code in greater detail

##Description of the variables in the TidyDataSet.txt file
Dimension of the data is 180x81. The 180 rows contain 30 subjects times 6 activities. The 81 variables are the activity label, the subject number and the 79 variables from the original raw data set with either ‘mean’ or ‘std’ in their name.
###Variables
* activity_label - Factor   
 Type of activity   
  LAYING   
  SITTING   
  STANDING   
  WALKING   
  WALKING DOWNSTAIRS   
  WALKING UPSTAIRS   

* subject_nr - Integer   
 Subject number   
  1..30 Unique identifier for each tested subject   

The following variables are the means of mean and standard deviation of 3-axial (X, Y and Z) linear acceleration and 3-axial angular velocity. The acceleration signal, which has gravitational and body motion components, was separated into body acceleration and gravity. The variables are numerical and have a value in [-1,1].   
tBodyAcc-mean()-X   
tBodyAcc-mean()-Y   
tBodyAcc-mean()-Z   
tBodyAcc-std()-X   
tBodyAcc-std()-Y   
tBodyAcc-std()-Z   
tGravityAcc-mean()-X   
tGravityAcc-mean()-Y   
tGravityAcc-mean()-Z   
tGravityAcc-std()-X   
tGravityAcc-std()-Y   
tGravityAcc-std()-Z   
tBodyAccJerk-mean()-X   
tBodyAccJerk-mean()-Y   
tBodyAccJerk-mean()-Z   
tBodyAccJerk-std()-X   
tBodyAccJerk-std()-Y   
tBodyAccJerk-std()-Z   
tBodyGyro-mean()-X   
tBodyGyro-mean()-Y   
tBodyGyro-mean()-Z   
tBodyGyro-std()-X   
tBodyGyro-std()-Y   
tBodyGyro-std()-Z   
tBodyGyroJerk-mean()-X   
tBodyGyroJerk-mean()-Y   
tBodyGyroJerk-mean()-Z   
tBodyGyroJerk-std()-X   
tBodyGyroJerk-std()-Y   
tBodyGyroJerk-std()-Z   
tBodyAccMag-mean()   
tBodyAccMag-std()   
tGravityAccMag-mean()   
tGravityAccMag-std()   
tBodyAccJerkMag-mean()   
tBodyAccJerkMag-std()   
tBodyGyroMag-mean()   
tBodyGyroMag-std()   
tBodyGyroJerkMag-mean()   
tBodyGyroJerkMag-std()   
fBodyAcc-mean()-X   
fBodyAcc-mean()-Y   
fBodyAcc-mean()-Z   
fBodyAcc-std()-X   
fBodyAcc-std()-Y   
fBodyAcc-std()-Z   
fBodyAcc-meanFreq()-X   
fBodyAcc-meanFreq()-Y   
fBodyAcc-meanFreq()-Z   
fBodyAccJerk-mean()-X   
fBodyAccJerk-mean()-Y   
fBodyAccJerk-mean()-Z   
fBodyAccJerk-std()-X   
fBodyAccJerk-std()-Y   
fBodyAccJerk-std()-Z   
fBodyAccJerk-meanFreq()-X   
fBodyAccJerk-meanFreq()-Y   
fBodyAccJerk-meanFreq()-Z   
fBodyGyro-mean()-X   
fBodyGyro-mean()-Y   
fBodyGyro-mean()-Z   
fBodyGyro-std()-X   
fBodyGyro-std()-Y   
fBodyGyro-std()-Z   
fBodyGyro-meanFreq()-X   
fBodyGyro-meanFreq()-Y   
fBodyGyro-meanFreq()-Z   
fBodyAccMag-mean()   
fBodyAccMag-std()   
fBodyAccMag-meanFreq()   
fBodyBodyAccJerkMag-mean()   
fBodyBodyAccJerkMag-std()   
fBodyBodyAccJerkMag-meanFreq()   
fBodyBodyGyroMag-mean()   
fBodyBodyGyroMag-std()   
fBodyBodyGyroMag-meanFreq()   
fBodyBodyGyroJerkMag-mean()   
fBodyBodyGyroJerkMag-std()   
fBodyBodyGyroJerkMag-meanFreq()   
