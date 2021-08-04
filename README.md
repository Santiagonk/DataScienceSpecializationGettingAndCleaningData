# Getting And Cleaning Data Course Project
## Description

The purpose of this project is to complete the final challenge of the course "Getting and Cleaning Data" by Johns Hopkins University Specialization in Data Science. The project is about the step in Data Science Methodology, that Get and Clean the data that is one of the most important and that takes more time to do. The final goal is a Tidy Dataset defined by Hadley Wickham in their article [Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf).

## Requirements

* R
* RStudio
* dplyr (R library installed)

## Data

The data that we work is "Human Activity Recognition Using Smartphones Data Set" you can find them in the [Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#). The data is about the recordings of 30 subjects performing activities while carrying a waist-mounted smartphone with an embedded inertial sensor. 
You can find more information about the Dataset in the readme.txt inside this project.

## Challenges

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Develop

You can find the solution of the assignment in the file run_analysis.R. Inside you can see all the challenges divide by an RStudio Session.

`# Example of a RStudio Section --------`

The first section in the file is about load the libraries (Look at the requirements section to see what libraries you need to install).

The second section loads the data. I worked only with test and train data and ignored the Inertial Signals because the data inside these files was processes and put inside the test and train datasets.

Then the following steps solve each challenge, that's is an example that how looks a challenge section:

`# 1. Merges the training and the test sets to create one data set ---------`

