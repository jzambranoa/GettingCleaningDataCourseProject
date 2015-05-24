# Code Book

##Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

##Attribute Information

The dataset `data` is the result of cleaning and selecting data. Here follows a description of what  looks `data` like:

1. The first variable activity denotes the activity performed by the subject. There are 6 activites, listed here:

 * WALKING
 * WALKING_UPSTAIRS
 * WALKING_DOWNSTAIRS
 * SITTING
 * STANDING
 * LAYING

2. The second variable subject denotes the subject number that performed an activity. In total there are 30 subjects.

A total of 66 features were selected from the original data: Only the estimated mean and standard deviations, using a `grep` on `-mean()|-std()`. These features form the 66 other variables in the dataset, making a total of 68 columns. The feature names from the original data have been rewritten, using the following rules:

* dashes and parentheses have been removed
* mean has been replaced by Mean
* std has been replaced by Std

For example:

* `tBodyAcc-mean()-X` becomes `tBodyAccMeanX`
* `tBodyAcc-std()-Y` becomes `tBodyAccStdY`

A full description of the features is best obtained from the file `features_info.txt`, included with the original dataset.

###Data set `avg_data`

The observations from `data` were grouped by activity and subject and then aggregated using the mean function. This yields 180 rows (30 subjects x 6 activities) and 68 columns (1 for subject, 1 for activity plus 66 aggregated features). 
