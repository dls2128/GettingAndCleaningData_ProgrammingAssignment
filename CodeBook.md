---
title: "CodeBook"
author: "Dara Sosulski"
date: "April 25, 2015"
output: pdf_document
---

This codebook describes the operations performed on the data provided by run_analysis.R to produce a tidy data set containing the means for 561 variables according to subject number (1-30) and activity type (walking, walking upstairs, walking downstairs, standing, laying, 
sitting), as well as a description of each variable. 

run_analysis.R performs the following operations to create a tidy data set containing 
the means for 561 variables with respect to each subject and activity 
(e.g., the mean of angle(Z,gravityMean) for subject 1 during "walking"): 

1. Loads the following .txt files: activity_labels.txt, features_info.txt, features.txt, 
subject_test.txt, y_test.txt, X_test.txt, subject_train.txt, y_train.txt, X_train.txt 
as data frames into the global environment 

2. Extracts the variable names from features.txt

3. Replaces the column names in X_train and X_test with these extracted variables names

4. Merges the training data (data from subject_train, y_train and X_train) by column
(using cbind)

5. Merges the test data (data from subject_test, y_test and X_test) by column 
(using cbind)

6. Merges this training and test data by row (using rbind) into a single large data frame 
(merged_data)

7. Change the name of the first two columns in merged_data so they are maximally informative
(column 1 = "Subject_Number", column 2 = "Activity")

8. Replace the numbers (1-6) in the "Activity" column of merged_data with their corresponding
activity names (Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying)

9. Extract the columns from merged_data that have the word "mean" and create new data frame 
(mean_columns)

10. Extract the columns from merged_data that have the word "std" and create new data frame
(std_columns)

11. Calculates the mean of all variables that have the word "mean" (using colMeans on 
mean_columns)

12. Calculates the mean of all variables that have the word "std" (using colMeans on 
std_columns)

13. Create a .csv file saving the result of the calculation in 11 ("mean_of_means.csv")

14. Create a .csv file saving the result of the calculation in 12 ("mean_of_stds.csv")

15. Read "mean_of_means.csv" to load this file as a data frame (mean_means)

16. Read "mean_of_stds.csv" to load this file as a data frame (std_means)

17. Get the values of all variables for each subject/activity combination 
(e.g. subject 1, walking upstairs)

18. Get rid of the non-numeric columns in the data frame resulting from step 17

19. Save this data frame as a .csv file and load it as a data frame

20. Transpose this data frame so each column corresponds to one variable

21. Add activity names to the second row of this data frame (e.g. "walking upstairs")

22. Keep only the second row of this data frame

23. Merge all of the data frames created in this way for all variables into one tidy 
data set (using rbind, create the data frame "tidydata")

24. Replace the column names in tidydata with variable names 

25. Save tidydata as a .txt file ("tidydata.txt") using write.table 


A description of each variable follows below, after the reiteration of how the data provided to us in this assignment was originally recorded, manipulated, and organized prior to the manipulations performed by run_analysis.R (taken from README.txt provided with the data): 

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."


The following variables appear in this dataset:

1 tBodyAcc-mean()-X: Mean of the body acceleration signal in the X direction 
2 tBodyAcc-mean()-Y: Mean of the body acceleration signal in the Y direction
3 tBodyAcc-mean()-Z: Mean of the body acceleration signal in the Z direction
4 tBodyAcc-std()-X: Standard deviation of the body acceleration signal in the X direction 
5 tBodyAcc-std()-Y: Standard deviation of the body acceleration signal in the Y direction 
6 tBodyAcc-std()-Z: Standard deviation of the body acceleration signal in the Z direction 
7 tBodyAcc-mad()-X: Median absolute deviation of the body acceleration signal in the X direction
8 tBodyAcc-mad()-Y: Median absolute deviation of the body acceleration signal in the Y direction
9 tBodyAcc-mad()-Z: Median absolute deviation of the body acceleration signal in the Z direction
10 tBodyAcc-max()-X: Largest value in the body acceleration in the X direction array
11 tBodyAcc-max()-Y: Largest value in the body acceleration in the Y direction array
12 tBodyAcc-max()-Z: Largest value in the body acceleration in the Z direction array
13 tBodyAcc-min()-X: Smallest value in the body acceleration in the X direction array
14 tBodyAcc-min()-Y: Smallest value in the body acceleration in the Y direction array
15 tBodyAcc-min()-Z: Smallest value in the body acceleration in the Z direction array
16 tBodyAcc-sma(): Signal magnitude area of the body acceleration array
17 tBodyAcc-energy()-X: Sum of the squares divided by the number of values in the body acceleration array in the X direction
18 tBodyAcc-energy()-Y: Sum of the squares divided by the number of values in the body acceleration array in the Y direction
19 tBodyAcc-energy()-Z: Sum of the squares divided by the number of values in the body acceleration array in the Z direction
20 tBodyAcc-iqr()-X: Interquartile range of the body acceleration array in the X direction 
21 tBodyAcc-iqr()-Y: Interquartile range of the body acceleration array in the Y direction 
22 tBodyAcc-iqr()-Z: Interquartile range of the body acceleration array in the Z direction 
23 tBodyAcc-entropy()-X: Signal entropy of the body acceleration array in the X direction
24 tBodyAcc-entropy()-Y: Signal entropy of the body acceleration array in the Y direction
25 tBodyAcc-entropy()-Z: Signal entropy of the body acceleration array in the Z direction
26 tBodyAcc-arCoeff()-X,1: First autoregression coefficient with Burg order equal to 4 of the body acceleration array in the X direction
27 tBodyAcc-arCoeff()-X,2: Second autoregression coefficient with Burg order equal to 4 of the body acceleration array in the X direction
28 tBodyAcc-arCoeff()-X,3: Third autoregression coefficient with Burg order equal to 4 of the body acceleration array in the X direction
29 tBodyAcc-arCoeff()-X,4: Fourth autoregression coefficient with Burg order equal to 4 of the body acceleration array in the X direction
30 tBodyAcc-arCoeff()-Y,1: First autoregression coefficient with Burg order equal to 4 of the body acceleration array in the Y direction
31 tBodyAcc-arCoeff()-Y,2: Second autoregression coefficient with Burg order equal to 4 of the body acceleration array in the Y direction
32 tBodyAcc-arCoeff()-Y,3: Third autoregression coefficient with Burg order equal to 4 of the body acceleration array in the Y direction
33 tBodyAcc-arCoeff()-Y,4: Fourth autoregression coefficient with Burg order equal to 4 of the body acceleration array in the Y direction
34 tBodyAcc-arCoeff()-Z,1: First autoregression coefficient with Burg order equal to 4 of the body acceleration array in the Z direction
35 tBodyAcc-arCoeff()-Z,2: Second autoregression coefficient with Burg order equal to 4 of the body acceleration array in the Z direction
36 tBodyAcc-arCoeff()-Z,3: Third autoregression coefficient with Burg order equal to 4 of the body acceleration array in the Z direction
37 tBodyAcc-arCoeff()-Z,4: Fourth autoregression coefficient with Burg order equal to 4 of the body acceleration array in the Z direction
38 tBodyAcc-correlation()-X,Y: Correlation coefficient between the X and Y body acceleration arrays 
39 tBodyAcc-correlation()-X,Z: Correlation coefficient between the X and Z body acceleration arrays 
40 tBodyAcc-correlation()-Y,Z: Correlation coefficient between the Y and Z body acceleration arrays 
41 tGravityAcc-mean()-X: Mean of the gravity acceleration signal in the X direction 
42 tGravityAcc-mean()-Y: Mean of the gravity acceleration signal in the Y direction
43 tGravityAcc-mean()-Z: Mean of the gravity acceleration signal in the Z direction
44 tGravityAcc-std()-X: Standard deviation of the gravity acceleration signal in the X direction 
45 tGravityAcc-std()-Y: Standard deviation of the gravity acceleration signal in the Y direction 
46 tGravityAcc-std()-Z: Standard deviation of the gravity acceleration signal in the Z direction 
47 tGravityAcc-mad()-X: Median absolute deviation of the gravity acceleration signal in the X direction
48 tGravityAcc-mad()-Y: Median absolute deviation of the gravity acceleration signal in the Y direction
49 tGravityAcc-mad()-Z: Median absolute deviation of the gravity acceleration signal in the Z direction
50 tGravityAcc-max()-X: Largest value in the gravity acceleration in the X direction array
51 tGravityAcc-max()-Y: Largest value in the gravity acceleration in the Y direction array
52 tGravityAcc-max()-Z: Largest value in the gravity acceleration in the Z direction array
53 tGravityAcc-min()-X: Smallest value in the gravity acceleration in the X direction array
54 tGravityAcc-min()-Y: Smallest value in the gravity acceleration in the Y direction array
55 tGravityAcc-min()-Z: Smallest value in the gravity acceleration in the Z direction array
56 tGravityAcc-sma(): Signal magnitude area of the gravity acceleration array
57 tGravityAcc-energy()-X: Sum of the squares divided by the number of values in the gravity acceleration array in the X direction
58 tGravityAcc-energy()-Y: Sum of the squares divided by the number of values in the gravity acceleration array in the Y direction
59 tGravityAcc-energy()-Z: Sum of the squares divided by the number of values in the gravity acceleration array in the Z direction
60 tGravityAcc-iqr()-X: Interquartile range of the gravity acceleration array in the X direction 
61 tGravityAcc-iqr()-Y: Interquartile range of the gravity acceleration array in the Y direction 
62 tGravityAcc-iqr()-Z: Interquartile range of the gravity acceleration array in the Z direction 
63 tGravityAcc-entropy()-X: Signal entropy of the gravity acceleration array in the X direction
64 tGravityAcc-entropy()-Y: Signal entropy of the gravity acceleration array in the Y direction
65 tGravityAcc-entropy()-Z: Signal entropy of the gravity acceleration array in the Z direction
66 tGravityAcc-arCoeff()-X,1: First autoregression coefficient with Burg order equal to 4 of the gravity acceleration array in the X direction
67 tGravityAcc-arCoeff()-X,2: Second autoregression coefficient with Burg order equal to 4 of the gravity acceleration array in the X direction
68 tGravityAcc-arCoeff()-X,3: Third autoregression coefficient with Burg order equal to 4 of the gravity acceleration array in the X direction
69 tGravityAcc-arCoeff()-X,4: Fourth autoregression coefficient with Burg order equal to 4 of the gravity acceleration array in the X direction
70 tGravityAcc-arCoeff()-Y,1: First autoregression coefficient with Burg order equal to 4 of the gravity acceleration array in the Y direction
71 tGravityAcc-arCoeff()-Y,2: Second autoregression coefficient with Burg order equal to 4 of the gravity acceleration array in the Y direction
72 tGravityAcc-arCoeff()-Y,3: Third autoregression coefficient with Burg order equal to 4 of the gravity acceleration array in the Y direction
73 tGravityAcc-arCoeff()-Y,4: Fourth autoregression coefficient with Burg order equal to 4 of the gravity acceleration array in the Y direction
74 tGravityAcc-arCoeff()-Z,1: First autoregression coefficient with Burg order equal to 4 of the gravity acceleration array in the Z direction
75 tGravityAcc-arCoeff()-Z,2: Second autoregression coefficient with Burg order equal to 4 of the gravity acceleration array in the Z direction
76 tGravityAcc-arCoeff()-Z,3: Third autoregression coefficient with Burg order equal to 4 of the gravity acceleration array in the Z direction
77 tGravityAcc-arCoeff()-Z,4: Fourth autoregression coefficient with Burg order equal to 4 of the gravity acceleration array in the Z direction
78 tGravityAcc-correlation()-X,Y: Correlation coefficient between the X and Y gravity acceleration arrays 
79 tGravityAcc-correlation()-X,Z: Correlation coefficient between the X and Z gravity acceleration arrays 
80 tGravityAcc-correlation()-Y,Z: Correlation coefficient between the Y and Z gravity acceleration arrays 
81 tBodyAccJerk-mean()-X: Mean of the time derivation of the body acceleration signal (Jerk) signal in the X direction 
82 tBodyAccJerk-mean()-Y: Mean of the time derivation of the body acceleration signal (Jerk) signal in the Y direction
83 tBodyAccJerk-mean()-Z: Mean of the time derivation of the body acceleration signal (Jerk) signal in the Z direction
84 tBodyAccJerk-std()-X: Standard deviation of the time derivation of the body acceleration signal (Jerk) signal in the X direction 
85 tBodyAccJerk-std()-Y: Standard deviation of the time derivation of the body acceleration signal (Jerk) signal in the Y direction 
86 tBodyAccJerk-std()-Z: Standard deviation of the time derivation of the body acceleration signal (Jerk) signal in the Z direction 
87 tBodyAccJerk-mad()-X: Median absolute deviation of the time derivation of the body acceleration signal (Jerk) signal in the X direction
88 tBodyAccJerk-mad()-Y: Median absolute deviation of the time derivation of the body acceleration signal (Jerk) signal in the Y direction
89 tBodyAccJerk-mad()-Z: Median absolute deviation of the time derivation of the body acceleration signal (Jerk) signal in the Z direction
90 tBodyAccJerk-max()-X: Largest value in the time derivation of the body acceleration signal (Jerk) in the X direction array
91 tBodyAccJerk-max()-Y: Largest value in the time derivation of the body acceleration signal (Jerk) in the Y direction array
92 tBodyAccJerk-max()-Z: Largest value in the time derivation of the body acceleration signal (Jerk) in the Z direction array
93 tBodyAccJerk-min()-X: Smallest value in the time derivation of the body acceleration signal (Jerk) in the X direction array
94 tBodyAccJerk-min()-Y: Smallest value in the time derivation of the body acceleration signal (Jerk) in the Y direction array
95 tBodyAccJerk-min()-Z: Smallest value in the time derivation of the body acceleration signal (Jerk) in the Z direction array
96 tBodyAccJerk-sma(): Signal magnitude area of the time derivation of the body acceleration signal (Jerk) array
97 tBodyAccJerk-energy()-X: Sum of the squares divided by the number of values in the time derivation of the body acceleration signal (Jerk) array in the X direction
98 tBodyAccJerk-energy()-Y: Sum of the squares divided by the number of values in the time derivation of the body acceleration signal (Jerk) array in the Y direction
99 tBodyAccJerk-energy()-Z: Sum of the squares divided by the number of values in the time derivation of the body acceleration signal (Jerk) array in the Z direction
100 tBodyAccJerk-iqr()-X: Interquartile range of the time derivation of the body acceleration signal (Jerk) array in the X direction 
101 tBodyAccJerk-iqr()-Y: Interquartile range of the time derivation of the body acceleration signal (Jerk) array in the Y direction 
102 tBodyAccJerk-iqr()-Z: Interquartile range of the time derivation of the body acceleration signal (Jerk) array in the Z direction 
103 tBodyAccJerk-entropy()-X: Signal entropy of the time derivation of the body acceleration signal (Jerk) array in the X direction
104 tBodyAccJerk-entropy()-Y: Signal entropy of the time derivation of the body acceleration signal (Jerk) array in the Y direction
105 tBodyAccJerk-entropy()-Z: Signal entropy of the time derivation of the body acceleration signal (Jerk) array in the Z direction
106 tBodyAccJerk-arCoeff()-X,1: First autoregression coefficient with Burg order equal to 4 of the time derivation of the body acceleration signal (Jerk) array in the X direction
107 tBodyAccJerk-arCoeff()-X,2: Second autoregression coefficient with Burg order equal to 4 of the time derivation of the body acceleration signal (Jerk) array in the X direction
108 tBodyAccJerk-arCoeff()-X,3: Third autoregression coefficient with Burg order equal to 4 of the time derivation of the body acceleration signal (Jerk) array in the X direction
109 tBodyAccJerk-arCoeff()-X,4: Fourth autoregression coefficient with Burg order equal to 4 of the time derivation of the body acceleration signal (Jerk) array in the X direction
110 tBodyAccJerk-arCoeff()-Y,1: First autoregression coefficient with Burg order equal to 4 of the time derivation of the body acceleration signal (Jerk) array in the Y direction
111 tBodyAccJerk-arCoeff()-Y,2: Second autoregression coefficient with Burg order equal to 4 of the time derivation of the body acceleration signal (Jerk) array in the Y direction
112 tBodyAccJerk-arCoeff()-Y,3: Third autoregression coefficient with Burg order equal to 4 of the time derivation of the body acceleration signal (Jerk) array in the Y direction
113 tBodyAccJerk-arCoeff()-Y,4: Fourth autoregression coefficient with Burg order equal to 4 of the time derivation of the body acceleration signal (Jerk) array in the Y direction
114 tBodyAccJerk-arCoeff()-Z,1: First autoregression coefficient with Burg order equal to 4 of the time derivation of the body acceleration signal (Jerk) array in the Z direction
115 tBodyAccJerk-arCoeff()-Z,2: Second autoregression coefficient with Burg order equal to 4 of the time derivation of the body acceleration signal (Jerk) array in the Z direction
116 tBodyAccJerk-arCoeff()-Z,3: Third autoregression coefficient with Burg order equal to 4 of the time derivation of the body acceleration signal (Jerk) array in the Z direction
117 tBodyAccJerk-arCoeff()-Z,4: Fourth autoregression coefficient with Burg order equal to 4 of the time derivation of the body acceleration signal (Jerk) array in the Z direction
118 tBodyAccJerk-correlation()-X,Y: Correlation coefficient between the X and Y time derivation of the body acceleration signal (Jerk) arrays 
119 tBodyAccJerk-correlation()-X,Z: Correlation coefficient between the X and Z time derivation of the body acceleration signal (Jerk) arrays 
120 tBodyAccJerk-correlation()-Y,Z: Correlation coefficient between the Y and Z time derivation of the body acceleration signal (Jerk) arrays 
121 tBodyGyro-mean()-X: Mean of the time derivation of the body angular velocity signal (gyro) signal in the X direction 
122 tBodyGyro-mean()-Y: Mean of the time derivation of the body angular velocity signal (gyro) signal in the Y direction
123 tBodyGyro-mean()-Z: Mean of the time derivation of the body angular velocity signal (gyro) signal in the Z direction
124 tBodyGyro-std()-X: Standard deviation of the time derivation of the body angular velocity signal (gyro) signal in the X direction 
125 tBodyGyro-std()-Y: Standard deviation of the time derivation of the body angular velocity signal (gyro) signal in the Y direction 
126 tBodyGyro-std()-Z: Standard deviation of the time derivation of the body angular velocity signal (gyro) signal in the Z direction 
127 tBodyGyro-mad()-X: Median absolute deviation of the time derivation of the body angular velocity signal (gyro) signal in the X direction
128 tBodyGyro-mad()-Y: Median absolute deviation of the time derivation of the body angular velocity signal (gyro) signal in the Y direction
129 tBodyGyro-mad()-Z: Median absolute deviation of the time derivation of the body angular velocity signal (gyro) signal in the Z direction
130 tBodyGyro-max()-X: Largest value in the time derivation of the body angular velocity signal (gyro) in the X direction array
131 tBodyGyro-max()-Y: Largest value in the time derivation of the body angular velocity signal (gyro) in the Y direction array
132 tBodyGyro-max()-Z: Largest value in the time derivation of the body angular velocity signal (gyro) in the Z direction array
133 tBodyGyro-min()-X: Smallest value in the time derivation of the body angular velocity signal (gyro) in the X direction array
134 tBodyGyro-min()-Y: Smallest value in the time derivation of the body angular velocity signal (gyro) in the Y direction array
135 tBodyGyro-min()-Z: Smallest value in the time derivation of the body angular velocity signal (gyro) in the Z direction array
136 tBodyGyro-sma(): Signal magnitude area of the time derivation of the body angular velocity signal (gyro) array
137 tBodyGyro-energy()-X: Sum of the squares divided by the number of values in the time derivation of the body angular velocity signal (gyro) array in the X direction
138 tBodyGyro-energy()-Y: Sum of the squares divided by the number of values in the time derivation of the body angular velocity signal (gyro) array in the Y direction
139 tBodyGyro-energy()-Z: Sum of the squares divided by the number of values in the time derivation of the body angular velocity signal (gyro) array in the Z direction
140 tBodyGyro-iqr()-X: Interquartile range of the time derivation of the body angular velocity signal (gyro) array in the X direction 
141 tBodyGyro-iqr()-Y: Interquartile range of the time derivation of the body angular velocity signal (gyro) array in the Y direction 
142 tBodyGyro-iqr()-Z: Interquartile range of the time derivation of the body angular velocity signal (gyro) array in the Z direction 
143 tBodyGyro-entropy()-X: Signal entropy of the time derivation of the body angular velocity signal (gyro) array in the X direction
144 tBodyGyro-entropy()-Y: Signal entropy of the time derivation of the body angular velocity signal (gyro) array in the Y direction
145 tBodyGyro-entropy()-Z: Signal entropy of the time derivation of the body angular velocity signal (gyro) array in the Z direction
146 tBodyGyro-arCoeff()-X,1: First autoregression coefficient with Burg order equal to 4 of the time derivation of the body angular velocity signal (gyro) array in the X direction
147 tBodyGyro-arCoeff()-X,2: Second autoregression coefficient with Burg order equal to 4 of the time derivation of the body angular velocity signal (gyro) array in the X direction
148 tBodyGyro-arCoeff()-X,3: Third autoregression coefficient with Burg order equal to 4 of the time derivation of the body angular velocity signal (gyro) array in the X direction
149 tBodyGyro-arCoeff()-X,4: Fourth autoregression coefficient with Burg order equal to 4 of the time derivation of the body angular velocity signal (gyro) array in the X direction
150 tBodyGyro-arCoeff()-Y,1: First autoregression coefficient with Burg order equal to 4 of the time derivation of the body angular velocity signal (gyro) array in the Y direction
151 tBodyGyro-arCoeff()-Y,2: Second autoregression coefficient with Burg order equal to 4 of the time derivation of the body angular velocity signal (gyro) array in the Y direction
152 tBodyGyro-arCoeff()-Y,3: Third autoregression coefficient with Burg order equal to 4 of the time derivation of the body angular velocity signal (gyro) array in the Y direction
153 tBodyGyro-arCoeff()-Y,4: Fourth autoregression coefficient with Burg order equal to 4 of the time derivation of the body angular velocity signal (gyro) array in the Y direction
154 tBodyGyro-arCoeff()-Z,1: First autoregression coefficient with Burg order equal to 4 of the time derivation of the body angular velocity signal (gyro) array in the Z direction
155 tBodyGyro-arCoeff()-Z,2: Second autoregression coefficient with Burg order equal to 4 of the time derivation of the body angular velocity signal (gyro) array in the Z direction
156 tBodyGyro-arCoeff()-Z,3: Third autoregression coefficient with Burg order equal to 4 of the time derivation of the body angular velocity signal (gyro) array in the Z direction
157 tBodyGyro-arCoeff()-Z,4: Fourth autoregression coefficient with Burg order equal to 4 of the time derivation of the body angular velocity signal (gyro) array in the Z direction
158 tBodyGyro-correlation()-X,Y: Correlation coefficient between the X and Y time derivation of the body angular velocity signal (gyro) arrays 
159 tBodyGyro-correlation()-X,Z: Correlation coefficient between the X and Z time derivation of the body angular velocity signal (gyro) arrays 
160 tBodyGyro-correlation()-Y,Z: Correlation coefficient between the Y and Z time derivation of the body angular velocity signal (gyro) arrays 
161 tBodyGyroJerk-mean()-X: Mean of the fast fourier transform (FFT) of the body angular velocity signal (gyro) signal in the X direction 
162 tBodyGyroJerk-mean()-Y: Mean of the fast fourier transform (FFT) of the body angular velocity signal (gyro) signal in the Y direction
163 tBodyGyroJerk-mean()-Z: Mean of the fast fourier transform (FFT) of the body angular velocity signal (gyro) signal in the Z direction
164 tBodyGyroJerk-std()-X: Standard deviation of the fast fourier transform (FFT) of the body angular velocity signal (gyro) signal in the X direction 
165 tBodyGyroJerk-std()-Y: Standard deviation of the fast fourier transform (FFT) of the body angular velocity signal (gyro) signal in the Y direction 
166 tBodyGyroJerk-std()-Z: Standard deviation of the fast fourier transform (FFT) of the body angular velocity signal (gyro) signal in the Z direction 
167 tBodyGyroJerk-mad()-X: Median absolute deviation of the fast fourier transform (FFT) of the body angular velocity signal (gyro) signal in the X direction
168 tBodyGyroJerk-mad()-Y: Median absolute deviation of the fast fourier transform (FFT) of the body angular velocity signal (gyro) signal in the Y direction
169 tBodyGyroJerk-mad()-Z: Median absolute deviation of the fast fourier transform (FFT) of the body angular velocity signal (gyro) signal in the Z direction
170 tBodyGyroJerk-max()-X: Largest value in the fast fourier transform (FFT) of the body angular velocity signal (gyro) in the X direction array
171 tBodyGyroJerk-max()-Y: Largest value in the fast fourier transform (FFT) of the body angular velocity signal (gyro) in the Y direction array
172 tBodyGyroJerk-max()-Z: Largest value in the fast fourier transform (FFT) of the body angular velocity signal (gyro) in the Z direction array
173 tBodyGyroJerk-min()-X: Smallest value in the fast fourier transform (FFT) of the body angular velocity signal (gyro) in the X direction array
174 tBodyGyroJerk-min()-Y: Smallest value in the fast fourier transform (FFT) of the body angular velocity signal (gyro) in the Y direction array
175 tBodyGyroJerk-min()-Z: Smallest value in the fast fourier transform (FFT) of the body angular velocity signal (gyro) in the Z direction array
176 tBodyGyroJerk-sma(): Signal magnitude area of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array
177 tBodyGyroJerk-energy()-X: Sum of the squares divided by the number of values in the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the X direction
178 tBodyGyroJerk-energy()-Y: Sum of the squares divided by the number of values in the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the Y direction
179 tBodyGyroJerk-energy()-Z: Sum of the squares divided by the number of values in the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the Z direction
180 tBodyGyroJerk-iqr()-X: Interquartile range of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the X direction 
181 tBodyGyroJerk-iqr()-Y: Interquartile range of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the Y direction 
182 tBodyGyroJerk-iqr()-Z: Interquartile range of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the Z direction 
183 tBodyGyroJerk-entropy()-X: Signal entropy of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the X direction
184 tBodyGyroJerk-entropy()-Y: Signal entropy of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the Y direction
185 tBodyGyroJerk-entropy()-Z: Signal entropy of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the Z direction
186 tBodyGyroJerk-arCoeff()-X,1: First autoregression coefficient with Burg order equal to 4 of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the X direction
187 tBodyGyroJerk-arCoeff()-X,2: Second autoregression coefficient with Burg order equal to 4 of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the X direction
188 tBodyGyroJerk-arCoeff()-X,3: Third autoregression coefficient with Burg order equal to 4 of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the X direction
189 tBodyGyroJerk-arCoeff()-X,4: Fourth autoregression coefficient with Burg order equal to 4 of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the X direction
190 tBodyGyroJerk-arCoeff()-Y,1: First autoregression coefficient with Burg order equal to 4 of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the Y direction
191 tBodyGyroJerk-arCoeff()-Y,2: Second autoregression coefficient with Burg order equal to 4 of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the Y direction
192 tBodyGyroJerk-arCoeff()-Y,3: Third autoregression coefficient with Burg order equal to 4 of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the Y direction
193 tBodyGyroJerk-arCoeff()-Y,4: Fourth autoregression coefficient with Burg order equal to 4 of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the Y direction
194 tBodyGyroJerk-arCoeff()-Z,1: First autoregression coefficient with Burg order equal to 4 of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the Z direction
195 tBodyGyroJerk-arCoeff()-Z,2: Second autoregression coefficient with Burg order equal to 4 of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the Z direction
196 tBodyGyroJerk-arCoeff()-Z,3: Third autoregression coefficient with Burg order equal to 4 of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the Z direction
197 tBodyGyroJerk-arCoeff()-Z,4: Fourth autoregression coefficient with Burg order equal to 4 of the fast fourier transform (FFT) of the body angular velocity signal (gyro) array in the Z direction
198 tBodyGyroJerk-correlation()-X,Y: Correlation coefficient between the X and Y fast fourier transform (FFT) of the body angular velocity signal (gyro) arrays 
199 tBodyGyroJerk-correlation()-X,Z: Correlation coefficient between the X and Z fast fourier transform (FFT) of the body angular velocity signal (gyro) arrays 
200 tBodyGyroJerk-correlation()-Y,Z: Correlation coefficient between the Y and Z fast fourier transform (FFT) of the body angular velocity signal (gyro) arrays 
201 tBodyAccMag-mean(): Mean of the signal magnitude calculated using the Euclidean norm of the body angular velocity signal (gyro) signal
202 tBodyAccMag-std(): Standard deviation of the signal magnitude calculated using the Euclidean norm of the body angular velocity signal (gyro) signal
203 tBodyAccMag-mad(): Median absolute deviation of the signal magnitude calculated using the Euclidean norm of the body angular velocity signal (gyro) signal
204 tBodyAccMag-max(): Largest value in the signal magnitude calculated using the Euclidean norm of the body angular velocity signal (gyro)
205 tBodyAccMag-min(): Smallest value in the signal magnitude calculated using the Euclidean norm of the body angular velocity signal (gyro)
206 tBodyAccMag-sma(): Signal magnitude area of the signal magnitude calculated using the Euclidean norm of the body angular velocity signal (gyro) array
207 tBodyAccMag-energy(): Sum of the squares divided by the number of values in the signal magnitude calculated using the Euclidean norm of the body angular velocity signal (gyro) array
208 tBodyAccMag-iqr(): Interquartile range of the signal magnitude calculated using the Euclidean norm of the body angular velocity signal (gyro) array
209 tBodyAccMag-entropy(): Signal entropy of the signal magnitude calculated using the Euclidean norm of the body angular velocity signal (gyro) array
210 tBodyAccMag-arCoeff()1: First autoregression coefficient with Burg order equal to 4 of the signal magnitude calculated using the Euclidean norm of the body angular velocity signal (gyro) array in the X direction
211 tBodyAccMag-arCoeff()2: Second autoregression coefficient with Burg order equal to 4 of the signal magnitude calculated using the Euclidean norm of the body angular velocity signal (gyro) array in the X direction
212 tBodyAccMag-arCoeff()3: Third autoregression coefficient with Burg order equal to 4 of the signal magnitude calculated using the Euclidean norm of the body angular velocity signal (gyro) array in the X direction
213 tBodyAccMag-arCoeff()4: Fourth autoregression coefficient with Burg order equal to 4 of the signal magnitude calculated using the Euclidean norm of the body angular velocity signal (gyro) array in the X direction
214 tGravityAccMag-mean(): Mean of the signal magnitude calculated using the Euclidean norm of the gravity acceleration signal signal
215 tGravityAccMag-std(): Standard deviation of the signal magnitude calculated using the Euclidean norm of the gravity acceleration signal signal
216 tGravityAccMag-mad(): Median absolute deviation of the signal magnitude calculated using the Euclidean norm of the gravity acceleration signal signal
217 tGravityAccMag-max(): Largest value in the signal magnitude calculated using the Euclidean norm of the gravity acceleration signal
218 tGravityAccMag-min(): Smallest value in the signal magnitude calculated using the Euclidean norm of the gravity acceleration signal
219 tGravityAccMag-sma(): Signal magnitude area of the signal magnitude calculated using the Euclidean norm of the gravity acceleration signal array
220 tGravityAccMag-energy(): Sum of the squares divided by the number of values in the signal magnitude calculated using the Euclidean norm of the gravity acceleration signal array
221 tGravityAccMag-iqr(): Interquartile range of the signal magnitude calculated using the Euclidean norm of the gravity acceleration signal array
222 tGravityAccMag-entropy(): Signal entropy of the signal magnitude calculated using the Euclidean norm of the gravity acceleration signal array
223 tGravityAccMag-arCoeff()1: First autoregression coefficient with Burg order equal to 4 of the signal magnitude calculated using the Euclidean norm of the gravity acceleration signal array in the X direction
224 tGravityAccMag-arCoeff()2: Second autoregression coefficient with Burg order equal to 4 of the signal magnitude calculated using the Euclidean norm of the gravity acceleration signal array in the X direction
225 tGravityAccMag-arCoeff()3: Third autoregression coefficient with Burg order equal to 4 of the signal magnitude calculated using the Euclidean norm of the gravity acceleration signal array in the X direction
226 tGravityAccMag-arCoeff()4: Fourth autoregression coefficient with Burg order equal to 4 of the signal magnitude calculated using the Euclidean norm of the gravity acceleration signal array in the X direction
227 tBodyAccJerkMag-mean(): Mean of the derivation of the body acceleration (Jerk) signal
228 tBodyAccJerkMag-std(): Standard deviation of the derivation of the body acceleration (Jerk) signal
229 tBodyAccJerkMag-mad(): Median absolute deviation of the derivation of the body acceleration (Jerk) signal
230 tBodyAccJerkMag-max(): Largest value in the derivation of the body acceleration (Jerk)
231 tBodyAccJerkMag-min(): Smallest value in the derivation of the body acceleration (Jerk)
232 tBodyAccJerkMag-sma(): Signal magnitude area of the derivation of the body acceleration (Jerk) array
233 tBodyAccJerkMag-energy(): Sum of the squares divided by the number of values in the derivation of the body acceleration (Jerk) array
234 tBodyAccJerkMag-iqr(): Interquartile range of the derivation of the body acceleration (Jerk) array
235 tBodyAccJerkMag-entropy(): Signal entropy of the derivation of the body acceleration (Jerk) array
236 tBodyAccJerkMag-arCoeff()1: First autoregression coefficient with Burg order equal to 4 of the derivation of the body acceleration (Jerk) array in the X direction
237 tBodyAccJerkMag-arCoeff()2: Second autoregression coefficient with Burg order equal to 4 of the derivation of the body acceleration (Jerk) array in the X direction
238 tBodyAccJerkMag-arCoeff()3: Third autoregression coefficient with Burg order equal to 4 of the derivation of the body acceleration (Jerk) array in the X direction
239 tBodyAccJerkMag-arCoeff()4: Fourth autoregression coefficient with Burg order equal to 4 of the derivation of the body acceleration (Jerk) array in the X direction
240 tBodyGyroMag-mean(): Mean of the derivation of the angular velocity (gyro) signal
241 tBodyGyroMag-std(): Standard deviation of the derivation of the angular velocity (gyro) signal
242 tBodyGyroMag-mad(): Median absolute deviation of the derivation of the angular velocity (gyro) signal
243 tBodyGyroMag-max(): Largest value in the derivation of the angular velocity (gyro)
244 tBodyGyroMag-min(): Smallest value in the derivation of the angular velocity (gyro)
245 tBodyGyroMag-sma(): Signal magnitude area of the derivation of the angular velocity (gyro) array
246 tBodyGyroMag-energy(): Sum of the squares divided by the number of values in the derivation of the angular velocity (gyro) array
247 tBodyGyroMag-iqr(): Interquartile range of the derivation of the angular velocity (gyro) array
248 tBodyGyroMag-entropy(): Signal entropy of the derivation of the angular velocity (gyro) array
249 tBodyGyroMag-arCoeff()1: First autoregression coefficient with Burg order equal to 4 of the derivation of the angular velocity (gyro) array in the X direction
250 tBodyGyroMag-arCoeff()2: Second autoregression coefficient with Burg order equal to 4 of the derivation of the angular velocity (gyro) array in the X direction
251 tBodyGyroMag-arCoeff()3: Third autoregression coefficient with Burg order equal to 4 of the derivation of the angular velocity (gyro) array in the X direction
252 tBodyGyroMag-arCoeff()4: Fourth autoregression coefficient with Burg order equal to 4 of the derivation of the angular velocity (gyro) array in the X direction

253 tBodyGyroJerkMag-mean(): Mean of the derivation of the angular velocity (gyro) signal magnitude
254 tBodyGyroJerkMag-std(): Standard deviation of the derivation of the angular velocity (gyro) signal magnitude
255 tBodyGyroJerkMag-mad(): Median absolute deviation of the derivation of the angular velocity (gyro) signal magnitude
256 tBodyGyroJerkMag-max(): Largest value in the derivation of the angular velocity (gyro)
257 tBodyGyroJerkMag-min(): Smallest value in the derivation of the angular velocity (gyro)
258 tBodyGyroJerkMag-sma(): signal magnitude magnitude area of the derivation of the angular velocity (gyro) array
259 tBodyGyroJerkMag-energy(): Sum of the squares divided by the number of values in the derivation of the angular velocity (gyro) array
260 tBodyGyroJerkMag-iqr(): Interquartile range of the derivation of the angular velocity (gyro) array
261 tBodyGyroJerkMag-entropy(): signal magnitude entropy of the derivation of the angular velocity (gyro) array
262 tBodyGyroJerkMag-arCoeff()1: First autoregression coefficient with Burg order equal to 4 of the derivation of the angular velocity (gyro) array in the X direction
263 tBodyGyroJerkMag-arCoeff()2: Second autoregression coefficient with Burg order equal to 4 of the derivation of the angular velocity (gyro) array in the X direction
264 tBodyGyroJerkMag-arCoeff()3: Third autoregression coefficient with Burg order equal to 4 of the derivation of the angular velocity (gyro) array in the X direction
265 tBodyGyroJerkMag-arCoeff()4: Fourth autoregression coefficient with Burg order equal to 4 of the derivation of the angular velocity (gyro) array in the X direction
266 fBodyAcc-mean()-X: Mean of the fast fourier transform (FFT) of the bodyacceleration signal in the X direction 
267 fBodyAcc-mean()-Y: Mean of the fast fourier transform (FFT) of the bodyacceleration signal in the Y direction
268 fBodyAcc-mean()-Z: Mean of the fast fourier transform (FFT) of the bodyacceleration signal in the Z direction
269 fBodyAcc-std()-X: Standard deviation of the fast fourier transform (FFT) of the bodyacceleration signal in the X direction 
270 fBodyAcc-std()-Y: Standard deviation of the fast fourier transform (FFT) of the bodyacceleration signal in the Y direction 
271 fBodyAcc-std()-Z: Standard deviation of the fast fourier transform (FFT) of the bodyacceleration signal in the Z direction 
272 fBodyAcc-mad()-X: Median absolute deviation of the fast fourier transform (FFT) of the bodyacceleration signal in the X direction
273 fBodyAcc-mad()-Y: Median absolute deviation of the fast fourier transform (FFT) of the bodyacceleration signal in the Y direction
274 fBodyAcc-mad()-Z: Median absolute deviation of the fast fourier transform (FFT) of the bodyacceleration signal in the Z direction
275 fBodyAcc-max()-X: Largest value in the fast fourier transform (FFT) of the bodyacceleration in the X direction array
276 fBodyAcc-max()-Y: Largest value in the fast fourier transform (FFT) of the bodyacceleration in the Y direction array
277 fBodyAcc-max()-Z: Largest value in the fast fourier transform (FFT) of the bodyacceleration in the Z direction array
278 fBodyAcc-min()-X: Smallest value in the fast fourier transform (FFT) of the bodyacceleration in the X direction array
279 fBodyAcc-min()-Y: Smallest value in the fast fourier transform (FFT) of the bodyacceleration in the Y direction array
280 fBodyAcc-min()-Z: Smallest value in the fast fourier transform (FFT) of the bodyacceleration in the Z direction array
281 fBodyAcc-sma(): Signal magnitude area of the fast fourier transform (FFT) of the bodyacceleration array
282 fBodyAcc-energy()-X: Sum of the squares divided by the number of values in the fast fourier transform (FFT) of the bodyacceleration array in the X direction
283 fBodyAcc-energy()-Y: Sum of the squares divided by the number of values in the fast fourier transform (FFT) of the bodyacceleration array in the Y direction
284 fBodyAcc-energy()-Z: Sum of the squares divided by the number of values in the fast fourier transform (FFT) of the bodyacceleration array in the Z direction
285 fBodyAcc-iqr()-X: Interquartile range of the fast fourier transform (FFT) of the bodyacceleration array in the X direction 
286 fBodyAcc-iqr()-Y: Interquartile range of the fast fourier transform (FFT) of the bodyacceleration array in the Y direction 
287 fBodyAcc-iqr()-Z: Interquartile range of the fast fourier transform (FFT) of the bodyacceleration array in the Z direction 
288 fBodyAcc-entropy()-X: Signal entropy of the fast fourier transform (FFT) of the bodyacceleration array in the X direction
289 fBodyAcc-entropy()-Y: Signal entropy of the fast fourier transform (FFT) of the bodyacceleration array in the Y direction
290 fBodyAcc-entropy()-Z: Signal entropy of the fast fourier transform (FFT) of the bodyacceleration array in the Z direction
291 fBodyAcc-maxInds-X: Index of the frequency component with the largest magnitude in the FFT of the body acceleration array in the X direction 
292 fBodyAcc-maxInds-Y: Index of the frequency component with the largest magnitude in the FFT of the body acceleration array in the Y direction 
293 fBodyAcc-maxInds-Z: Index of the frequency component with the largest magnitude in the FFT of the body acceleration array in the Z direction 
294 fBodyAcc-meanFreq()-X: Weighted average of the frequency components in the FFT of the body acceleration array in the X direction 
295 fBodyAcc-meanFreq()-Y: Weighted average of the frequency components in the FFT of the body acceleration array in the Y direction 
296 fBodyAcc-meanFreq()-Z: Weighted average of the frequency components in the FFT of the body acceleration array in the Z direction 
297 fBodyAcc-skewness()-X: Skewness of the frequency domain signal of the FFT of the body acceleration array in the X direction 
298 fBodyAcc-kurtosis()-X: Kurtosis of the frequency domain signal of the FFT of the body acceleration array in the X direction 
299 fBodyAcc-skewness()-Y: Skewness of the frequency domain signal of the FFT of the body acceleration array in the Y direction 
300 fBodyAcc-kurtosis()-Y: Kurtosis of the frequency domain signal of the FFT of the body acceleration array in the Y direction 
301 fBodyAcc-skewness()-Z: Skewness of the frequency domain signal of the FFT of the body acceleration array in the Z direction 
302 fBodyAcc-kurtosis()-Z: Kurtosis of the frequency domain signal of the FFT of the body acceleration array in the Z direction 
303 fBodyAcc-bandsEnergy()-1,8: Energy of the FFT of the body acceleration array in the 1-8 bin window 
304 fBodyAcc-bandsEnergy()-9,16: Energy of the FFT of the body acceleration array in the 9-16 bin window 
305 fBodyAcc-bandsEnergy()-17,24: Energy of the FFT of the body acceleration array in the 17-24 bin window 
306 fBodyAcc-bandsEnergy()-25,32: Energy of the FFT of the body acceleration array in the 25-32 bin window 
307 fBodyAcc-bandsEnergy()-33,40: Energy of the FFT of the body acceleration array in the 33-40 bin window 
308 fBodyAcc-bandsEnergy()-41,48: Energy of the FFT of the body acceleration array in the 41-48 bin window 
309 fBodyAcc-bandsEnergy()-49,56: Energy of the FFT of the body acceleration array in the 49-56 bin window 
310 fBodyAcc-bandsEnergy()-57,64: Energy of the FFT of the body acceleration array in the 57-64 bin window 
311 fBodyAcc-bandsEnergy()-1,16: Energy of the FFT of the body acceleration array in the 1-16 bin window 
312 fBodyAcc-bandsEnergy()-17,32: Energy of the FFT of the body acceleration array in the 17-32 bin window 
313 fBodyAcc-bandsEnergy()-33,48: Energy of the FFT of the body acceleration array in the 33-48 bin window 
314 fBodyAcc-bandsEnergy()-49,64: Energy of the FFT of the body acceleration array in the 49-64 bin window 
315 fBodyAcc-bandsEnergy()-1,24: Energy of the FFT of the body acceleration array in the 1-24 bin window 
316 fBodyAcc-bandsEnergy()-25,48: Energy of the FFT of the body acceleration array in the 25-48 bin window 
317 fBodyAcc-bandsEnergy()-1,8: Energy of the FFT of the body acceleration array in the 1-8 bin window 
318 fBodyAcc-bandsEnergy()-9,16: Energy of the FFT of the body acceleration array in the 9-16 bin window 
319 fBodyAcc-bandsEnergy()-17,24: Energy of the FFT of the body acceleration array in the 17-24 bin window 
320 fBodyAcc-bandsEnergy()-25,32: Energy of the FFT of the body acceleration array in the 25-32 bin window 
321 fBodyAcc-bandsEnergy()-33,40: Energy of the FFT of the body acceleration array in the 33-40 bin window 
322 fBodyAcc-bandsEnergy()-41,48: Energy of the FFT of the body acceleration array in the 41-48 bin window 
323 fBodyAcc-bandsEnergy()-49,56: Energy of the FFT of the body acceleration array in the 49-56 bin window 
324 fBodyAcc-bandsEnergy()-57,64: Energy of the FFT of the body acceleration array in the 57-64 bin window 
325 fBodyAcc-bandsEnergy()-1,16: Energy of the FFT of the body acceleration array in the 1-16 bin window  
326 fBodyAcc-bandsEnergy()-17,32: Energy of the FFT of the body acceleration array in the 17-32 bin window 
327 fBodyAcc-bandsEnergy()-33,48: Energy of the FFT of the body acceleration array in the 33-48 bin window 
328 fBodyAcc-bandsEnergy()-49,64: Energy of the FFT of the body acceleration array in the 49-64 bin window 
329 fBodyAcc-bandsEnergy()-1,24: Energy of the FFT of the body acceleration array in the 1-24 bin window 
330 fBodyAcc-bandsEnergy()-25,48: Energy of the FFT of the body acceleration array in the 25-48 bin window 
331 fBodyAcc-bandsEnergy()-1,8: Energy of the FFT of the body acceleration array in the 1-8 bin window 
332 fBodyAcc-bandsEnergy()-9,16: Energy of the FFT of the body acceleration array in the 9-16 bin window 
333 fBodyAcc-bandsEnergy()-17,24: Energy of the FFT of the body acceleration array in the 17-24 bin window 
334 fBodyAcc-bandsEnergy()-25,32: Energy of the FFT of the body acceleration array in the 25-32 bin window 
335 fBodyAcc-bandsEnergy()-33,40: Energy of the FFT of the body acceleration array in the 33-40 bin window 
336 fBodyAcc-bandsEnergy()-41,48: Energy of the FFT of the body acceleration array in the 41-48 bin window 
337 fBodyAcc-bandsEnergy()-49,56: Energy of the FFT of the body acceleration array in the 49-56 bin window 
338 fBodyAcc-bandsEnergy()-57,64: Energy of the FFT of the body acceleration array in the 57-64 bin window 
339 fBodyAcc-bandsEnergy()-1,16: Energy of the FFT of the body acceleration array in the 1-16 bin window 
340 fBodyAcc-bandsEnergy()-17,32: Energy of the FFT of the body acceleration array in the 17-32 bin window 
341 fBodyAcc-bandsEnergy()-33,48: Energy of the FFT of the body acceleration array in the 33-48 bin window 
342 fBodyAcc-bandsEnergy()-49,64: Energy of the FFT of the body acceleration array in the 49-64 bin window 
343 fBodyAcc-bandsEnergy()-1,24: Energy of the FFT of the body acceleration array in the 1-24 bin window 
344 fBodyAcc-bandsEnergy()-25,48: Energy of the FFT of the body acceleration array in the 25-48 bin window 
345 fBodyAccJerk-maxInds-X: Index of the frequency component with the largest magnitude in the FFT of the derivation of the body  acceleration array in the X direction 
346 fBodyAccJerk-maxInds-Y: Index of the frequency component with the largest magnitude in the FFT of the derivation of the body  acceleration array in the Y direction 
347 fBodyAccJerk-maxInds-Z: Index of the frequency component with the largest magnitude in the FFT of the derivation of the body  acceleration array in the Z direction 
348 fBodyAccJerk-meanFreq()-X: Weighted average of the frequency components in the FFT of the derivation of the body  acceleration array in the X direction 
349 fBodyAccJerk-meanFreq()-Y: Weighted average of the frequency components in the FFT of the derivation of the body  acceleration array in the Y direction 
350 fBodyAccJerk-meanFreq()-Z: Weighted average of the frequency components in the FFT of the derivation of the body  acceleration array in the Z direction 
351 fBodyAccJerk-skewness()-X: Skewness of the frequency domain signal of the FFT of the derivation of the body  acceleration array in the X direction 
352 fBodyAccJerk-kurtosis()-X: Kurtosis of the frequency domain signal of the FFT of the derivation of the body  acceleration array in the X direction 
353 fBodyAccJerk-skewness()-Y: Skewness of the frequency domain signal of the FFT of the derivation of the body  acceleration array in the Y direction 
354 fBodyAccJerk-kurtosis()-Y: Kurtosis of the frequency domain signal of the FFT of the derivation of the body  acceleration array in the Y direction 
355 fBodyAccJerk-skewness()-Z: Skewness of the frequency domain signal of the FFT of the derivation of the body  acceleration array in the Z direction 
356 fBodyAccJerk-kurtosis()-Z: Kurtosis of the frequency domain signal of the FFT of the derivation of the body  acceleration array in the Z direction 
357 fBodyAccJerk-bandsEnergy()-1,8: Energy of the FFT of the derivation of the body  acceleration array in the 1-8 bin window 
358 fBodyAccJerk-bandsEnergy()-9,16: Energy of the FFT of the derivation of the body  acceleration array in the 9-16 bin window 
359 fBodyAccJerk-bandsEnergy()-17,24: Energy of the FFT of the derivation of the body  acceleration array in the 17-24 bin window 
360 fBodyAccJerk-bandsEnergy()-25,32: Energy of the FFT of the derivation of the body  acceleration array in the 25-32 bin window 
361 fBodyAccJerk-bandsEnergy()-33,40: Energy of the FFT of the derivation of the body  acceleration array in the 33-40 bin window 
362 fBodyAccJerk-bandsEnergy()-41,48: Energy of the FFT of the derivation of the body  acceleration array in the 41-48 bin window 
363 fBodyAccJerk-bandsEnergy()-49,56: Energy of the FFT of the derivation of the body  acceleration array in the 49-56 bin window 
364 fBodyAccJerk-bandsEnergy()-57,64: Energy of the FFT of the derivation of the body  acceleration array in the 57-64 bin window 
365 fBodyAccJerk-bandsEnergy()-1,16: Energy of the FFT of the derivation of the body  acceleration array in the 1-16 bin window 
366 fBodyAccJerk-bandsEnergy()-17,32: Energy of the FFT of the derivation of the body  acceleration array in the 17-32 bin window 
367 fBodyAccJerk-bandsEnergy()-33,48: Energy of the FFT of the derivation of the body  acceleration array in the 33-48 bin window 
368 fBodyAccJerk-bandsEnergy()-49,64: Energy of the FFT of the derivation of the body  acceleration array in the 49-64 bin window 
369 fBodyAccJerk-bandsEnergy()-1,24: Energy of the FFT of the derivation of the body  acceleration array in the 1-24 bin window 
370 fBodyAccJerk-bandsEnergy()-25,48: Energy of the FFT of the derivation of the body  acceleration array in the 25-48 bin window 
371 fBodyAccJerk-bandsEnergy()-1,8: Energy of the FFT of the derivation of the body  acceleration array in the 1-8 bin window 
372 fBodyAccJerk-bandsEnergy()-9,16: Energy of the FFT of the derivation of the body  acceleration array in the 9-16 bin window 
373 fBodyAccJerk-bandsEnergy()-17,24: Energy of the FFT of the derivation of the body  acceleration array in the 17-24 bin window 
374 fBodyAccJerk-bandsEnergy()-25,32: Energy of the FFT of the derivation of the body  acceleration array in the 25-32 bin window 
375 fBodyAccJerk-bandsEnergy()-33,40: Energy of the FFT of the derivation of the body  acceleration array in the 33-40 bin window 
376 fBodyAccJerk-bandsEnergy()-41,48: Energy of the FFT of the derivation of the body  acceleration array in the 41-48 bin window 
377 fBodyAccJerk-bandsEnergy()-49,56: Energy of the FFT of the derivation of the body  acceleration array in the 49-56 bin window 
378 fBodyAccJerk-bandsEnergy()-57,64: Energy of the FFT of the derivation of the body  acceleration array in the 57-64 bin window 
379 fBodyAccJerk-bandsEnergy()-1,16: Energy of the FFT of the derivation of the body  acceleration array in the 1-16 bin window  
380 fBodyAccJerk-bandsEnergy()-17,32: Energy of the FFT of the derivation of the body  acceleration array in the 17-32 bin window 
381 fBodyAccJerk-bandsEnergy()-33,48: Energy of the FFT of the derivation of the body  acceleration array in the 33-48 bin window 
382 fBodyAccJerk-bandsEnergy()-49,64: Energy of the FFT of the derivation of the body  acceleration array in the 49-64 bin window 
383 fBodyAccJerk-bandsEnergy()-1,24: Energy of the FFT of the derivation of the body  acceleration array in the 1-24 bin window 
384 fBodyAccJerk-bandsEnergy()-25,48: Energy of the FFT of the derivation of the body  acceleration array in the 25-48 bin window 
385 fBodyAccJerk-bandsEnergy()-1,8: Energy of the FFT of the derivation of the body  acceleration array in the 1-8 bin window 
386 fBodyAccJerk-bandsEnergy()-9,16: Energy of the FFT of the derivation of the body  acceleration array in the 9-16 bin window 
387 fBodyAccJerk-bandsEnergy()-17,24: Energy of the FFT of the derivation of the body  acceleration array in the 17-24 bin window 
388 fBodyAccJerk-bandsEnergy()-25,32: Energy of the FFT of the derivation of the body  acceleration array in the 25-32 bin window 
389 fBodyAccJerk-bandsEnergy()-33,40: Energy of the FFT of the derivation of the body  acceleration array in the 33-40 bin window 
390 fBodyAccJerk-bandsEnergy()-41,48: Energy of the FFT of the derivation of the body  acceleration array in the 41-48 bin window 
391 fBodyAccJerk-bandsEnergy()-49,56: Energy of the FFT of the derivation of the body  acceleration array in the 49-56 bin window 
392 fBodyAccJerk-bandsEnergy()-57,64: Energy of the FFT of the derivation of the body  acceleration array in the 57-64 bin window 
393 fBodyAccJerk-bandsEnergy()-1,16: Energy of the FFT of the derivation of the body  acceleration array in the 1-16 bin window 
394 fBodyAccJerk-bandsEnergy()-17,32: Energy of the FFT of the derivation of the body  acceleration array in the 17-32 bin window 
395 fBodyAccJerk-bandsEnergy()-33,48: Energy of the FFT of the derivation of the body  acceleration array in the 33-48 bin window 
396 fBodyAccJerk-bandsEnergy()-49,64: Energy of the FFT of the derivation of the body  acceleration array in the 49-64 bin window 
397 fBodyAccJerk-bandsEnergy()-1,24: Energy of the FFT of the derivation of the body  acceleration array in the 1-24 bin window 
398 fBodyAccJerk-bandsEnergy()-25,48: Energy of the FFT of the derivation of the body  acceleration array in the 25-48 bin window 
399 fBodyAccJerk-bandsEnergy()-25,32: Energy of the FFT of the derivation of the body  acceleration array in the 25-32 bin window 
400 fBodyAccJerk-bandsEnergy()-33,40: Energy of the FFT of the derivation of the body  acceleration array in the 33-40 bin window 
401 fBodyAccJerk-bandsEnergy()-41,48: Energy of the FFT of the derivation of the body  acceleration array in the 41-48 bin window 
402 fBodyAccJerk-bandsEnergy()-49,56: Energy of the FFT of the derivation of the body  acceleration array in the 49-56 bin window 
403 fBodyAccJerk-bandsEnergy()-57,64: Energy of the FFT of the derivation of the body  acceleration array in the 57-64 bin window 
404 fBodyAccJerk-bandsEnergy()-1,16: Energy of the FFT of the derivation of the body  acceleration array in the 1-16 bin window 
405 fBodyAccJerk-bandsEnergy()-17,32: Energy of the FFT of the derivation of the body  acceleration array in the 17-32 bin window 
406 fBodyAccJerk-bandsEnergy()-33,48: Energy of the FFT of the derivation of the body  acceleration array in the 33-48 bin window 
407 fBodyAccJerk-bandsEnergy()-49,64: Energy of the FFT of the derivation of the body  acceleration array in the 49-64 bin window 
408 fBodyAccJerk-bandsEnergy()-1,24: Energy of the FFT of the derivation of the body  acceleration array in the 1-24 bin window 
409 fBodyAccJerk-bandsEnergy()-25,48: Energy of the FFT of the derivation of the body  acceleration array in the 25-48 bin window 
410 fBodyAccJerk-bandsEnergy()-1,8: Energy of the FFT of the derivation of the body  acceleration array in the 1-8 bin window 
411 fBodyAccJerk-bandsEnergy()-9,16: Energy of the FFT of the derivation of the body  acceleration array in the 9-16 bin window 
412 fBodyAccJerk-bandsEnergy()-17,24: Energy of the FFT of the derivation of the body  acceleration array in the 17-24 bin window 
413 fBodyAccJerk-bandsEnergy()-25,32: Energy of the FFT of the derivation of the body  acceleration array in the 25-32 bin window 
414 fBodyAccJerk-bandsEnergy()-33,40: Energy of the FFT of the derivation of the body  acceleration array in the 33-40 bin window 
415 fBodyAccJerk-bandsEnergy()-41,48: Energy of the FFT of the derivation of the body  acceleration array in the 41-48 bin window 
416 fBodyAccJerk-bandsEnergy()-49,56: Energy of the FFT of the derivation of the body  acceleration array in the 49-56 bin window 
417 fBodyAccJerk-bandsEnergy()-57,64: Energy of the FFT of the derivation of the body  acceleration array in the 57-64 bin window 
418 fBodyAccJerk-bandsEnergy()-1,16: Energy of the FFT of the derivation of the body  acceleration array in the 1-16 bin window 
419 fBodyAccJerk-bandsEnergy()-17,32: Energy of the FFT of the derivation of the body  acceleration array in the 17-32 bin window 
420 fBodyAccJerk-bandsEnergy()-33,48: Energy of the FFT of the derivation of the body  acceleration array in the 33-48 bin window 
421 fBodyAccJerk-bandsEnergy()-49,64: Energy of the FFT of the derivation of the body  acceleration array in the 49-64 bin window 
422 fBodyAccJerk-bandsEnergy()-1,24: Energy of the FFT of the derivation of the body  acceleration array in the 1-24 bin window 
423 fBodyAccJerk-bandsEnergy()-25,48: Energy of the FFT of the derivation of the body  acceleration array in the 25-48 bin window 
424 fBodyGyro-maxInds-X: Index of the frequency component with the largest magnitude in the FFT of the derivation of the angular velocity array in the X direction 
425 fBodyGyro-maxInds-Y: Index of the frequency component with the largest magnitude in the FFT of the derivation of the angular velocity array in the Y direction 
426 fBodyGyro-maxInds-Z: Index of the frequency component with the largest magnitude in the FFT of the derivation of the angular velocity array in the Z direction 
427 fBodyGyro-meanFreq()-X: Weighted average of the frequency components in the FFT of the derivation of the angular velocity array in the X direction 
428 fBodyGyro-meanFreq()-Y: Weighted average of the frequency components in the FFT of the derivation of the angular velocity array in the Y direction 
429 fBodyGyro-meanFreq()-Z: Weighted average of the frequency components in the FFT of the derivation of the angular velocity array in the Z direction 
430 fBodyGyro-skewness()-X: Skewness of the frequency domain signal of the FFT of the derivation of the angular velocity array in the X direction 
431 fBodyGyro-kurtosis()-X: Kurtosis of the frequency domain signal of the FFT of the derivation of the angular velocity array in the X direction 
432 fBodyGyro-skewness()-Y: Skewness of the frequency domain signal of the FFT of the derivation of the angular velocity array in the Y direction 
433 fBodyGyro-kurtosis()-Y: Kurtosis of the frequency domain signal of the FFT of the derivation of the angular velocity array in the Y direction 
434 fBodyGyro-skewness()-Z: Skewness of the frequency domain signal of the FFT of the derivation of the angular velocity array in the Z direction 
435 fBodyGyro-kurtosis()-Z: Kurtosis of the frequency domain signal of the FFT of the derivation of the angular velocity array in the Z direction 
436 fBodyGyro-bandsEnergy()-1,8: Energy of the FFT of the derivation of the angular velocity array in the 1-8 bin window 
437 fBodyGyro-bandsEnergy()-9,16: Energy of the FFT of the derivation of the angular velocity array in the 9-16 bin window 
438 fBodyGyro-bandsEnergy()-17,24: Energy of the FFT of the derivation of the angular velocity array in the 17-24 bin window 
439 fBodyGyro-bandsEnergy()-25,32: Energy of the FFT of the derivation of the angular velocity array in the 25-32 bin window 
440 fBodyGyro-bandsEnergy()-33,40: Energy of the FFT of the derivation of the angular velocity array in the 33-40 bin window 
441 fBodyGyro-bandsEnergy()-41,48: Energy of the FFT of the derivation of the angular velocity array in the 41-48 bin window 
442 fBodyGyro-bandsEnergy()-49,56: Energy of the FFT of the derivation of the angular velocity array in the 49-56 bin window 
443 fBodyGyro-bandsEnergy()-57,64: Energy of the FFT of the derivation of the angular velocity array in the 57-64 bin window 
444 fBodyGyro-bandsEnergy()-1,16: Energy of the FFT of the derivation of the angular velocity array in the 1-16 bin window 
445 fBodyGyro-bandsEnergy()-17,32: Energy of the FFT of the derivation of the angular velocity array in the 17-32 bin window 
446 fBodyGyro-bandsEnergy()-33,48: Energy of the FFT of the derivation of the angular velocity array in the 33-48 bin window 
447 fBodyGyro-bandsEnergy()-49,64: Energy of the FFT of the derivation of the angular velocity array in the 49-64 bin window 
448 fBodyGyro-bandsEnergy()-1,24: Energy of the FFT of the derivation of the angular velocity array in the 1-24 bin window 
449 fBodyGyro-bandsEnergy()-25,48: Energy of the FFT of the derivation of the angular velocity array in the 25-48 bin window 
450 fBodyGyro-bandsEnergy()-1,8: Energy of the FFT of the derivation of the angular velocity array in the 1-8 bin window 
451 fBodyGyro-bandsEnergy()-9,16: Energy of the FFT of the derivation of the angular velocity array in the 9-16 bin window 
452 fBodyGyro-bandsEnergy()-17,24: Energy of the FFT of the derivation of the angular velocity array in the 17-24 bin window 
453 fBodyGyro-bandsEnergy()-25,32: Energy of the FFT of the derivation of the angular velocity array in the 25-32 bin window 
454 fBodyGyro-bandsEnergy()-33,40: Energy of the FFT of the derivation of the angular velocity array in the 33-40 bin window 
455 fBodyGyro-bandsEnergy()-41,48: Energy of the FFT of the derivation of the angular velocity array in the 41-48 bin window 
456 fBodyGyro-bandsEnergy()-49,56: Energy of the FFT of the derivation of the angular velocity array in the 49-56 bin window 
457 fBodyGyro-bandsEnergy()-57,64: Energy of the FFT of the derivation of the angular velocity array in the 57-64 bin window 
458 fBodyGyro-bandsEnergy()-1,16: Energy of the FFT of the derivation of the angular velocity array in the 1-16 bin window  
459 fBodyGyro-bandsEnergy()-17,32: Energy of the FFT of the derivation of the angular velocity array in the 17-32 bin window 
460 fBodyGyro-bandsEnergy()-33,48: Energy of the FFT of the derivation of the angular velocity array in the 33-48 bin window 
461 fBodyGyro-bandsEnergy()-49,64: Energy of the FFT of the derivation of the angular velocity array in the 49-64 bin window 
462 fBodyGyro-bandsEnergy()-1,24: Energy of the FFT of the derivation of the angular velocity array in the 1-24 bin window 
463 fBodyGyro-bandsEnergy()-25,48: Energy of the FFT of the derivation of the angular velocity array in the 25-48 bin window 
464 fBodyGyro-bandsEnergy()-1,8: Energy of the FFT of the derivation of the angular velocity array in the 1-8 bin window 
465 fBodyGyro-bandsEnergy()-9,16: Energy of the FFT of the derivation of the angular velocity array in the 9-16 bin window 
466 fBodyGyro-bandsEnergy()-17,24: Energy of the FFT of the derivation of the angular velocity array in the 17-24 bin window 
467 fBodyGyro-bandsEnergy()-25,32: Energy of the FFT of the derivation of the angular velocity array in the 25-32 bin window 
468 fBodyGyro-bandsEnergy()-33,40: Energy of the FFT of the derivation of the angular velocity array in the 33-40 bin window 
469 fBodyGyro-bandsEnergy()-41,48: Energy of the FFT of the derivation of the angular velocity array in the 41-48 bin window 
470 fBodyGyro-bandsEnergy()-49,56: Energy of the FFT of the derivation of the angular velocity array in the 49-56 bin window 
471 fBodyGyro-bandsEnergy()-57,64: Energy of the FFT of the derivation of the angular velocity array in the 57-64 bin window 
472 fBodyGyro-bandsEnergy()-1,16: Energy of the FFT of the derivation of the angular velocity array in the 1-16 bin window 
473 fBodyGyro-bandsEnergy()-17,32: Energy of the FFT of the derivation of the angular velocity array in the 17-32 bin window 
474 fBodyGyro-bandsEnergy()-33,48: Energy of the FFT of the derivation of the angular velocity array in the 33-48 bin window 
475 fBodyGyro-bandsEnergy()-49,64: Energy of the FFT of the derivation of the angular velocity array in the 49-64 bin window 
476 fBodyGyro-bandsEnergy()-1,24: Energy of the FFT of the derivation of the angular velocity array in the 1-24 bin window 
477 fBodyGyro-bandsEnergy()-25,48: Energy of the FFT of the derivation of the angular velocity array in the 25-48 bin window 
478 fBodyGyro-bandsEnergy()-25,32: Energy of the FFT of the derivation of the angular velocity array in the 25-32 bin window 
479 fBodyGyro-bandsEnergy()-33,40: Energy of the FFT of the derivation of the angular velocity array in the 33-40 bin window 
480 fBodyGyro-bandsEnergy()-41,48: Energy of the FFT of the derivation of the angular velocity array in the 41-48 bin window 
481 fBodyGyro-bandsEnergy()-49,56: Energy of the FFT of the derivation of the angular velocity array in the 49-56 bin window 
482 fBodyGyro-bandsEnergy()-57,64: Energy of the FFT of the derivation of the angular velocity array in the 57-64 bin window 
483 fBodyGyro-bandsEnergy()-1,16: Energy of the FFT of the derivation of the angular velocity array in the 1-16 bin window 
484 fBodyGyro-bandsEnergy()-17,32: Energy of the FFT of the derivation of the angular velocity array in the 17-32 bin window 
485 fBodyGyro-bandsEnergy()-33,48: Energy of the FFT of the derivation of the angular velocity array in the 33-48 bin window 
486 fBodyGyro-bandsEnergy()-49,64: Energy of the FFT of the derivation of the angular velocity array in the 49-64 bin window 
487 fBodyGyro-bandsEnergy()-1,24: Energy of the FFT of the derivation of the angular velocity array in the 1-24 bin window 
488 fBodyGyro-bandsEnergy()-25,48: Energy of the FFT of the derivation of the angular velocity array in the 25-48 bin window 
489 fBodyGyro-bandsEnergy()-1,8: Energy of the FFT of the derivation of the angular velocity array in the 1-8 bin window 
490 fBodyGyro-bandsEnergy()-9,16: Energy of the FFT of the derivation of the angular velocity array in the 9-16 bin window 
491 fBodyGyro-bandsEnergy()-17,24: Energy of the FFT of the derivation of the angular velocity array in the 17-24 bin window 
492 fBodyGyro-bandsEnergy()-25,32: Energy of the FFT of the derivation of the angular velocity array in the 25-32 bin window 
493 fBodyGyro-bandsEnergy()-33,40: Energy of the FFT of the derivation of the angular velocity array in the 33-40 bin window 
494 fBodyGyro-bandsEnergy()-41,48: Energy of the FFT of the derivation of the angular velocity array in the 41-48 bin window 
495 fBodyGyro-bandsEnergy()-49,56: Energy of the FFT of the derivation of the angular velocity array in the 49-56 bin window 
496 fBodyGyro-bandsEnergy()-57,64: Energy of the FFT of the derivation of the angular velocity array in the 57-64 bin window 
497 fBodyGyro-bandsEnergy()-1,16: Energy of the FFT of the derivation of the angular velocity array in the 1-16 bin window 
498 fBodyGyro-bandsEnergy()-17,32: Energy of the FFT of the derivation of the angular velocity array in the 17-32 bin window 
499 fBodyGyro-bandsEnergy()-33,48: Energy of the FFT of the derivation of the angular velocity array in the 33-48 bin window 
500 fBodyGyro-bandsEnergy()-49,64: Energy of the FFT of the derivation of the angular velocity array in the 49-64 bin window 
501 fBodyGyro-bandsEnergy()-1,24: Energy of the FFT of the derivation of the angular velocity array in the 1-24 bin window 
502 fBodyGyro-bandsEnergy()-25,48: Energy of the FFT of the derivation of the angular velocity array in the 25-48 bin window 
503 fBodyAccMag-mean(): Mean of the FFT of the body acceleration signal
504 fBodyAccMag-std(): Standard deviation of the FFT of the body acceleration signal
505 fBodyAccMag-mad(): Median absolute deviation of the FFT of the body acceleration signal 
506 fBodyAccMag-max(): Largest value in the FFT of the body acceleration array
507 fBodyAccMag-min(): Smallest value in the FFT of the body acceleration array
508 fBodyAccMag-sma(): Signal magnitude area of the FFT of the body acceleration array
509 fBodyAccMag-energy(): Sum of the squares divided by the number of values in the FFT of the body acceleration array
510 fBodyAccMag-iqr(): Interquartile range of the FFT of the body acceleration array
511 fBodyAccMag-entropy(): Signal entropy of the FFT of the body acceleration array
512 fBodyAccMag-maxInds: Index of the frequency component with the largest magnitude in the FFT of the derivation of the body  acceleration array
513 fBodyAccMag-meanFreq(): Weighted average of the frequency components in the FFT of the derivation of the body  acceleration array 
514 fBodyAccMag-skewness(): Skewness of the frequency domain signal of the FFT of the derivation of the body  acceleration array 
515 fBodyAccMag-kurtosis(): Kurtosis of the frequency domain signal of the FFT of the derivation of the body  acceleration array 
516 fBodyAccJerkMag-mean(): Mean of the FFT of the time derivation of the body acceleration signal
517 fBodyAccJerkMag-std(): Standard deviation of the FFT of the time derivation of the body acceleration signal
518 fBodyAccJerkMag-mad(): Median absolute deviation of the FFT of the time derivation of the body acceleration signal 
519 fBodyAccJerkMag-max(): Largest value in the FFT of the time derivation of the body acceleration array
520 fBodyAccJerkMag-min(): Smallest value in the FFT of the time derivation of the body acceleration array
521 fBodyAccJerkMag-sma(): Signal magnitude area of the FFT of the time derivation of the body acceleration array
522 fBodyAccJerkMag-energy(): Sum of the squares divided by the number of values in the FFT of the time derivation of the body acceleration array
523 fBodyAccJerkMag-iqr(): Interquartile range of the FFT of the time derivation of the body acceleration array
524 fBodyAccJerkMag-entropy(): Signal entropy of the FFT of the time derivation of the body acceleration array
525 fBodyAccJerkMag-maxInds: Index of the frequency component with the largest magnitude in the FFT of the derivation of the body  acceleration array
526 fBodyAccJerkMag-meanFreq(): Weighted average of the frequency components in the FFT of the derivation of the body  acceleration array 
527 fBodyAccJerkMag-skewness(): Skewness of the frequency domain signal of the FFT of the derivation of the body  acceleration array 
528 fBodyAccJerkMag-kurtosis(): Kurtosis of the frequency domain signal of the FFT of the derivation of the body  acceleration array 
529 fBodyBodyGyroMag-mean(): Mean of the FFT of the time derivation of the body angular velocity signal
530 fBodyBodyGyroMag-std(): Standard deviation of the FFT of the time derivation of the body angular velocity signal
531 fBodyBodyGyroMag-mad(): Median absolute deviation of the FFT of the time derivation of the body angular velocity signal 
532 fBodyBodyGyroMag-max(): Largest value in the FFT of the time derivation of the body angular velocity array
533 fBodyBodyGyroMag-min(): Smallest value in the FFT of the time derivation of the body angular velocity array
534 fBodyBodyGyroMag-sma(): Signal magnitude area of the FFT of the time derivation of the body angular velocity array
535 fBodyBodyGyroMag-energy(): Sum of the squares divided by the number of values in the FFT of the time derivation of the body angular velocity array
536 fBodyBodyGyroMag-iqr(): Interquartile range of the FFT of the time derivation of the body angular velocity array
537 fBodyBodyGyroMag-entropy(): Signal entropy of the FFT of the time derivation of the body angular velocity array
538 fBodyBodyGyroMag-maxInds: Index of the frequency component with the largest magnitude in the FFT of the derivation of the body  acceleration array
539 fBodyBodyGyroMag-meanFreq(): Weighted average of the frequency components in the FFT of the derivation of the body  acceleration array 
540 fBodyBodyGyroMag-skewness(): Skewness of the frequency domain signal of the FFT of the derivation of the body  acceleration array 
541 fBodyBodyGyroMag-kurtosis(): Kurtosis of the frequency domain signal of the FFT of the derivation of the body  acceleration array 
542 fBodyBodyGyroJerkMag-mean(): Mean of the FFT of the time derivation of the body angular velocity signal
543 fBodyBodyGyroJerkMag-std(): Standard deviation of the FFT of the time derivation of the body angular velocity signal
544 fBodyBodyGyroJerkMag-mad(): Median absolute deviation of the FFT of the time derivation of the body angular velocity signal 
545 fBodyBodyGyroJerkMag-max(): Largest value in the FFT of the time derivation of the body angular velocity array
546 fBodyBodyGyroJerkMag-min(): Smallest value in the FFT of the time derivation of the body angular velocity array
547 fBodyBodyGyroJerkMag-sma(): Signal magnitude area of the FFT of the time derivation of the body angular velocity array
548 fBodyBodyGyroJerkMag-energy(): Sum of the squares divided by the number of values in the FFT of the time derivation of the body angular velocity array
549 fBodyBodyGyroJerkMag-iqr(): Interquartile range of the FFT of the time derivation of the body angular velocity array
550 fBodyBodyGyroJerkMag-entropy(): Signal entropy of the FFT of the time derivation of the body angular velocity array
551 fBodyBodyGyroJerkMag-maxInds: Index of the frequency component with the largest magnitude in the FFT of the derivation of the body  acceleration array
552 fBodyBodyGyroJerkMag-meanFreq(): Weighted average of the frequency components in the FFT of the derivation of the body  acceleration array 
553 fBodyBodyGyroJerkMag-skewness(): Skewness of the frequency domain signal of the FFT of the derivation of the body  acceleration array 
554 fBodyBodyGyroJerkMag-kurtosis(): Kurtosis of the frequency domain signal of the FFT of the derivation of the body  acceleration array 
555 angle(tBodyAccMean,gravity): Angle between the body acceleration mean vector and the gravity vector
556 angle(tBodyAccJerkMean),gravityMean): Angle between the time derivation of the body acceleration (Jerk) mean vector and the gravity mean vector
557 angle(tBodyGyroMean,gravityMean): Angle between the angular velocity mean vector and the gravity mean vector
558 angle(tBodyGyroJerkMean,gravityMean): Angle between the time derivation of the angular velocity mean vector and the gravity mean vector
559 angle(X,gravityMean): Angle between the X vector and the mean of the gravity vector 
560 angle(Y,gravityMean): Angle between the Y vector and the mean of the gravity vector
561 angle(Z,gravityMean): Angle between the Z vector and the mean of the gravity vector 
