The script run_analysis.R will run correctly in the the same directory as the file getdata_projectfiles_UCI HAR Dataset.zip is unzziped. There are two functions is the script : run_analysis() gives the Step 4 tidyset and secondtidyset() gives you the Step 5 tidyset.
run_analisys() reads and merges the different text files together. Names and standardizes all the variables. Selects the variables which use mean and standard deviation as measurement. Finaly, returns you a tidy set. secondtidyset() takes the tidy set given by run_analisys than calulates the mean of the values grouped by subject_id and name_activity. At the end, returns a narrower tidy set.

You can find Step 4 tidy set in tidyset.csv and Step 5 tidy set in secondtidyset.csv.

Cookbook.pdf contains some informations concerning the variables.  
