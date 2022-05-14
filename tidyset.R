tidyset <- function(){
  
  pathfile1 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt"
  pathfile2 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt"
  pathfile3 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt"
  pathfile4 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt"
  pathfile5 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt"
  pathfile6 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt"
  pathfile7 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt"
  pathfile8 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt"
  
  test_measure <- read.table(pathfile1, header= FALSE)
  test_activity <- read.table(pathfile2, header= FALSE)
  test_subject <- read.table(pathfile3, header= FALSE)
  train_measure <- read.table(pathfile4, header= FALSE)
  train_activity <- read.table(pathfile5, header= FALSE)
  train_subject <- read.table(pathfile6, header= FALSE)
  measurement <- read.table(pathfile7, header = FALSE)
  activity_name <- read.table(pathfile8, header = FALSE)
  
  testmerged <- cbind(test_subject, test_activity, test_measure)
  trainmerged <- cbind(train_subject, train_activity, train_measure)
  completedata <- rbind(testmerged, trainmerged)
  
  collumn_label <- c("subject_id", "activity_id", measurement[,2])
  colnames(completedata) <- collumn_label
  
  str(completedata)

  
  
  
}