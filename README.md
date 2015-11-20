# Course-project-Getting-and-Cleaning-Data
##Description of run_analysis.R

Note: In this function it is assumed that the dplyr package is installed. Please install it if not already installed.
It is assumed that the working directory is the folder in which the files with the features names and activity_labels are stored (e.g. 'UCI HAR Dataset').

Furthermore it is assumed that the actual data is in the subfolders 'test' and 'train'.
The R script run_analysis.R loads raw data and merges the test sets to create one data set. It writes an independent tidy data set with the average of each variable for each activity and each subject in a txt file named TidyDataSet.txt. Therefore the following steps are run:

1. Load data and merge the training and test sets to one data set
	Training data:
i. First the y_train data is cbinded with the X_train data in dataset1. This makes a dataframe with dimension 7352x562.
ii. Then the subject_train data is cbinded with dataset1 to dataset1, so the dimension of dataset1 is 7352x563.

	Test data: The same steps are applied as on the Training data. The result is dataset2 with a 	dimension of 			2947x563.

	dataset1 and dataset2 are rbinded into the dataframe dataset1. The dimension of dataset1 is 	now 10299x563.

2. Rename variables
A vector with “subject_nr”, “activity_label”, and the variable names from the file features.txt is constructed. This vector is assigned to the column names of dataset1.

3. Rename activities
The data from "activity_labels.txt" and dataset1 are merged by the variables “V1” and “activity_label", so a variable with the actual activities (in words) is added. The added variable “V2” is then renamed to “activity_label” and the column with the original activity label (number) is removed.

4. Extract only measurements on mean and standard deviation for each measurement
All columns with either "mean" or "std" in the name are selected, together with the columns "activity_label" and "subject_nr".

5. An independent tidy data set (dataset2) with the average of each variable for each activity and each subject is created. This is done by first grouping dataset1 by “activity_label” and “subject_nr” and then by the summarize_each function with argument mean.

6. Finally the tidy data set (dataset2) is saved in the working directory as “TidyDataSet.txt”.
