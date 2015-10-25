setwd("~/Desktop/Analysis Material/Getting and cleaning data course/UCI HAR Dataset/test")
subject_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
setwd("~/Desktop/Analysis Material/Getting and cleaning data course/UCI HAR Dataset/train")
subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
names(y_test) <- "activity"
names(y_train) <- "activity"
y_train[y_train$activity==1,] <- "WALKING"
y_train[y_train$activity==2,] <- "WALKING_UPSTAIRS"
y_train[y_train$activity==3,] <- "WALKING_DOWNSTAIRS"
y_train[y_train$activity==4,] <- "SITTING"
y_train[y_train$activity==5,] <- "STANDING"
y_train[y_train$activity==6,] <- "LAYING"
y_test[y_test$activity==1,] <- "WALKING"
y_test[y_test$activity==2,] <- "WALKING_UPSTAIRS"
y_test[y_test$activity==3,] <- "WALKING_DOWNSTAIRS"
y_test[y_test$activity==4,] <- "SITTING"
y_test[y_test$activity==5,] <- "STANDING"
y_test[y_test$activity==6,] <- "LAYING"
names(subject_test) <- "sub_id"
names(subject_train) <- "sub_id"
test_dataset <- cbind.data.frame(subject_test,X_test)
test_dataset <- cbind.data.frame(test_dataset,y_test)
train_dataset <- cbind.data.frame(subject_train,X_train)
train_dataset <- cbind.data.frame(train_dataset,y_train)
merged_data <- merge(test_dataset,train_dataset,all = TRUE)
sapply(merged_data[,2:562],mean)
sapply(merged_data[,2:562],sd)
var <- read.table("../features.txt")
var <- as.character(var[,2])
var <- c("sub_id",var,"activity")
colnames(merged_data) <- var
library(reshape2)
melted_data <- melt(merged_data,id.vars = c("sub_id","activity"))
result <- dcast(melted_data,variable~activity+sub_id,mean)
