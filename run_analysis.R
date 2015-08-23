library(dplyr);

## Downloading Dataset.zip in the working directory, if it does not already exists
if (!file.exists("Dataset.zip"))
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","Dataset.zip")
end

## Loading variables names from Dataset.zip, for training and test data sets.
features <- read.csv(unz("Dataset.zip", "UCI HAR Dataset/features.txt"), sep=";", header=FALSE);

###############################
## Working on TRAINING files ##
###############################
  # Loading TRAINING files
    train <- read.csv(unz("Dataset.zip", "UCI HAR Dataset/train/X_train.txt"), header=FALSE, sep="");
  # Inserting variable Names (variable names from features.txt)
    colnames(train) <- features[,1];

  # Selecting desired variables (measurements on the mean and standard deviation)
    train <- select(train, contains("mean()"), contains("std()"));
    
  # Loading activity variable
    activity <- read.csv(unz("Dataset.zip", "UCI HAR Dataset/train/y_train.txt"), header=FALSE);
    colnames(activity) <- "Activity";
  
  # Loading subject variable
    subject <- read.csv(unz("Dataset.zip", "UCI HAR Dataset/train/subject_train.txt"), header=FALSE);
    colnames(subject) <- "Subject";
  
  # Defining kind variable to distinguish TRAINING and TEST observations after bind tables
    origin <- rep(1,nrow(train));
    names(origin) <- "origin";

  # Binding activity, subject and kind variables
    train <- cbind(train, activity, subject, origin)

  # Updating activity variable wih names (descriptive activity names)
    train$Activity[train$Activity=="1"] <- "WALKING"
    train$Activity[train$Activity=="2"] <- "WALKING_UPSTAIRS"
    train$Activity[train$Activity=="3"] <- "WALKING_DOWNSTAIRS"
    train$Activity[train$Activity=="4"] <- "SITTING"
    train$Activity[train$Activity=="5"] <- "STANDING"
    train$Activity[train$Activity=="6"] <- "LAYING"

###############################
## Working on TEST files     ##
###############################
  # Loading TEST files
    test <- read.csv(unz("Dataset.zip", "UCI HAR Dataset/test/X_test.txt"), header=FALSE, sep="");
  # Inserting variable Names (variable names from features.txt)
    colnames(test) <- features[,1];

  # Selecting desired variables (measurements on the mean and standard deviation)
    test <- select(test, contains("mean()"), contains("std()"))
    
  # Loading activity variable
    activity <- read.csv(unz("Dataset.zip", "UCI HAR Dataset/test/y_test.txt"), header=FALSE);
    colnames(activity) <- "Activity";
  
  # Loading subject variable
    subject <- read.csv(unz("Dataset.zip", "UCI HAR Dataset/test/subject_test.txt"), header=FALSE);
    colnames(subject) <- "Subject";
  
  # Defining origin variable to distinguish TRAINING and TEST observations after bind tables
    origin <- rep(2,nrow(test));
    names(origin) <- "origin";
  
  # Binding activity, subject and kind variables
    test <- cbind(test, activity, subject, origin)

  # Updating activity variable wih names (descriptive activity names)
    test$Activity[test$Activity=="1"] <- "WALKING"
    test$Activity[test$Activity=="2"] <- "WALKING_UPSTAIRS"
    test$Activity[test$Activity=="3"] <- "WALKING_DOWNSTAIRS"
    test$Activity[test$Activity=="4"] <- "SITTING"
    test$Activity[test$Activity=="5"] <- "STANDING"
    test$Activity[test$Activity=="6"] <- "LAYING"
    
#############################################
## Binding training and test data sets     ##
#############################################
tidy_dataset <- rbind(train, test);

######################################################
## Creating a second, independent                   ##
## tidy data set with the average of                ##
## each variable for each activity and each subject ##
######################################################
by_act_sub <- group_by(tidy_dataset, Activity, Subject) %>%
mutate_each(funs(mean))%>%unique

## Writing the result in the working directory    
write.table(by_act_sub,"by_act_sub.txt", row.names = FALSE)

## ****************** Finish ******************
