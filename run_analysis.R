# File: run_analysis.R
# By Steve Barkin
# Steven.Barkin@saama.com
# Hopkins Coursera Data Science Series: Getting and Cleaning Data (Course #3)
# July 26, 2014
# Week 3 Programming Assignment (Wearable Computing)

#First get 561 feature names
featurenames = read.table("features.txt", sep="", col.names = c("featnum", "featname"))
    # featurenames[featnum, featname]

# Now get 6 activity labels
ActivityLabels = read.table("activity_labels.txt", 
                             sep = " ", col.names = c("ActivityID", "ActivityName"))

# Get raw values of 561 features for the training set, each row corresponds to a reading, for
# one of 30 subjects and one of 6 activities  (multiple rows per subject/activity combination)
xtrain = read.table("train/X_train.txt", sep = "",    #561 features, labeled based on featurenames
                    col.names = featurenames$featname )      

# Now perform the same operation for the test set.
xtest = read.table("test/X_test.txt", sep = "",    #561 features, labeled based on featurenames
                    col.names = featurenames$featname )  

#66 feature indices we wish to retain (mean & std, but not meanfreq)
keep_features = which(grepl("mean|std", featurenames$featname) &
                          !grepl("meanFreq", featurenames$featname)) 

#Combine training & test observations, for only the 66 selected features   
xdata = rbind(xtrain[,keep_features], xtest[,keep_features])

#Clean up column names to make them more readable
colnames(xdata) = gsub("\\.","",colnames(xdata))    # remove periods
colnames(xdata) = sub("^f","Freq", colnames(xdata))   # spell out "Freq" instead of "f" (prefix)
colnames(xdata) = sub("^t", "Time", colnames(xdata))  # spell out "Time" instead of "t"  (prefix)
colnames(xdata) = sub("mean", "Mean", colnames(xdata))  # capitalize Mean
colnames(xdata) = sub("std", "Std", colnames(xdata))  # capitalize Std


#Read subject IDs corresponding to each observation (training + test set, then combine)
subject_train = read.table("train/subject_train.txt", sep="", col.names = c("SubjectID"))
subject_test = read.table("test/subject_test.txt", sep="", col.names = c("SubjectID"))
subjects = rbind(subject_train, subject_test)

# get ActivityID for each observation ("y")
ytrain = read.table("train/y_train.txt", sep="", col.names = c("ActivityID"))
ytest = read.table("test/y_test.txt", sep="", col.names = c("ActivityID"))
yvalues = rbind(ytrain, ytest)   #ActivityID's

# Map Activity IDs to their respective (readable) Activity Names using the ActivityLabels matrix
# as a lookup table.    Both will end up in the final data.
ymat = as.matrix(yvalues)
yvec = ymat[,1]
ActivityName = ActivityLabels[yvec,"ActivityName"]

# Output data set #1: smartphone_data   (non-aggregate)
#smartphone_data has columns SubjectID, ActivityID, ActivityName, and 66 feature variables
# one row per reading
smartphone_data = cbind(subjects, yvalues, ActivityName, xdata)

# Output data set #2: agg_table
# Rollup of smartphone_data, one row per Subject ID/Activity ID combination, with averages
# of the 66 feature variables across readings.  numcolwise is a great function!

agg_table = ddply(smartphone_data,.(SubjectID, ActivityID, ActivityName),numcolwise(mean))

# Write both of these datasets to their respective CSV files.  Tidy!
write.csv(smartphone_data, file = "SmartphoneData.csv", row.names = FALSE)
write.csv(agg_table, file = "SmartphoneAggData.csv", row.names = FALSE)
