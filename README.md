#Getting and Cleaning Data - Course Project

This repository hosts the R code and documentation files for the course "Getting and Cleaning data", available in coursera.

The dataset being used is: [Human Activity Recognition Using Smartphones]

##Files

The code takes for granted all the data is present in the same folder, un-compressed and without names altered.

* `CodeBook.md` describes the variables, the data and all transformations that was performed to clean up the data.

* `run_analysis.R` contains the code to perform the analyses described in the 5 steps:

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set.
  4. Appropriately labels the data set with descriptive activity names.
  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

* The output of the 5th step is called `avg_data.txt` and uploaded in the Course Project's form.

[Human Activity Recognition Using Smartphones]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
