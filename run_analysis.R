# Source of data for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## This first section is optional, but the dplyr is required
# install.packages("dplyr")
# load dplyr package
# library(dplyr)

# 0. loading all required data into R      
test<-read.table("./UCI HAR Dataset/test/X_test.txt")
train<-read.table("./UCI HAR Dataset/train/X_train.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
activity<-read.table("./UCI HAR Dataset/activity_labels.txt")
act_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
act_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
subj_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subj_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")

# 1. Merging into single file
        # 1.1 merging body of data and labels dataset with descriptive variable names (Points 1 and 4 of assigment) 
                data<-rbind(test,train)
                data_names<-features[,2]
                data_names<-make.names(data_names,unique=TRUE)
                data_names<-gsub("[[:punct:]]{3}", "-",data_names)
                data_names<-gsub("[[:punct:]]{1}", "-",data_names)                
                data_names<-gsub("--","-",data_names)
                data_names<-tolower(data_names)
                names(data)<-data_names
        # 1.2 merging Activity descriptions and Subjects 
                act_merged<-rbind(act_test,act_train)
                # 1.2.1 matching activity codes with name description (Point 3 of assigment)
                        act_merged[,1]<-activity[act_merged[,1],2]
                        names(act_merged)<-"activity"
                subj_merged<-rbind(subj_test,subj_train)
                names(subj_merged)<-"subject"
        # 1.3 consolidated data frame      
                data<-cbind(subj_merged,act_merged,data) 

# 2. Only "mean" and "sdt" variables from data
data<-select(data,contains("subject"),contains("activity"),contains("-mean-"),contains("-std-"))

# 3. Creating an independent tidy data set with: avg. of each variable for each activity and subject
output<-summarise_each(group_by(data, subject, activity), funs(mean))
output<-arrange(output,subject)
write.table(output, "Final_tidy_dataset.txt",row.name=FALSE)
