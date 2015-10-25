# Getting and cleaning data course Course project
## The script located in the run_analysis.R file does the following:

  1- sets thw working directory in test
  
  2- reads the test files
  
  3- repeats point 1 and 2 for the train directory and files
  
  4- set new names for the 1st column in y_test and in y_train
  
  5- renames the activities in y_test and in y_train
  
  6- merges all the data frames previously created creating "merged_data"
  
  7- calculates the mean and the standard deviation for all variables of merged_data except for "sub_id" and "activity"
  
  8- renames all the variables with readable names, trasforming them from factor to characters
  
  9- using the "reshape2" package, melts merged_data using as id variables only "sub_id" and "activity"
  
  10- creates a new data frame called "result" with the average of each variable for each activity and each sub_id.
