
The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Conversions:
 Merge measurement data:
   rbind X_test  and X_train data to add as rows and load the data to a data frame mer_X_test_train. 
 Extract the variable names from features and add them as column names to the measurement dataframe:
   extract the variable names from features and add them as colnames to mer_X_test_train
   Merge the activity data and add a column name to the activity data
   extract y_test and y_train data and rbind them to mer_Y_test_train.
 Add column name, activity to the merged y test/train data
   Merge subject test and subject train data
   rbind subject_test and subject_train to mer_sub_test_train
   add column name subject_ID to to the mer_sub_test_train
   combine 1,2,3, steps and to create the master data set:
 cbind mer_sub_test_train,mer_Y_test_train,mer_X_test_train to subj_acti_meas


Data Results: First tidy data set
	Extract columns containing values for mean and standard deviation
	Subset columns containing text: mean, std
	create data frame, d to subset columns with mean values using grep()
	create data frame, e to subset columns with standard deviation values using grep()
	cbind the subject_ID, activity, columns with mean and standard deviation
	Add activity labels based on the activity id
	using mapvalues command find and replace activity values ("1","2","3","4","5","6"), to activity labels, c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
	Write the tidy data set to a table and save it to the local.


Data Results: Second tidy data set
Aggregate all the variables by mean for each subject_ID and activity label
Write the second tidy data set to a table and save it to the local.