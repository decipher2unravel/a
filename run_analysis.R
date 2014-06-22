#Following R-packages are installed.
install packages("xlsReadWrite")
library(xlsx)
library(xlsxjars)
library(plyr)
library(reshape)

#Load X_test & X_train
X_test <- read.table("X_test.txt", header=FALSE)
y_test <- read.table("y_test.txt", header=FALSE)
X_train <- read.table("X_train.txt", header=FALSE)
y_train <- read.table("y_train.txt", header=FALSE)
features <- read.table("features.txt", header=FALSE)
activity_labels <- read.table("activity_labels.txt", header=FALSE)
subject_test <- read.table("subject_test.txt", header=FALSE)
subject_train <- read.table("subject_train.txt", header=FALSE)

# Merge X_test & X_train measurements
mer_X_test_train <- rbind(X_test,X_train)
##Add column names from 'features.txt' to the merged test/train measurement
colnames(mer_X_test_train) <- features$V2

#Merge y_test & y_train data
mer_Y_test_train <- rbind(y_test,y_train)
##Add column name as "activity" to the merged y test/train data
colnames(mer_Y_test_train) <- "activity"

#Merge subject_test & subject_train data
mer_sub_test_train <- rbind(subject_test,subject_train)
##Add column name as "activity" to the merged y test/train data
colnames(mer_sub_test_train) <- "subject_ID"

#column bind subject, activity and test/train measurements:
subj_acti_meas <- cbind(mer_sub_test_train,mer_Y_test_train,mer_X_test_train)


#subsetting columns containing text: "mean()", "std()", "activity" 
d <- subj_acti_meas[,grepl("mean()", names(subj_acti_meas), fixed=TRUE)]
e <- subj_acti_meas[,grepl("std()", names(subj_acti_meas), fixed=TRUE)]
activity <- subj_acti_meas[,grepl("activity", names(subj_acti_meas), fixed=TRUE)]
subject_ID <- subj_acti_meas[,grepl("subject_ID", names(subj_acti_meas), fixed=TRUE)]

#column bind columns with the data for mean, standard deviation(std), activity
subj_acti_mean_std <- cbind(subject_ID,activity,d,e)


#Replace activity row values with relevant activity names from activity_labels
subj_acti_mean_std$activity <- as.character(subj_acti_mean_std$activity)

subj_acti_mean_std$activity<- mapvalues(subj_acti_mean_std$activity, c("1","2","3","4","5","6"), 
                                        c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"),
                                        warn_missing=T)

TIDY.DATA.SET <- write.table(subj_acti_mean_std, "C:/Users/Priya/R/Homework/Getting and cleaning data/Assignment 1/Assignment 1_FINAL/TidyData_first.csv" , sep="|$|") 

#2nd independent tidy data set

melted <- melt(subj_acti_mean_std,id=c("subject_ID","activity"))
casted <-cast(melted, subject_ID + activity ~ variable, mean)
TIDY.DATA.SET.2 <- write.table(casted, "C:/Users/Priya/R/Homework/Getting and cleaning data/Assignment 1/Assignment 1_FINAL/TidyData_second.csv" , sep="|$|") 
