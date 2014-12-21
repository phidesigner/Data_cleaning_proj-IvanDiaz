Data_cleaning_proj-IvanDiaz
===========================

Data Cleaning project Readme


This document briefly describes how the run_analysis.R script works.

The script creates an text file named “Final_tidy_dataset.txt” which summarises (averages) the key variables of the for each activity and each subject for the data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script was created under the following characteristics:
===========================================================

* Mac OSX Version 10.9.4
* R version 3.1.1 (2014-07-10)
* Package ‘dplyr’ version 0.3.0.2 <— required to be loaded (script automatically loads packages, and optionally (deleting the “#” symbol, can download it)
* Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The original data contains the following files and folders (further details can be found under README.txt in the UCI HAR Dataset folder):
=========================================================================================================================================

Test folder -> contains 30% of randomly partitioned set of observations
Training folder -> 70% of the randomly partitioned set of observations
activity_labels.txt -> contains descriptive names for each of the six performed activities
features_info.txt -> contains detailed info about each variable measured across subjects
features.txt -> list of 561 variables
readme.txt -> detailed description of experiment and acknowledgements


The R script (run_analysis.R) included on this repository (Data_cleaning_proj-IvanDiaz)performs the following steps to clean up and summarise the raw data:
===========================================================================================================================================================

0. Load all required data into R (The UCI HAR Dataset folder has to be copied on your R program working directory).
1. Merges the training and test sets to create one data set (i.e. train/X_train.txt and test/X_test.txt; subject codes (i.e. train/subject_train.txt and test/subject_test.txt); and activity codes (i.e. train/y_train.txt with test/y_test.txt)
2. Extracts only the measurements on the mean and standard deviation for each measurement (Only variables names containing “-mean-“ and “-std-“ were selected. Variables selected down to 66 from 561).
3. Creates an independent tidy dataset with the averages of each variable for each activity and subject (6 activities, 30 subjects, 66 variables + 2 categorical variables). Where, fhte irst column displays subject code (1 to 30); second column each activity measured (6 total)(e.g. walking, sitting, etc); and columns 3 to 68 provide averages for variables containing the average of each variable for each activity and each subject.

Further details on the changes applied to the raw data, and respective cleaning process can be read on codebook.md file attached to this repository.

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

