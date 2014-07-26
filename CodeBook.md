Filename: CodeBook.md
by Steve Barkin   (Steven.Barkin@saama.com)

Describing Output data file:  SmartphoneAggData.csv


# of rows:  180
# of columns: 69
Columns are comma-separated.    Head row contains column names.

Column 1: 
Subject ID: integer from 1-30, each value represents one of the 30 subjects providing measurements

Column 2:
Activity ID: integer from 1-6, 1 = walking, 2 = walking upstairs, 3 = walking downstairs, 
   4 = sitting, 5 = standing, 6 = laying
   
Column 3:
Activity Name: character vector, with activity spelled out in English (see activity ID for values)

Columns 4 - 69:
66 different feature variable averages, averaged across all measurements for this subject and activity

Feature variables are as follows (see Human Activity Recognition Using Smartphones Dataset for
    scientific definitions of these feature measurements).  Each is a floating point value.
    
TimeBodyAccMeanX 
TimeBodyAccMeanY
TimeBodyAccMeanZ
TimeBodyAccStdX
TimeBodyAccStdY
TimeBodyAccStdZ
TimeGravityAccMeanX
TimeGravityAccMeanY
TimeGravityAccMeanZ
TimeGravityAccStdX
TimeGravityAccStdY
TimeGravityAccStdZ
TimeBodyAccJerkMeanX
TimeBodyAccJerkMeanY
TimeBodyAccJerkMeanZ
TimeBodyAccJerkStdX
TimeBodyAccJerkStdY
TimeBodyAccJerkStdZ
TimeBodyGyroMeanX
TimeBodyGyroMeanY
TimeBodyGyroMeanZ
TimeBodyGyroStdX
TimeBodyGyroStdY
TimeBodyGyroStdZ
TimeBodyGyroJerkMeanX
TimeBodyGyroJerkMeanY
TimeBodyGyroJerkMeanZ
TimeBodyGyroJerkStdX
TimeBodyGyroJerkStdY
TimeBodyGyroJerkStdZ
TimeBodyAccMagMean
TimeBodyAccMagStd
TimeGravityAccMagMean
TimeGravityAccMagStd
TimeBodyAccJerkMagMean
TimeBodyAccJerkMagStd
TimeBodyGyroMagMean
TimeBodyGyroMagStd
TimeBodyGyroJerkMagMean
TimeBodyGyroJerkMagStd
FreqBodyAccMeanX
FreqBodyAccMeanY
FreqBodyAccMeanZ
FreqBodyAccStdX
FreqBodyAccStdY
FreqBodyAccStdZ
FreqBodyAccJerkMeanX
FreqBodyAccJerkMeanY
FreqBodyAccJerkMeanZ
FreqBodyAccJerkStdX
FreqBodyAccJerkStdY
FreqBodyAccJerkStdZ
FreqBodyGyroMeanX
FreqBodyGyroMeanY
FreqBodyGyroMeanZ
FreqBodyGyroStdX
FreqBodyGyroStdY
FreqBodyGyroStdZ
FreqBodyAccMagMean
FreqBodyAccMagStd
FreqBodyBodyAccJerkMagMean
FreqBodyBodyAccJerkMagStd
FreqBodyBodyGyroMagMean
FreqBodyBodyGyroMagStd
FreqBodyBodyGyroJerkMagMean
FreqBodyBodyGyroJerkMagStd