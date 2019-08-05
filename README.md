# Getting-and-Cleaning-Data-Course-Project
Final project for Getting and Cleaning Data Course

Requires test, training, subjects, feature labels data in the working directory, structured in the same manner as supplied in the assignment (eg. ./train folder, ./test folder).

Reads in the test & train data, activity labels.
Binds the X features for test & train together.
Binds the Y (activity feature) for test & train together.
Replaces Y activity feature with activity labels for readability.
Reads in X feature labels.
Replaces X feature column indices with feature labels.
Binds X features (selecting only mean&stdev labels), subjects, activities.
Calls dplyr.
Groups records by activity & subject.
Summarises data by calling summarise all using the mean function to find variable averages as requested.
Write resulting table to tidyDataset.txt.
