## The R script run_analysis.R loads raw data and merges the test sets to create one data set.
## It writes an independent tidy data set with the average of each variable for each activity 
## and each subject in a txt file named TidyDataSet.txt. Therefore the following steps are run:
## 1. Load raw data and merge the training and test sets to one data set
## 2. Rename variables
## 3. Rename activities
## 4. Extract only measurements on mean and standard deviation for each measurement (variables with either mean or std in their names)
## 5. Create independent tidy data set with average of each variable for each activity and each subject
## 6. Save TidyDataSet.txt

run_analysis <- function() {
	## In this function it is assumed that the dplyr package is installed. Please install it if not already installed.
	library(dplyr)

	## Load data and merge the training and test sets to one data set
	## It is assumed that the working directory is the folder in which the files with the features names and activity_labels are stored (e.g. 'UCI HAR Dataset').
	## Furthermore it is assumed that the actual data is in the subfolders 'test' and 'train'.

	## Training data:
	## First the y_train data is cbinded with the X_train data in dataset1. This makes a dataframe with dimension 7352x562. Then the subject_train data
	## is cbinded with dataset1 to dataset1, so the dimension of dataset1 is 7352x563.
	data1 <- read.table("./train/y_train.txt")
	dataset1 <- read.table("./train/X_train.txt")
	dataset1 <- cbind(data1,dataset1)
	data1 <- read.table("./train/subject_train.txt")
	dataset1 <- cbind(data1,dataset1)

	## Test data: The same steps are applied as on the Training data. The result is dataset2 with a dimension of 2947x563.
	## dataset1 and dataset2 are rbinded into the dataframe dataset1. The dimension of dataset1 is now 10299x563.
	data1 <- read.table("./test/y_test.txt")
	dataset2 <- read.table("./test/X_test.txt")
	dataset2 <- cbind(data1,dataset2)
	data1 <- read.table("./test/subject_test.txt")
	dataset2 <- cbind(data1,dataset2)

	dataset1 <- rbind(dataset1, dataset2)


	## Rename variables
	vector1 <- c("subject_nr","activity_label")
	data1 <- read.table("features.txt")
	vector2 <- as.character(data1[,2])
	vector3 <- c(vector1,vector2)
	colnames(dataset1) <- vector3

	## Rename activities 
	data1 <- read.table("activity_labels.txt")
	dataset1 <- merge(data1, dataset1, by.x="V1", by.y="activity_label")
	## Rename the column with the activity names
	names(dataset1)[names(dataset1)=="V2"] <- "activity_label"
	## Remove the column with the activity number, not needed anymore
	dataset1 <- dataset1[, -1]


	## Extract only measurements on mean and standard deviation for each measurement
	## All columns with either "mean" or "std" in the name will be selected, together with the columns "activity_label" and "subject_nr"
	dataset1 <- dataset1[, grepl("activity_label|subject_nr|mean|std", colnames(dataset1))]


	## Create independent tidy data set with average of each variable for each activity and each subject
	dataset2 <- group_by(dataset1, activity_label, subject_nr)
	dataset2 <- summarize_each(dataset2,funs(mean))
	write.table(dataset2, file="TidyDataSet.txt", row.name=FALSE)
}
