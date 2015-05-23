library(plyr)
library(dplyr)

# Step 1: Merges the training and the test sets to create one data set.

## Read train data
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

## Read test data
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

## Create "x" data set
x_data <- rbind(x_train, x_test)

## Create "y" data set
y_data <- rbind(y_train, y_test)

## Create "subject" data set
subject_data <- rbind(subject_train, subject_test)

## Read column names of "x" data set
features <- read.table("features.txt")

## Assign column names to "x" data set
colnames(x_data) <- features[,2]

## Assign column name to "y" data set
colnames(y_data) <- "id_activity"

# Assign column name to "subjet" data set
colnames(subject_data) <- "subject"

# Bind all the data in a single data set
data <- cbind(x_data, y_data, subject_data)

# Step 2: Extracts only the measurements on the mean and standard 
# deviation for each measurement. 

## Select the columns that have mean and standard deviation
data <- data[,grep("-mean\\(\\)|-std\\(\\)|id_activity|subject",colnames(data))]

# Step 3: Uses descriptive activity names to name the activities 
# in the data set.

## Read activities names of "y" data set
activities <- read.table("activity_labels.txt")
colnames(activities) <- c("id_activity","activity")

## Merge the "y" data set with the table activities to include 
## descriptive activity names
data <- merge(data, activities, by='id_activity',all.x=TRUE)

# Step 4: Appropriately labels the data set with descriptive 
# variable names. 

names <- colnames(data)

names <- gsub("\\()","",names)
names <- gsub("-","",names)
names <- gsub("mean","Mean",names)
names <- gsub("std","Std",names)

colnames(data) <- names

# Step 5: From the data set in step 4, creates a second, independent 
# tidy data set with the average of each variable for each activity 
# and each subject.

data <- select(data, -id_activity)
avg_data <- ddply(data, .(activity,subject), function(x) colMeans(x[, 1:66]))

write.table(avg_data, "avg_data.txt",row.names=FALSE,sep='\t')
