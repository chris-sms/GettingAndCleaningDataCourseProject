#### run_analysis.R
#### Submission for Getting and Cleaning Data course
#### 7/8/2016

# This script uses data from the UCI Human Activity Recognition Using Smartphones Dataset:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Raw data files are located here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Summary of Processing Steps:
# 1. Load label, test, and train data
# 2. Merge test and train datasets together
# 3. Assign descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive variable names
# 5. From the data set above, create a second, independent tidy data set with the average
#    of each variable for each activity and each subject

#### Load Data
# Load label data
activity_labels<-read.table("./data/UCI HAR Dataset/activity_labels.txt")
features<-read.table("./data/UCI HAR Dataset/features.txt")
# Load test data
subject_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
X_test<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
Y_test<-read.table("./data/UCI HAR Dataset/test/Y_test.txt")
# Load train data
subject_train<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
X_train<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
Y_train<-read.table("./data/UCI HAR Dataset/train/Y_train.txt")

#### Merge Data
Test<-cbind(subject_test,Y_test,X_test)
Test$Source<-"Test"
Train<-cbind(subject_train,Y_train,X_train)
Train$Source<-"Train"
Combined<-rbind(Train,Test)
colnames(Combined)[1]<-"Subject"
colnames(Combined)[2]<-"Activity"
Combined<-Combined[,c(ncol(Combined),1:ncol(Combined)-1)]

#### Assign descriptive activity names to name the activities in the data set
Combined<-merge(Combined,activity_labels,by.x="Activity",by.y="V1")
Combined$Activity<-Combined$V2.y
Combined<-Combined[,c(2,3,1,4:(ncol(Combined)-1))]
Combined<-Combined[order(Combined$Source,Combined$Subject,Combined$Activity),]

#### Appropriately label the data set with descriptive variable names
for (i in 4:ncol(Combined)) {
    colnames(Combined)[i]<-as.character(features[i-3,2])
}

#### Extract only the measurements on the mean and standard deviation for each measurement
MeanStdList<-grepl("mean[(]|std[(]",features[,2])
CombinedSubset<-Combined[,c(TRUE,TRUE,TRUE,MeanStdList)]

#### From the data set above, create a second, independent tidy data set with the average
#    of each variable for each activity and each subject
library(dplyr)
CombinedSubset[,c(2:ncol(CombinedSubset))] %>% group_by(Subject,Activity) %>% summarize_all(mean)
SummaryTable<-CombinedSubset[,c(-1)] %>% group_by(Subject,Activity) %>% summarize_all(mean)
# Clarify column names - average of each variable
for (i in 3:ncol(SummaryTable)) {
    colnames(SummaryTable)[i]<-paste("Average Of",colnames(SummaryTable)[i])
}
