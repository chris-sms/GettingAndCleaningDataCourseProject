# Getting and Cleaning Data Course Project
#### Submission for Getting and Cleaning Data course
#### 7/8/2016
#### CodeBook.md

This script uses data from the UCI Human Activity Recognition Using Smartphones Dataset:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

##### Raw data files are located here:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##### Summary of Processing Steps:  
1. Load label, test, and train data  
2. Merge test and train datasets together  
3. Assign descriptive activity names to name the activities in the data set  
4. Appropriately label the data set with descriptive variable names  
5. From the data set above, create a second, independent tidy data set with the average  
   of each variable for each activity and each subject  
6. Export the summary data set from step 5 to a text file  

##### Raw Data Set Information (from the UCI Human Activity Recognition Using Smartphones site):
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."


##### Variables in Summary File:
Each variable #3-68 represents the average value of the indicated measurement
for the indicated subject and activity  
Units:  acceleration and angular velocity

"1" "Subject"  
"2" "Activity"  
"3" "Average Of tBodyAcc-mean()-X"  
"4" "Average Of tBodyAcc-mean()-Y"  
"5" "Average Of tBodyAcc-mean()-Z"  
"6" "Average Of tBodyAcc-std()-X"  
"7" "Average Of tBodyAcc-std()-Y"  
"8" "Average Of tBodyAcc-std()-Z"  
"9" "Average Of tGravityAcc-mean()-X"  
"10" "Average Of tGravityAcc-mean()-Y"  
"11" "Average Of tGravityAcc-mean()-Z"  
"12" "Average Of tGravityAcc-std()-X"  
"13" "Average Of tGravityAcc-std()-Y"  
"14" "Average Of tGravityAcc-std()-Z"  
"15" "Average Of tBodyAccJerk-mean()-X"  
"16" "Average Of tBodyAccJerk-mean()-Y"  
"17" "Average Of tBodyAccJerk-mean()-Z"  
"18" "Average Of tBodyAccJerk-std()-X"  
"19" "Average Of tBodyAccJerk-std()-Y"  
"20" "Average Of tBodyAccJerk-std()-Z"  
"21" "Average Of tBodyGyro-mean()-X"  
"22" "Average Of tBodyGyro-mean()-Y"  
"23" "Average Of tBodyGyro-mean()-Z"  
"24" "Average Of tBodyGyro-std()-X"  
"25" "Average Of tBodyGyro-std()-Y"  
"26" "Average Of tBodyGyro-std()-Z"  
"27" "Average Of tBodyGyroJerk-mean()-X"  
"28" "Average Of tBodyGyroJerk-mean()-Y"  
"29" "Average Of tBodyGyroJerk-mean()-Z"  
"30" "Average Of tBodyGyroJerk-std()-X"  
"31" "Average Of tBodyGyroJerk-std()-Y"  
"32" "Average Of tBodyGyroJerk-std()-Z"  
"33" "Average Of tBodyAccMag-mean()"  
"34" "Average Of tBodyAccMag-std()"  
"35" "Average Of tGravityAccMag-mean()"  
"36" "Average Of tGravityAccMag-std()"  
"37" "Average Of tBodyAccJerkMag-mean()"  
"38" "Average Of tBodyAccJerkMag-std()"  
"39" "Average Of tBodyGyroMag-mean()"  
"40" "Average Of tBodyGyroMag-std()"  
"41" "Average Of tBodyGyroJerkMag-mean()"  
"42" "Average Of tBodyGyroJerkMag-std()"  
"43" "Average Of fBodyAcc-mean()-X"  
"44" "Average Of fBodyAcc-mean()-Y"  
"45" "Average Of fBodyAcc-mean()-Z"  
"46" "Average Of fBodyAcc-std()-X"  
"47" "Average Of fBodyAcc-std()-Y"  
"48" "Average Of fBodyAcc-std()-Z"  
"49" "Average Of fBodyAccJerk-mean()-X"  
"50" "Average Of fBodyAccJerk-mean()-Y"  
"51" "Average Of fBodyAccJerk-mean()-Z"  
"52" "Average Of fBodyAccJerk-std()-X"  
"53" "Average Of fBodyAccJerk-std()-Y"  
"54" "Average Of fBodyAccJerk-std()-Z"  
"55" "Average Of fBodyGyro-mean()-X"  
"56" "Average Of fBodyGyro-mean()-Y"  
"57" "Average Of fBodyGyro-mean()-Z"  
"58" "Average Of fBodyGyro-std()-X"  
"59" "Average Of fBodyGyro-std()-Y"  
"60" "Average Of fBodyGyro-std()-Z"  
"61" "Average Of fBodyAccMag-mean()"  
"62" "Average Of fBodyAccMag-std()"  
"63" "Average Of fBodyBodyAccJerkMag-mean()"  
"64" "Average Of fBodyBodyAccJerkMag-std()"  
"65" "Average Of fBodyBodyGyroMag-mean()"  
"66" "Average Of fBodyBodyGyroMag-std()"  
"67" "Average Of fBodyBodyGyroJerkMag-mean()"  
"68" "Average Of fBodyBodyGyroJerkMag-std()"  

#### Load Data  
##### Load label data  
activity_labels<-read.table("./data/UCI HAR Dataset/activity_labels.txt")  
features<-read.table("./data/UCI HAR Dataset/features.txt")  
##### Load test data  
subject_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")  
X_test<-read.table("./data/UCI HAR Dataset/test/X_test.txt")  
Y_test<-read.table("./data/UCI HAR Dataset/test/Y_test.txt")  
##### Load train data  
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
#### of each variable for each activity and each subject  
library(dplyr)  
CombinedSubset[,c(2:ncol(CombinedSubset))] %>% group_by(Subject,Activity) %>% summarize_all(mean)  
SummaryTable<-CombinedSubset[,c(-1)] %>% group_by(Subject,Activity) %>% summarize_all(mean)  
##### Clarify column names - average of each variable  
for (i in 3:ncol(SummaryTable)) {  
    colnames(SummaryTable)[i]<-paste("Average Of",colnames(SummaryTable)[i])  
}  

#### Export  
write.table(SummaryTable,file="./Getting and Cleaning Data Course Project/SummaryTable.txt",row.name=FALSE)  
