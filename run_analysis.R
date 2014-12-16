##############################################
# Set working directory to the directory you #
# downloaded the data in.                    #
##############################################
#> setwd("Your directory here");
#> list.files();
#[1] "run_analysis.R"  "UCI HAR Dataset"



##############################################
# 1. Merging the training and test data sets #
##############################################
# Reading the training set #
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# Reading the test set #
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
# Merging train_x, train_y, data_subject
data_x <- rbind(train_x, test_x)
data_y <- rbind(train_y, test_y)
data_subject <- rbind(train_subject, test_subject)

# removing unnecessary data
l <- c("test_x", "test_y", "test_subject", "train_x", "train_y",
       "train_subject")
rm(list = l)


################################################
# 2. Extracting the features from features.txt #
################################################
# Loading features.txt to features
features <- read.table("./UCI HAR Dataset//features.txt")
# Give the features names to data_x
colnames(data_x) <- features$V2
# Create a logical vector containing whether the feature has
# either mean() or std() pattern in them
# grepl uses the regex expression and the features as arguments and
# returns a logical vector
features_logical <- grepl("-(mean|std)\\(\\)", features$V2)
#> backup_x <- data_x
# subset data_x so that it now only contains the values of mean() and std()
data_x <- data_x[ ,features_logical]

# removing unnecessary data
l <- c("features", "features_logical")
rm(list = l)

#######################################################
# 3. Assinging activity name to Activities in dataset #
#######################################################
# reading activities from activity_lables.txt
activity_lables <- read.table("./UCI HAR Dataset/activity_labels.txt")
# labeling the columns of the activity_lables data frame
colnames(activity_lables) <- c("ID", "Activity")
# Giving the descriptive activity label
data_y[, 1] <- activity_lables[data_y[, 1], 2]
# Labeling the column
colnames(data_y) <- "Activity"

# removing unnecessary data
rm(activity_lables)

#######################################################
# 4. Labeling dataset with descriptive variable names #
#######################################################
# data_x and data_y is already lablled
# labeling the data_subject
colnames(data_subject) <- "Subject"
# Now we can combine the data_x, data_y, data_subject
data <- cbind(data_subject, data_y, data_x)

# removing unnecessary data
l <- c("data_x", "data_y", "data_subject")
rm(l, list = l)

###################################################
# 5. Creating a second independent tidy data set. #
#    Average each variable for each activity      #
#    each subject.                                #
###################################################
# Load the plyr library
library(plyr)
# ddply splits the data frame,
# apply function, and returns result in a data frame
data_averaged <- ddply(data, .(Subject, Activity),  
                       function(data) colMeans(data[,3:68]))
## NOTE :
## Now each column in above dataset is a variable and each row comprises of 
## an observation. Hence it is Tidy dataset.

# write the output file
write.table(data_averaged, "data_average.txt", row.name = FALSE)
# Read the data_average.txt using the command
#> data <- read.table("./data_average.txt")
#> View(data)