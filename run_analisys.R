
  # The file "getdata_projectfiles_UCI HAR Dataset.zip" needs to be unzipped in
  # the directory where the file run_analisys.R is. There are two functions in this 
  # files: run_analisys() gives you the first tidy set and secondtidyset() gives you 
  # a narrower version of the first one.


run_analisys <- function(){
  
  # Check if dplyr package is installed.
  
  if(!require(dplyr)){
    stop("dplyr not installed")
  }
  else{
  
  pathfile1 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt"
  pathfile2 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt"
  pathfile3 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt"
  pathfile4 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt"
  pathfile5 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt"
  pathfile6 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt"
  pathfile7 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt"
  
  # Read the different text files.
  
  test_measure <- read.table(pathfile1, header= FALSE)
  test_activity <- read.table(pathfile2, header= FALSE)
  test_subject <- read.table(pathfile3, header= FALSE)
  train_measure <- read.table(pathfile4, header= FALSE)
  train_activity <- read.table(pathfile5, header= FALSE)
  train_subject <- read.table(pathfile6, header= FALSE)
  measurement <- read.table(pathfile7, header = FALSE)
  
  # Merge all the data frames into one.
  
  test_merged <- cbind(test_subject, test_activity, test_measure)
  train_merged <- cbind(train_subject, train_activity, train_measure)
  complete_data <- rbind(test_merged, train_merged)
  
  # Name all variables.
  
  column_label <- c("subject_id", "activity_name", measurement[,2])
  colnames(complete_data) <- column_label
  
  # Create a new data frame by keeping the first two rows and all the variables 
  # with mean() et std() in their name. Tidy column names.
  
  pattern <- c("mean\\(\\)", "std\\(\\)", "subject_id", "activity_name" )
  selected_data <- complete_data[,grepl(paste(pattern,collapse="|" ), names(complete_data))]
  colnames(selected_data) <- tolower(gsub("\\(", "", 
                                     gsub("\\)", "",
                                     gsub("-","_", colnames(selected_data)))
                                     ))
  
  # Replace activity codes with activity names.
  
  tidy_set <- selected_data %>% mutate(activity_name = 
                        case_when(activity_name == 1 ~ "walking",
                                  activity_name == 2 ~ "walking upstairs",
                                  activity_name == 3 ~ "walking downstairs",
                                  activity_name == 4 ~ "sitting",
                                  activity_name == 5 ~ "standing",
                                  activity_name == 6 ~ "laying"
                                  ))
  tidy_set
  
  }
}

secondtidyset <- function(){
  
  # Check if dplyr package is installed.
  
  if(!require(dplyr)){
    stop("dplyr not installed")
  }
  else{
  
  # Call the function run_analisys() and calculate the mean of all variables 
  # grouped by subject_id and activity_name.
  
  tidy_set <- run_analisys()
  second_tidyset <- tidy_set %>% group_by(subject_id, activity_name) %>%
    summarise_all(mean) %>% ungroup()
  
  second_tidyset 
  
  }
=======
  # The file "getdata_projectfiles_UCI HAR Dataset.zip" needs to be unzipped in
  # the directory where the file run_analisys.R is. There are two functions in this 
  # files: run_analisys() gives you the first tidy set and secondtidyset() gives you 
  # a narrower version of the first one.

run_analisys <- function(){
  
  # Check if dplyr package is installed.
  
  if(!require(dplyr)){
    stop("dplyr not installed")
  }
  else{
  
  pathfile1 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt"
  pathfile2 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt"
  pathfile3 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt"
  pathfile4 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt"
  pathfile5 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt"
  pathfile6 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt"
  pathfile7 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt"
  
  # Read the different text files.
  
  test_measure <- read.table(pathfile1, header= FALSE)
  test_activity <- read.table(pathfile2, header= FALSE)
  test_subject <- read.table(pathfile3, header= FALSE)
  train_measure <- read.table(pathfile4, header= FALSE)
  train_activity <- read.table(pathfile5, header= FALSE)
  train_subject <- read.table(pathfile6, header= FALSE)
  measurement <- read.table(pathfile7, header = FALSE)
  
  # Merge all the data frames into one.
  
  test_merged <- cbind(test_subject, test_activity, test_measure)
  train_merged <- cbind(train_subject, train_activity, train_measure)
  complete_data <- rbind(test_merged, train_merged)
  
  # Name all variables.
  
  column_label <- c("subject_id", "activity_name", measurement[,2])
  colnames(complete_data) <- column_label
  
  # Create a new data frame by keeping the first two rows and all the variables 
  # with mean() et std() in their name. Tidy column names.
  
  pattern <- c("mean\\(\\)", "std\\(\\)", "subject_id", "activity_name" )
  selected_data <- complete_data[,grepl(paste(pattern,collapse="|" ), names(complete_data))]
  colnames(selected_data) <- tolower(gsub("\\(", "", 
                                     gsub("\\)", "",
                                     gsub("-","_", colnames(selected_data)))
                                     ))
  
  # Replace activity codes with activity names.
  
  tidy_set <- selected_data %>% mutate(activity_name = 
                        case_when(activity_name == 1 ~ "walking",
                                  activity_name == 2 ~ "walking upstairs",
                                  activity_name == 3 ~ "walking downstairs",
                                  activity_name == 4 ~ "sitting",
                                  activity_name == 5 ~ "standing",
                                  activity_name == 6 ~ "laying"
                                  ))
  tidy_set
  
  }
}

secondtidyset <- function(){
  
  # Check if dplyr package is installed.
  
  if(!require(dplyr)){
    stop("dplyr not installed")
  }
  else{
  
  # Call the function run_analisys() and calculate the mean of all variables 
  # grouped by subject_id and activity_name.
  
  tidy_set <- run_analisys()
  second_tidyset <- tidy_set %>% group_by(subject_id, activity_name) %>%
    summarise_all(mean) %>% ungroup()
  
  second_tidyset 
  
  
  }
>>>>>>> 78a61425a3aa0c36d84730fe9ceec040ef29f2c6
}
