
#  Load libraries ---------------------------------------------------------

library(dplyr)

# Read files --------------------------------------------------------------

#Read from test folder
subjectTest <- read.table("data/test/subject_test.txt", skip = 0)
dim(subjectTest)

X_test <- read.table("data/test/X_test.txt", skip = 0)
dim(X_test)

y_test <- read.table("data/test/y_test.txt", skip = 0)
dim(y_test)

#Read from train folder
subjectTrain <- read.table("data/train/subject_train.txt", skip = 0)
dim(subjectTrain)

X_train <- read.table("data/train/X_train.txt", skip = 0)
dim(X_train)

y_train <- read.table("data/train/y_train.txt", skip = 0)
dim(y_train)


# 1. Merges the training and the test sets to create one data set ---------

df_test <- cbind(subjectTest, y_test, X_test)
dim(df_test)

df_train <- cbind(subjectTrain, y_train, X_train)
dim(df_train)

df <- rbind(df_test, df_train)
dim(df)


# 2. Extracts only the measurements on the mean and standard deviation --------

# First Interpretation
labels <- read.table("data/features.txt")
names(df) <- c("subject", "activity_label", labels$V2)

df_mean <- df[, grep("mean", c("subject", "activity_label", labels$V2))]
df_std <- df[, grep("std", c("subject", "activity_label", labels$V2))]

df_mean_std <- cbind(df_mean, df_std)
dim(df_mean_std)

# Second Interpretation
df_mean_std_2 <- data.frame()
for (i in names(df)[3:563])
{
  df_mean_std_2 <- rbind(df_mean_std_2, c(i, mean(df[,i]), sd(df[,i])))  
}
names(df_mean_std_2) <- c("value", "Mean", "Standard_Deviation")
dim(df_mean_std_2)
head(df_mean_std_2)


# 3. Uses descriptive activity names to name the activities in the --------

activity_labels <- read.table("data/activity_labels.txt")
names(activity_labels) <- c("activity_label", "activity_name")
head(activity_labels)

df <- merge(activity_labels, df, 
            by.x = "activity_label", 
            by.y = "activity_label")

df <- select(df, 2:564)


# 4. Appropriately labels the data set with descriptive variable n --------

df <- as_tibble(df)
head(df)
colnames <- names(df)
colnames <- gsub("-","",colnames)
colnames <- gsub("[()]$","",colnames)
colnames <- gsub("[()]$","",colnames)
colnames <- gsub("[()]","",colnames)
colnames <- gsub(",","_",colnames)
names(df) <- colnames
names(df)

# 5. From the data set in step 4, creates a second, independent ti --------
# Group by activity and subject 
df_group_act_subj <- group_by(df,df$activity_name,df$subject)
df_group_act_subj <- summarise_if(df_group1, is.numeric, mean)
head(df_group_act_subj)
# Group by activity
df_group_activity <- df %>% group_by(df$activity_name) %>% 
  summarise_if(is.numeric, mean)
head(df_group_activity)
# Group by subject
df_group_subject <- df %>% group_by(df$subject) %>% 
  summarise_if(is.numeric, mean)
head(df_group_subject)
