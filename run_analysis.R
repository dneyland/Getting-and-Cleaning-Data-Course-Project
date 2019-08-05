# Read training data
X_train <- read.table("./train/X_train.txt")
Y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")
# Read test data
X_test <- read.table("./test/X_test.txt")
Y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
# Merge training and test datasets
X <- rbind(X_train,X_test)
Y <- rbind(Y_train,Y_test)
subject <- rbind(subject_train,subject_test)
# Read activity labels
activity_labels <- read.table("activity_labels.txt")
# Provide descriptive activity names to the labels
Y <- inner_join(Y,activity_labels)[,2]
# Read feature labels
feature_labels <- read.table("features.txt")
# Rename dataset with feature labels
names(X) <- feature_labels[,2]
Y <- data.frame(Y)
names(Y) <- "activity"
names(subject) <- "subject"
# Create final dataframe extracting only means & standard deviations, binding with activity labels and subjects
dataset <- cbind(X[,grepl("mean|std",names(X))],subject,Y)
library(dplyr)
# Group dataset by subject & activity, giving the average of each variable
by_subj_act <- dataset %>% group_by(subject,activity) %>% summarise_all(mean)
# Write the final tidy dataset to a csv
write.table(by_subj_act, file = "tidyDataset.txt", row.name=FALSE)