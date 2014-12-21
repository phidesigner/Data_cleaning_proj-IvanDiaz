Data_cleaning_proj-IvanDiaz
===========================

Data Cleaning project Codebook


This document briefly describes the operations executed to the raw files, as described on the README.md on this repository. Details about the Human Activity Recognition Using Smartphones experiment and the variables measured can be found on the features_info.txt and the README.txt under the UCI HAR Dataset folder.

0. Load all required data into R via read.table

- 'features.txt': List of all features
- 'activity_labels.txt': Links the class labels with their activity name
- 'train/X_train.txt': Training set
- 'train/y_train.txt': Training labels
- 'test/X_test.txt': Test set
- 'test/y_test.txt': Test labels
- ‘train/subject_train.txt’: Subject list
- ‘test/subject_test.txt’: Subject list


1. The following operations were executed on this files:

- 'features.txt': The variables on this file were “cleaned” by:
	* making names unique e.g. make.names(features,unique=TRUE)
	* substituting dots “.” with “-“ characters e.g. gsub("[[:punct:]]{3}", “-“,features)
	* making all text lower capitals e.g. tolower(features)

- 'activity_labels.txt’
	* this file was linked with y_train.txt and y_test.txt e.g. act_merged[,1]<-activity[act_merged[,1],2]
- 'train/X_train.txt’
	* file merged with X_test.txt via rbind
- 'train/y_train.txt'
	* file merged with y_test.txt via rbind, and with consolidated “data” set via cbind (after merged)
- 'test/X_test.txt'
	* file merged with X_train.txt via rbind
- 'test/y_test.txt'
	* file merged with y_train.txt via rbind, and with consolidated “data” set via cbind (after merged)
- ‘train/subject_train.txt’
	* file merged with subject_test.txt via rbind, and with consolidated “data” set via cbind (after merged)
- ‘test/subject_test.txt’: Subject list
	* file merged with subject_train.txt via rbind, and with consolidated “data” set via cbind (after merged)

2. Extracts only the measurements on the mean and standard deviation for each measurement 
	*Only variables names containing “-mean-“ and “-std-“ were selected via select and contains function from dplyr package e.g. data<-select(data,contains("subject"),contains("activity"),contains("-mean-"),contains("-std-"))

3. Creates an independent tidy dataset with the averages of each variable for each activity and subject (6 activities, 30 subjects, 66 variables + 2 categorical variables).
	* variables were summarised using the mean function, across subjects and respective activities via summarise_each function from dplyr package e.g. output<-summarise_each(group_by(data, subject, activity), funs(mean))
	* output data was organised in ascending order via arrange function from dplyr e.g. output<-arrange(output,subject)
	* finally the independent file was created using write.table function e.g. write.table(output, "Final_tidy_dataset.txt",row.name=FALSE) 

Further details general process followed can be read on the readme.md file attached to this repository.

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

