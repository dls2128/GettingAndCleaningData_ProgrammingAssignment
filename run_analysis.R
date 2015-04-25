# run_analysis.R

# Read data from working directory into R
# NOTE: All of these files to be loaded must be in your working directory 
# before script execution! 

Xtrain <- read.table("X_train.txt")
ytrain <- read.table("y_train.txt")
subjecttrain <- read.table("subject_train.txt")

Xtest <- read.table("X_test.txt")
ytest <- read.table("y_test.txt")
subjecttest <- read.table("subject_test.txt")

featnames <- read.table("features.txt")
names  <- sapply(featnames[,"V2"],as.character)


# Replace column names with those provided in features.txt...
colnames(Xtrain) <- c(names)
colnames(Xtest) <- c(names)


# Merge train data frames horizontally...
traindata <- cbind(subjecttrain,ytrain,Xtrain)

# Merge test data frames horizontally...
testdata <- cbind(subjecttest,ytest,Xtest)

# Merge train and test data frames vertically... 
merged_data <- rbind(traindata,testdata)

# Change names of columns to be maximally informative... 
colnames(merged_data)[1] <- "Subject_Number"
colnames(merged_data)[2] <- "Activity"

# Replace column 2 numbers with activity names... 
merged_data$Activity[merged_data$Activity==1] <- "Walking"
merged_data$Activity[merged_data$Activity==2] <- "Walking_Upstairs"
merged_data$Activity[merged_data$Activity==3] <- "Walking_Downstairs"
merged_data$Activity[merged_data$Activity==4] <- "Sitting"
merged_data$Activity[merged_data$Activity==5] <- "Standing"
merged_data$Activity[merged_data$Activity==6] <- "Laying"


# Extract columns that have the word "mean"... 
mean_columns <- merged_data[,grep("mean",colnames(merged_data))]

# Extract columns that have the word "std"...
std_columns <- merged_data[,grep("std",colnames(merged_data))]

# Calculate the mean for mean columns...
mean_of_means <- colMeans(mean_columns)

# Calculate the mean for std columns...
mean_of_stds <- colMeans(std_columns)

# Create CSV files with this mean data to save results of calculation... 
write.csv(mean_of_means,file="mean_of_means.csv")
mean_means <- read.csv("mean_of_means.csv")

write.csv(mean_of_stds,file="mean_of_stds.csv")
std_means <- read.csv("mean_of_stds.csv")


# Create a second, tidy data set with the average of each variable for each
# activity and each subject... 

# The following code goes through the same steps for each activity/subject 
# combination, described for the first activity/subject combo below...  

# First, get variable values specific to subject/activity combination...
# We start with subject 1, activity 1 (walking)... 
var1_s1 <- subset(merged_data,Subject_Number=='1'&Activity=='Standing')

# Get rid of non-numeric columns in the resulting data frame... 
var1_s1$Subject_Number=NULL
var1_s1$Activity=NULL

# Load this mean result as a data frame... 
var1_s1_means <- colMeans(var1_s1)
write.csv(var1_s1_means,file="var1_s1_means.csv")
means_var1_s1 <- read.csv("var1_s1_means.csv")

# Transpose so each variable is in a different column...

var1_s1_means <- t(means_var1_s1)
var1_s1_means <- as.data.frame(var1_s1_means)

# Add activity name to second row for organization later...
row.names(var1_s1_means)[2] <- "Subject1_Walking"

# Keep only the second row from this data frame...
var1_s1_means = var1_s1_means[-1, ]


# And now do this for all other subject/activity combinations... 

var1_s2 <- subset(merged_data,Subject_Number=='2'&Activity=='Walking')

var1_s2$Subject_Number=NULL
var1_s2$Activity=NULL

var1_s2_means <- colMeans(var1_s2)
write.csv(var1_s2_means,file="var1_s2_means.csv")
means_var1_s2 <- read.csv("var1_s2_means.csv")

var1_s2_means <- t(means_var1_s2)
var1_s2_means <- as.data.frame(var1_s2_means)

row.names(var1_s2_means)[2] <- "Subject2_Walking"

var1_s2_means = var1_s2_means[-1, ]


var1_s3 <- subset(merged_data,Subject_Number=='3'&Activity=='Walking')

var1_s3$Subject_Number=NULL
var1_s3$Activity=NULL

var1_s3_means <- colMeans(var1_s3)
write.csv(var1_s3_means,file="var1_s3_means.csv")
means_var1_s3 <- read.csv("var1_s3_means.csv")

var1_s3_means <- t(means_var1_s3)
var1_s3_means <- as.data.frame(var1_s3_means)

row.names(var1_s3_means)[2] <- "Subject3_Walking"

var1_s3_means = var1_s3_means[-1, ]


var1_s4 <- subset(merged_data,Subject_Number=='4'&Activity=='Walking')

var1_s4$Subject_Number=NULL
var1_s4$Activity=NULL

var1_s4_means <- colMeans(var1_s4)
write.csv(var1_s4_means,file="var1_s4_means.csv")
means_var1_s4 <- read.csv("var1_s4_means.csv")

var1_s4_means <- t(means_var1_s4)
var1_s4_means <- as.data.frame(var1_s4_means)

row.names(var1_s4_means)[2] <- "Subject4_Walking"

var1_s4_means = var1_s4_means[-1, ]


var1_s5 <- subset(merged_data,Subject_Number=='5'&Activity=='Walking')

var1_s5$Subject_Number=NULL
var1_s5$Activity=NULL

var1_s5_means <- colMeans(var1_s5)
write.csv(var1_s5_means,file="var1_s5_means.csv")
means_var1_s5 <- read.csv("var1_s5_means.csv")

var1_s5_means <- t(means_var1_s5)
var1_s5_means <- as.data.frame(var1_s5_means)

row.names(var1_s5_means)[2] <- "Subject5_Walking"

var1_s5_means = var1_s5_means[-1, ]


var1_s6 <- subset(merged_data,Subject_Number=='6'&Activity=='Walking')

var1_s6$Subject_Number=NULL
var1_s6$Activity=NULL

var1_s6_means <- colMeans(var1_s6)
write.csv(var1_s6_means,file="var1_s6_means.csv")
means_var1_s6 <- read.csv("var1_s6_means.csv")

var1_s6_means <- t(means_var1_s6)
var1_s6_means <- as.data.frame(var1_s6_means)

row.names(var1_s6_means)[2] <- "Subject6_Walking"

var1_s6_means = var1_s6_means[-1, ]


var1_s7 <- subset(merged_data,Subject_Number=='7'&Activity=='Walking')

var1_s7$Subject_Number=NULL
var1_s7$Activity=NULL

var1_s7_means <- colMeans(var1_s7)
write.csv(var1_s7_means,file="var1_s7_means.csv")
means_var1_s7 <- read.csv("var1_s7_means.csv")

var1_s7_means <- t(means_var1_s7)
var1_s7_means <- as.data.frame(var1_s7_means)

row.names(var1_s7_means)[2] <- "Subject7_Walking"

var1_s7_means = var1_s7_means[-1, ]


var1_s8 <- subset(merged_data,Subject_Number=='8'&Activity=='Walking')

var1_s8$Subject_Number=NULL
var1_s8$Activity=NULL

var1_s8_means <- colMeans(var1_s8)
write.csv(var1_s8_means,file="var1_s8_means.csv")
means_var1_s8 <- read.csv("var1_s8_means.csv")

var1_s8_means <- t(means_var1_s8)
var1_s8_means <- as.data.frame(var1_s8_means)

row.names(var1_s8_means)[2] <- "Subject8_Walking"

var1_s8_means = var1_s8_means[-1, ]


var1_s9 <- subset(merged_data,Subject_Number=='9'&Activity=='Walking')

var1_s9$Subject_Number=NULL
var1_s9$Activity=NULL

var1_s9_means <- colMeans(var1_s9)
write.csv(var1_s9_means,file="var1_s9_means.csv")
means_var1_s9 <- read.csv("var1_s9_means.csv")

var1_s9_means <- t(means_var1_s9)
var1_s9_means <- as.data.frame(var1_s9_means)

row.names(var1_s9_means)[2] <- "Subject9_Walking"

var1_s9_means = var1_s9_means[-1, ]


var1_s10 <- subset(merged_data,Subject_Number=='10'&Activity=='Walking')

var1_s10$Subject_Number=NULL
var1_s10$Activity=NULL

var1_s10_means <- colMeans(var1_s10)
write.csv(var1_s10_means,file="var1_s10_means.csv")
means_var1_s10 <- read.csv("var1_s10_means.csv")

var1_s10_means <- t(means_var1_s10)
var1_s10_means <- as.data.frame(var1_s10_means)

row.names(var1_s10_means)[2] <- "Subject10_Walking"

var1_s10_means = var1_s10_means[-1, ]


var1_s11 <- subset(merged_data,Subject_Number=='11'&Activity=='Walking')

var1_s11$Subject_Number=NULL
var1_s11$Activity=NULL

var1_s11_means <- colMeans(var1_s11)
write.csv(var1_s11_means,file="var1_s11_means.csv")
means_var1_s11 <- read.csv("var1_s11_means.csv")

var1_s11_means <- t(means_var1_s11)
var1_s11_means <- as.data.frame(var1_s11_means)

row.names(var1_s11_means)[2] <- "Subject11_Walking"

var1_s11_means = var1_s11_means[-1, ]


var1_s12 <- subset(merged_data,Subject_Number=='12'&Activity=='Walking')

var1_s12$Subject_Number=NULL
var1_s12$Activity=NULL

var1_s12_means <- colMeans(var1_s12)
write.csv(var1_s12_means,file="var1_s12_means.csv")
means_var1_s12 <- read.csv("var1_s12_means.csv")

var1_s12_means <- t(means_var1_s12)
var1_s12_means <- as.data.frame(var1_s12_means)

row.names(var1_s12_means)[2] <- "Subject12_Walking"

var1_s12_means = var1_s12_means[-1, ]


var1_s13 <- subset(merged_data,Subject_Number=='13'&Activity=='Walking')

var1_s13$Subject_Number=NULL
var1_s13$Activity=NULL

var1_s13_means <- colMeans(var1_s13)
write.csv(var1_s13_means,file="var1_s13_means.csv")
means_var1_s13 <- read.csv("var1_s13_means.csv")

var1_s13_means <- t(means_var1_s13)
var1_s13_means <- as.data.frame(var1_s13_means)

row.names(var1_s13_means)[2] <- "Subject13_Walking"

var1_s13_means = var1_s13_means[-1, ]


var1_s14 <- subset(merged_data,Subject_Number=='14'&Activity=='Walking')

var1_s14$Subject_Number=NULL
var1_s14$Activity=NULL

var1_s14_means <- colMeans(var1_s14)
write.csv(var1_s14_means,file="var1_s14_means.csv")
means_var1_s14 <- read.csv("var1_s14_means.csv")

var1_s14_means <- t(means_var1_s14)
var1_s14_means <- as.data.frame(var1_s14_means)

row.names(var1_s14_means)[2] <- "Subject14_Walking"

var1_s14_means = var1_s14_means[-1, ]


var1_s15 <- subset(merged_data,Subject_Number=='15'&Activity=='Walking')

var1_s15$Subject_Number=NULL
var1_s15$Activity=NULL

var1_s15_means <- colMeans(var1_s15)
write.csv(var1_s15_means,file="var1_s15_means.csv")
means_var1_s15 <- read.csv("var1_s15_means.csv")

var1_s15_means <- t(means_var1_s15)
var1_s15_means <- as.data.frame(var1_s15_means)

row.names(var1_s15_means)[2] <- "Subject15_Walking"

var1_s15_means = var1_s15_means[-1, ]


var1_s16 <- subset(merged_data,Subject_Number=='16'&Activity=='Walking')

var1_s16$Subject_Number=NULL
var1_s16$Activity=NULL

var1_s16_means <- colMeans(var1_s16)
write.csv(var1_s16_means,file="var1_s16_means.csv")
means_var1_s16 <- read.csv("var1_s16_means.csv")

var1_s16_means <- t(means_var1_s16)
var1_s16_means <- as.data.frame(var1_s16_means)

row.names(var1_s16_means)[2] <- "Subject16_Walking"

var1_s16_means = var1_s16_means[-1, ]

var1_s17 <- subset(merged_data,Subject_Number=='17'&Activity=='Walking')

var1_s17$Subject_Number=NULL
var1_s17$Activity=NULL

var1_s17_means <- colMeans(var1_s17)
write.csv(var1_s17_means,file="var1_s17_means.csv")
means_var1_s17 <- read.csv("var1_s17_means.csv")

var1_s17_means <- t(means_var1_s17)
var1_s17_means <- as.data.frame(var1_s17_means)

row.names(var1_s17_means)[2] <- "Subject17_Walking"

var1_s17_means = var1_s17_means[-1, ]


var1_s18 <- subset(merged_data,Subject_Number=='18'&Activity=='Walking')

var1_s18$Subject_Number=NULL
var1_s18$Activity=NULL

var1_s18_means <- colMeans(var1_s18)
write.csv(var1_s18_means,file="var1_s18_means.csv")
means_var1_s18 <- read.csv("var1_s18_means.csv")

var1_s18_means <- t(means_var1_s18)
var1_s18_means <- as.data.frame(var1_s18_means)

row.names(var1_s18_means)[2] <- "Subject18_Walking"

var1_s18_means = var1_s18_means[-1, ]


var1_s19 <- subset(merged_data,Subject_Number=='19'&Activity=='Walking')

var1_s19$Subject_Number=NULL
var1_s19$Activity=NULL

var1_s19_means <- colMeans(var1_s19)
write.csv(var1_s19_means,file="var1_s19_means.csv")
means_var1_s19 <- read.csv("var1_s19_means.csv")

var1_s19_means <- t(means_var1_s19)
var1_s19_means <- as.data.frame(var1_s19_means)

row.names(var1_s19_means)[2] <- "Subject19_Walking"

var1_s19_means = var1_s19_means[-1, ]


var1_s20 <- subset(merged_data,Subject_Number=='20'&Activity=='Walking')

var1_s20$Subject_Number=NULL
var1_s20$Activity=NULL

var1_s20_means <- colMeans(var1_s20)
write.csv(var1_s20_means,file="var1_s20_means.csv")
means_var1_s20 <- read.csv("var1_s20_means.csv")

var1_s20_means <- t(means_var1_s20)
var1_s20_means <- as.data.frame(var1_s20_means)

row.names(var1_s20_means)[2] <- "Subject20_Walking"

var1_s20_means = var1_s20_means[-1, ]


var1_s21 <- subset(merged_data,Subject_Number=='21'&Activity=='Walking')

var1_s21$Subject_Number=NULL
var1_s21$Activity=NULL

var1_s21_means <- colMeans(var1_s21)
write.csv(var1_s21_means,file="var1_s21_means.csv")
means_var1_s21 <- read.csv("var1_s21_means.csv")

var1_s21_means <- t(means_var1_s21)
var1_s21_means <- as.data.frame(var1_s21_means)

row.names(var1_s21_means)[2] <- "Subject21_Walking"

var1_s21_means = var1_s21_means[-1, ]


var1_s22 <- subset(merged_data,Subject_Number=='22'&Activity=='Walking')

var1_s22$Subject_Number=NULL
var1_s22$Activity=NULL

var1_s22_means <- colMeans(var1_s22)
write.csv(var1_s22_means,file="var1_s22_means.csv")
means_var1_s22 <- read.csv("var1_s22_means.csv")

var1_s22_means <- t(means_var1_s22)
var1_s22_means <- as.data.frame(var1_s22_means)

row.names(var1_s22_means)[2] <- "Subject22_Walking"

var1_s22_means = var1_s22_means[-1, ]


var1_s23 <- subset(merged_data,Subject_Number=='23'&Activity=='Walking')

var1_s23$Subject_Number=NULL
var1_s23$Activity=NULL

var1_s23_means <- colMeans(var1_s23)
write.csv(var1_s23_means,file="var1_s23_means.csv")
means_var1_s23 <- read.csv("var1_s23_means.csv")

var1_s23_means <- t(means_var1_s23)
var1_s23_means <- as.data.frame(var1_s23_means)

row.names(var1_s23_means)[2] <- "Subject23_Walking"

var1_s23_means = var1_s23_means[-1, ]


var1_s24 <- subset(merged_data,Subject_Number=='24'&Activity=='Walking')

var1_s24$Subject_Number=NULL
var1_s24$Activity=NULL

var1_s24_means <- colMeans(var1_s24)
write.csv(var1_s24_means,file="var1_s24_means.csv")
means_var1_s24 <- read.csv("var1_s24_means.csv")

var1_s24_means <- t(means_var1_s24)
var1_s24_means <- as.data.frame(var1_s24_means)

row.names(var1_s24_means)[2] <- "Subject24_Walking"

var1_s24_means = var1_s24_means[-1, ]


var1_s25 <- subset(merged_data,Subject_Number=='25'&Activity=='Walking')

var1_s25$Subject_Number=NULL
var1_s25$Activity=NULL

var1_s25_means <- colMeans(var1_s25)
write.csv(var1_s25_means,file="var1_s25_means.csv")
means_var1_s25 <- read.csv("var1_s25_means.csv")

var1_s25_means <- t(means_var1_s25)
var1_s25_means <- as.data.frame(var1_s25_means)

row.names(var1_s25_means)[2] <- "Subject25_Walking"

var1_s25_means = var1_s25_means[-1, ]


var1_s26 <- subset(merged_data,Subject_Number=='26'&Activity=='Walking')

var1_s26$Subject_Number=NULL
var1_s26$Activity=NULL

var1_s26_means <- colMeans(var1_s26)
write.csv(var1_s26_means,file="var1_s26_means.csv")
means_var1_s26 <- read.csv("var1_s26_means.csv")

var1_s26_means <- t(means_var1_s26)
var1_s26_means <- as.data.frame(var1_s26_means)

row.names(var1_s26_means)[2] <- "Subject26_Walking"

var1_s26_means = var1_s26_means[-1, ]


var1_s27 <- subset(merged_data,Subject_Number=='27'&Activity=='Walking')

var1_s27$Subject_Number=NULL
var1_s27$Activity=NULL

var1_s27_means <- colMeans(var1_s27)
write.csv(var1_s27_means,file="var1_s27_means.csv")
means_var1_s27 <- read.csv("var1_s27_means.csv")

var1_s27_means <- t(means_var1_s27)
var1_s27_means <- as.data.frame(var1_s27_means)

row.names(var1_s27_means)[2] <- "Subject27_Walking"

var1_s27_means = var1_s27_means[-1, ]


var1_s28 <- subset(merged_data,Subject_Number=='28'&Activity=='Walking')

var1_s28$Subject_Number=NULL
var1_s28$Activity=NULL

var1_s28_means <- colMeans(var1_s28)
write.csv(var1_s28_means,file="var1_s28_means.csv")
means_var1_s28 <- read.csv("var1_s28_means.csv")

var1_s28_means <- t(means_var1_s28)
var1_s28_means <- as.data.frame(var1_s28_means)

row.names(var1_s28_means)[2] <- "Subject28_Walking"

var1_s28_means = var1_s28_means[-1, ]


var1_s29 <- subset(merged_data,Subject_Number=='29'&Activity=='Walking')

var1_s29$Subject_Number=NULL
var1_s29$Activity=NULL

var1_s29_means <- colMeans(var1_s29)
write.csv(var1_s29_means,file="var1_s29_means.csv")
means_var1_s29 <- read.csv("var1_s29_means.csv")

var1_s29_means <- t(means_var1_s29)
var1_s29_means <- as.data.frame(var1_s29_means)

row.names(var1_s29_means)[2] <- "Subject29_Walking"

var1_s29_means = var1_s29_means[-1, ]


var1_s30 <- subset(merged_data,Subject_Number=='30'&Activity=='Walking')

var1_s30$Subject_Number=NULL
var1_s30$Activity=NULL

var1_s30_means <- colMeans(var1_s30)
write.csv(var1_s30_means,file="var1_s30_means.csv")
means_var1_s30 <- read.csv("var1_s30_means.csv")

var1_s30_means <- t(means_var1_s30)
var1_s30_means <- as.data.frame(var1_s30_means)

row.names(var1_s30_means)[2] <- "Subject30_Walking"

var1_s30_means = var1_s30_means[-1, ]





# Repeat for activity 2... 

var2_s1 <- subset(merged_data,Subject_Number=='1'&Activity=='Walking_Upstairs')

var2_s1$Subject_Number=NULL
var2_s1$Activity=NULL

var2_s1_means <- colMeans(var2_s1)
write.csv(var2_s1_means,file="var2_s1_means.csv")
means_var2_s1 <- read.csv("var2_s1_means.csv")

var2_s1_means <- t(means_var2_s1)
var2_s1_means <- as.data.frame(var2_s1_means)

row.names(var2_s1_means)[2] <- "Subject2_Walking_Upstairs"

var2_s1_means = var2_s1_means[-1, ]



var2_s2 <- subset(merged_data,Subject_Number=='2'&Activity=='Walking_Upstairs')

var2_s2$Subject_Number=NULL
var2_s2$Activity=NULL

var2_s2_means <- colMeans(var2_s2)
write.csv(var2_s2_means,file="var2_s2_means.csv")
means_var2_s2 <- read.csv("var2_s2_means.csv")

var2_s2_means <- t(means_var2_s2)
var2_s2_means <- as.data.frame(var2_s2_means)

row.names(var2_s2_means)[2] <- "Subject2_Walking_Upstairs"

var2_s2_means = var2_s2_means[-1, ]


var2_s3 <- subset(merged_data,Subject_Number=='3'&Activity=='Walking_Upstairs')

var2_s3$Subject_Number=NULL
var2_s3$Activity=NULL

var2_s3_means <- colMeans(var2_s3)
write.csv(var2_s3_means,file="var2_s3_means.csv")
means_var2_s3 <- read.csv("var2_s3_means.csv")

var2_s3_means <- t(means_var2_s3)
var2_s3_means <- as.data.frame(var2_s3_means)

row.names(var2_s3_means)[2] <- "Subject3_Walking_Upstairs"

var2_s3_means = var2_s3_means[-1, ]


var2_s4 <- subset(merged_data,Subject_Number=='4'&Activity=='Walking_Upstairs')

var2_s4$Subject_Number=NULL
var2_s4$Activity=NULL

var2_s4_means <- colMeans(var2_s4)
write.csv(var2_s4_means,file="var2_s4_means.csv")
means_var2_s4 <- read.csv("var2_s4_means.csv")

var2_s4_means <- t(means_var2_s4)
var2_s4_means <- as.data.frame(var2_s4_means)

row.names(var2_s4_means)[2] <- "Subject4_Walking_Upstairs"

var2_s4_means = var2_s4_means[-1, ]


var2_s5 <- subset(merged_data,Subject_Number=='5'&Activity=='Walking_Upstairs')

var2_s5$Subject_Number=NULL
var2_s5$Activity=NULL

var2_s5_means <- colMeans(var2_s5)
write.csv(var2_s5_means,file="var2_s5_means.csv")
means_var2_s5 <- read.csv("var2_s5_means.csv")

var2_s5_means <- t(means_var2_s5)
var2_s5_means <- as.data.frame(var2_s5_means)

row.names(var2_s5_means)[2] <- "Subject5_Walking_Upstairs"

var2_s5_means = var2_s5_means[-1, ]


var2_s6 <- subset(merged_data,Subject_Number=='6'&Activity=='Walking_Upstairs')

var2_s6$Subject_Number=NULL
var2_s6$Activity=NULL

var2_s6_means <- colMeans(var2_s6)
write.csv(var2_s6_means,file="var2_s6_means.csv")
means_var2_s6 <- read.csv("var2_s6_means.csv")

var2_s6_means <- t(means_var2_s6)
var2_s6_means <- as.data.frame(var2_s6_means)

row.names(var2_s6_means)[2] <- "Subject6_Walking_Upstairs"

var2_s6_means = var2_s6_means[-1, ]


var2_s7 <- subset(merged_data,Subject_Number=='7'&Activity=='Walking_Upstairs')

var2_s7$Subject_Number=NULL
var2_s7$Activity=NULL

var2_s7_means <- colMeans(var2_s7)
write.csv(var2_s7_means,file="var2_s7_means.csv")
means_var2_s7 <- read.csv("var2_s7_means.csv")

var2_s7_means <- t(means_var2_s7)
var2_s7_means <- as.data.frame(var2_s7_means)

row.names(var2_s7_means)[2] <- "Subject7_Walking_Upstairs"

var2_s7_means = var2_s7_means[-1, ]


var2_s8 <- subset(merged_data,Subject_Number=='8'&Activity=='Walking_Upstairs')

var2_s8$Subject_Number=NULL
var2_s8$Activity=NULL

var2_s8_means <- colMeans(var2_s8)
write.csv(var2_s8_means,file="var2_s8_means.csv")
means_var2_s8 <- read.csv("var2_s8_means.csv")

var2_s8_means <- t(means_var2_s8)
var2_s8_means <- as.data.frame(var2_s8_means)

row.names(var2_s8_means)[2] <- "Subject8_Walking_Upstairs"

var2_s8_means = var2_s8_means[-1, ]


var2_s9 <- subset(merged_data,Subject_Number=='9'&Activity=='Walking_Upstairs')

var2_s9$Subject_Number=NULL
var2_s9$Activity=NULL

var2_s9_means <- colMeans(var2_s9)
write.csv(var2_s9_means,file="var2_s9_means.csv")
means_var2_s9 <- read.csv("var2_s9_means.csv")

var2_s9_means <- t(means_var2_s9)
var2_s9_means <- as.data.frame(var2_s9_means)

row.names(var2_s9_means)[2] <- "Subject9_Walking_Upstairs"

var2_s9_means = var2_s9_means[-1, ]


var2_s10 <- subset(merged_data,Subject_Number=='10'&Activity=='Walking_Upstairs')

var2_s10$Subject_Number=NULL
var2_s10$Activity=NULL

var2_s10_means <- colMeans(var2_s10)
write.csv(var2_s10_means,file="var2_s10_means.csv")
means_var2_s10 <- read.csv("var2_s10_means.csv")

var2_s10_means <- t(means_var2_s10)
var2_s10_means <- as.data.frame(var2_s10_means)

row.names(var2_s10_means)[2] <- "Subject10_Walking_Upstairs"

var2_s10_means = var2_s10_means[-1, ]


var2_s11 <- subset(merged_data,Subject_Number=='11'&Activity=='Walking_Upstairs')

var2_s11$Subject_Number=NULL
var2_s11$Activity=NULL

var2_s11_means <- colMeans(var2_s11)
write.csv(var2_s11_means,file="var2_s11_means.csv")
means_var2_s11 <- read.csv("var2_s11_means.csv")

var2_s11_means <- t(means_var2_s11)
var2_s11_means <- as.data.frame(var2_s11_means)

row.names(var2_s11_means)[2] <- "Subject11_Walking_Upstairs"

var2_s11_means = var2_s11_means[-1, ]


var2_s12 <- subset(merged_data,Subject_Number=='12'&Activity=='Walking_Upstairs')

var2_s12$Subject_Number=NULL
var2_s12$Activity=NULL

var2_s12_means <- colMeans(var2_s12)
write.csv(var2_s12_means,file="var2_s12_means.csv")
means_var2_s12 <- read.csv("var2_s12_means.csv")

var2_s12_means <- t(means_var2_s12)
var2_s12_means <- as.data.frame(var2_s12_means)

row.names(var2_s12_means)[2] <- "Subject12_Walking_Upstairs"

var2_s12_means = var2_s12_means[-1, ]


var2_s13 <- subset(merged_data,Subject_Number=='13'&Activity=='Walking_Upstairs')

var2_s13$Subject_Number=NULL
var2_s13$Activity=NULL

var2_s13_means <- colMeans(var2_s13)
write.csv(var2_s13_means,file="var2_s13_means.csv")
means_var2_s13 <- read.csv("var2_s13_means.csv")

var2_s13_means <- t(means_var2_s13)
var2_s13_means <- as.data.frame(var2_s13_means)

row.names(var2_s13_means)[2] <- "Subject13_Walking_Upstairs"

var2_s13_means = var2_s13_means[-1, ]


var2_s14 <- subset(merged_data,Subject_Number=='14'&Activity=='Walking_Upstairs')

var2_s14$Subject_Number=NULL
var2_s14$Activity=NULL

var2_s14_means <- colMeans(var2_s14)
write.csv(var2_s14_means,file="var2_s14_means.csv")
means_var2_s14 <- read.csv("var2_s14_means.csv")

var2_s14_means <- t(means_var2_s14)
var2_s14_means <- as.data.frame(var2_s14_means)

row.names(var2_s14_means)[2] <- "Subject14_Walking_Upstairs"

var2_s14_means = var2_s14_means[-1, ]


var2_s15 <- subset(merged_data,Subject_Number=='15'&Activity=='Walking_Upstairs')

var2_s15$Subject_Number=NULL
var2_s15$Activity=NULL

var2_s15_means <- colMeans(var2_s15)
write.csv(var2_s15_means,file="var2_s15_means.csv")
means_var2_s15 <- read.csv("var2_s15_means.csv")

var2_s15_means <- t(means_var2_s15)
var2_s15_means <- as.data.frame(var2_s15_means)

row.names(var2_s15_means)[2] <- "Subject15_Walking_Upstairs"

var2_s15_means = var2_s15_means[-1, ]


var2_s16 <- subset(merged_data,Subject_Number=='16'&Activity=='Walking_Upstairs')

var2_s16$Subject_Number=NULL
var2_s16$Activity=NULL

var2_s16_means <- colMeans(var2_s16)
write.csv(var2_s16_means,file="var2_s16_means.csv")
means_var2_s16 <- read.csv("var2_s16_means.csv")

var2_s16_means <- t(means_var2_s16)
var2_s16_means <- as.data.frame(var2_s16_means)

row.names(var2_s16_means)[2] <- "Subject16_Walking_Upstairs"

var2_s16_means = var2_s16_means[-1, ]

var2_s17 <- subset(merged_data,Subject_Number=='17'&Activity=='Walking_Upstairs')

var2_s17$Subject_Number=NULL
var2_s17$Activity=NULL

var2_s17_means <- colMeans(var2_s17)
write.csv(var2_s17_means,file="var2_s17_means.csv")
means_var2_s17 <- read.csv("var2_s17_means.csv")

var2_s17_means <- t(means_var2_s17)
var2_s17_means <- as.data.frame(var2_s17_means)

row.names(var2_s17_means)[2] <- "Subject17_Walking_Upstairs"

var2_s17_means = var2_s17_means[-1, ]


var2_s18 <- subset(merged_data,Subject_Number=='18'&Activity=='Walking_Upstairs')

var2_s18$Subject_Number=NULL
var2_s18$Activity=NULL

var2_s18_means <- colMeans(var2_s18)
write.csv(var2_s18_means,file="var2_s18_means.csv")
means_var2_s18 <- read.csv("var2_s18_means.csv")

var2_s18_means <- t(means_var2_s18)
var2_s18_means <- as.data.frame(var2_s18_means)

row.names(var2_s18_means)[2] <- "Subject18_Walking_Upstairs"

var2_s18_means = var2_s18_means[-1, ]


var2_s19 <- subset(merged_data,Subject_Number=='19'&Activity=='Walking_Upstairs')

var2_s19$Subject_Number=NULL
var2_s19$Activity=NULL

var2_s19_means <- colMeans(var2_s19)
write.csv(var2_s19_means,file="var2_s19_means.csv")
means_var2_s19 <- read.csv("var2_s19_means.csv")

var2_s19_means <- t(means_var2_s19)
var2_s19_means <- as.data.frame(var2_s19_means)

row.names(var2_s19_means)[2] <- "Subject19_Walking_Upstairs"

var2_s19_means = var2_s19_means[-1, ]


var2_s20 <- subset(merged_data,Subject_Number=='20'&Activity=='Walking_Upstairs')

var2_s20$Subject_Number=NULL
var2_s20$Activity=NULL

var2_s20_means <- colMeans(var2_s20)
write.csv(var2_s20_means,file="var2_s20_means.csv")
means_var2_s20 <- read.csv("var2_s20_means.csv")

var2_s20_means <- t(means_var2_s20)
var2_s20_means <- as.data.frame(var2_s20_means)

row.names(var2_s20_means)[2] <- "Subject20_Walking_Upstairs"

var2_s20_means = var2_s20_means[-1, ]


var2_s21 <- subset(merged_data,Subject_Number=='21'&Activity=='Walking_Upstairs')

var2_s21$Subject_Number=NULL
var2_s21$Activity=NULL

var2_s21_means <- colMeans(var2_s21)
write.csv(var2_s21_means,file="var2_s21_means.csv")
means_var2_s21 <- read.csv("var2_s21_means.csv")

var2_s21_means <- t(means_var2_s21)
var2_s21_means <- as.data.frame(var2_s21_means)

row.names(var2_s21_means)[2] <- "Subject21_Walking_Upstairs"

var2_s21_means = var2_s21_means[-1, ]


var2_s22 <- subset(merged_data,Subject_Number=='22'&Activity=='Walking_Upstairs')

var2_s22$Subject_Number=NULL
var2_s22$Activity=NULL

var2_s22_means <- colMeans(var2_s22)
write.csv(var2_s22_means,file="var2_s22_means.csv")
means_var2_s22 <- read.csv("var2_s22_means.csv")

var2_s22_means <- t(means_var2_s22)
var2_s22_means <- as.data.frame(var2_s22_means)

row.names(var2_s22_means)[2] <- "Subject22_Walking_Upstairs"

var2_s22_means = var2_s22_means[-1, ]


var2_s23 <- subset(merged_data,Subject_Number=='23'&Activity=='Walking_Upstairs')

var2_s23$Subject_Number=NULL
var2_s23$Activity=NULL

var2_s23_means <- colMeans(var2_s23)
write.csv(var2_s23_means,file="var2_s23_means.csv")
means_var2_s23 <- read.csv("var2_s23_means.csv")

var2_s23_means <- t(means_var2_s23)
var2_s23_means <- as.data.frame(var2_s23_means)

row.names(var2_s23_means)[2] <- "Subject23_Walking_Upstairs"

var2_s23_means = var2_s23_means[-1, ]


var2_s24 <- subset(merged_data,Subject_Number=='24'&Activity=='Walking_Upstairs')

var2_s24$Subject_Number=NULL
var2_s24$Activity=NULL

var2_s24_means <- colMeans(var2_s24)
write.csv(var2_s24_means,file="var2_s24_means.csv")
means_var2_s24 <- read.csv("var2_s24_means.csv")

var2_s24_means <- t(means_var2_s24)
var2_s24_means <- as.data.frame(var2_s24_means)

row.names(var2_s24_means)[2] <- "Subject24_Walking_Upstairs"

var2_s24_means = var2_s24_means[-1, ]


var2_s25 <- subset(merged_data,Subject_Number=='25'&Activity=='Walking_Upstairs')

var2_s25$Subject_Number=NULL
var2_s25$Activity=NULL

var2_s25_means <- colMeans(var2_s25)
write.csv(var2_s25_means,file="var2_s25_means.csv")
means_var2_s25 <- read.csv("var2_s25_means.csv")

var2_s25_means <- t(means_var2_s25)
var2_s25_means <- as.data.frame(var2_s25_means)

row.names(var2_s25_means)[2] <- "Subject25_Walking_Upstairs"

var2_s25_means = var2_s25_means[-1, ]


var2_s26 <- subset(merged_data,Subject_Number=='26'&Activity=='Walking_Upstairs')

var2_s26$Subject_Number=NULL
var2_s26$Activity=NULL

var2_s26_means <- colMeans(var2_s26)
write.csv(var2_s26_means,file="var2_s26_means.csv")
means_var2_s26 <- read.csv("var2_s26_means.csv")

var2_s26_means <- t(means_var2_s26)
var2_s26_means <- as.data.frame(var2_s26_means)

row.names(var2_s26_means)[2] <- "Subject26_Walking_Upstairs"

var2_s26_means = var2_s26_means[-1, ]


var2_s27 <- subset(merged_data,Subject_Number=='27'&Activity=='Walking_Upstairs')

var2_s27$Subject_Number=NULL
var2_s27$Activity=NULL

var2_s27_means <- colMeans(var2_s27)
write.csv(var2_s27_means,file="var2_s27_means.csv")
means_var2_s27 <- read.csv("var2_s27_means.csv")

var2_s27_means <- t(means_var2_s27)
var2_s27_means <- as.data.frame(var2_s27_means)

row.names(var2_s27_means)[2] <- "Subject27_Walking_Upstairs"

var2_s27_means = var2_s27_means[-1, ]


var2_s28 <- subset(merged_data,Subject_Number=='28'&Activity=='Walking_Upstairs')

var2_s28$Subject_Number=NULL
var2_s28$Activity=NULL

var2_s28_means <- colMeans(var2_s28)
write.csv(var2_s28_means,file="var2_s28_means.csv")
means_var2_s28 <- read.csv("var2_s28_means.csv")

var2_s28_means <- t(means_var2_s28)
var2_s28_means <- as.data.frame(var2_s28_means)

row.names(var2_s28_means)[2] <- "Subject28_Walking_Upstairs"

var2_s28_means = var2_s28_means[-1, ]


var2_s29 <- subset(merged_data,Subject_Number=='29'&Activity=='Walking_Upstairs')

var2_s29$Subject_Number=NULL
var2_s29$Activity=NULL

var2_s29_means <- colMeans(var2_s29)
write.csv(var2_s29_means,file="var2_s29_means.csv")
means_var2_s29 <- read.csv("var2_s29_means.csv")

var2_s29_means <- t(means_var2_s29)
var2_s29_means <- as.data.frame(var2_s29_means)

row.names(var2_s29_means)[2] <- "Subject29_Walking_Upstairs"

var2_s29_means = var2_s29_means[-1, ]


var2_s30 <- subset(merged_data,Subject_Number=='30'&Activity=='Walking_Upstairs')

var2_s30$Subject_Number=NULL
var2_s30$Activity=NULL

var2_s30_means <- colMeans(var2_s30)
write.csv(var2_s30_means,file="var2_s30_means.csv")
means_var2_s30 <- read.csv("var2_s30_means.csv")

var2_s30_means <- t(means_var2_s30)
var2_s30_means <- as.data.frame(var2_s30_means)

row.names(var2_s30_means)[2] <- "Subject30_Walking_Upstairs"

var2_s30_means = var2_s30_means[-1, ]




# Repeat for activity 3... 



var3_s1 <- subset(merged_data,Subject_Number=='2'&Activity=='Walking_Downstairs')

var3_s1$Subject_Number=NULL
var3_s1$Activity=NULL

var3_s1_means <- colMeans(var3_s1)
write.csv(var3_s1_means,file="var3_s1_means.csv")
means_var3_s1 <- read.csv("var3_s1_means.csv")

var3_s1_means <- t(means_var3_s1)
var3_s1_means <- as.data.frame(var3_s1_means)

row.names(var3_s1_means)[2] <- "Subject1_Walking_Downstairs"

var3_s1_means = var3_s1_means[-1, ]



var3_s2 <- subset(merged_data,Subject_Number=='2'&Activity=='Walking_Downstairs')

var3_s2$Subject_Number=NULL
var3_s2$Activity=NULL

var3_s2_means <- colMeans(var3_s2)
write.csv(var3_s2_means,file="var3_s2_means.csv")
means_var3_s2 <- read.csv("var3_s2_means.csv")

var3_s2_means <- t(means_var3_s2)
var3_s2_means <- as.data.frame(var3_s2_means)

row.names(var3_s2_means)[2] <- "Subject2_Walking_Downstairs"

var3_s2_means = var3_s2_means[-1, ]


var3_s3 <- subset(merged_data,Subject_Number=='3'&Activity=='Walking_Downstairs')

var3_s3$Subject_Number=NULL
var3_s3$Activity=NULL

var3_s3_means <- colMeans(var3_s3)
write.csv(var3_s3_means,file="var3_s3_means.csv")
means_var3_s3 <- read.csv("var3_s3_means.csv")

var3_s3_means <- t(means_var3_s3)
var3_s3_means <- as.data.frame(var3_s3_means)

row.names(var3_s3_means)[2] <- "Subject3_Walking_Downstairs"

var3_s3_means = var3_s3_means[-1, ]


var3_s4 <- subset(merged_data,Subject_Number=='4'&Activity=='Walking_Downstairs')

var3_s4$Subject_Number=NULL
var3_s4$Activity=NULL

var3_s4_means <- colMeans(var3_s4)
write.csv(var3_s4_means,file="var3_s4_means.csv")
means_var3_s4 <- read.csv("var3_s4_means.csv")

var3_s4_means <- t(means_var3_s4)
var3_s4_means <- as.data.frame(var3_s4_means)

row.names(var3_s4_means)[2] <- "Subject4_Walking_Downstairs"

var3_s4_means = var3_s4_means[-1, ]


var3_s5 <- subset(merged_data,Subject_Number=='5'&Activity=='Walking_Downstairs')

var3_s5$Subject_Number=NULL
var3_s5$Activity=NULL

var3_s5_means <- colMeans(var3_s5)
write.csv(var3_s5_means,file="var3_s5_means.csv")
means_var3_s5 <- read.csv("var3_s5_means.csv")

var3_s5_means <- t(means_var3_s5)
var3_s5_means <- as.data.frame(var3_s5_means)

row.names(var3_s5_means)[2] <- "Subject5_Walking_Downstairs"

var3_s5_means = var3_s5_means[-1, ]


var3_s6 <- subset(merged_data,Subject_Number=='6'&Activity=='Walking_Downstairs')

var3_s6$Subject_Number=NULL
var3_s6$Activity=NULL

var3_s6_means <- colMeans(var3_s6)
write.csv(var3_s6_means,file="var3_s6_means.csv")
means_var3_s6 <- read.csv("var3_s6_means.csv")

var3_s6_means <- t(means_var3_s6)
var3_s6_means <- as.data.frame(var3_s6_means)

row.names(var3_s6_means)[2] <- "Subject6_Walking_Downstairs"

var3_s6_means = var3_s6_means[-1, ]


var3_s7 <- subset(merged_data,Subject_Number=='7'&Activity=='Walking_Downstairs')

var3_s7$Subject_Number=NULL
var3_s7$Activity=NULL

var3_s7_means <- colMeans(var3_s7)
write.csv(var3_s7_means,file="var3_s7_means.csv")
means_var3_s7 <- read.csv("var3_s7_means.csv")

var3_s7_means <- t(means_var3_s7)
var3_s7_means <- as.data.frame(var3_s7_means)

row.names(var3_s7_means)[2] <- "Subject7_Walking_Downstairs"

var3_s7_means = var3_s7_means[-1, ]


var3_s8 <- subset(merged_data,Subject_Number=='8'&Activity=='Walking_Downstairs')

var3_s8$Subject_Number=NULL
var3_s8$Activity=NULL

var3_s8_means <- colMeans(var3_s8)
write.csv(var3_s8_means,file="var3_s8_means.csv")
means_var3_s8 <- read.csv("var3_s8_means.csv")

var3_s8_means <- t(means_var3_s8)
var3_s8_means <- as.data.frame(var3_s8_means)

row.names(var3_s8_means)[2] <- "Subject8_Walking_Downstairs"

var3_s8_means = var3_s8_means[-1, ]


var3_s9 <- subset(merged_data,Subject_Number=='9'&Activity=='Walking_Downstairs')

var3_s9$Subject_Number=NULL
var3_s9$Activity=NULL

var3_s9_means <- colMeans(var3_s9)
write.csv(var3_s9_means,file="var3_s9_means.csv")
means_var3_s9 <- read.csv("var3_s9_means.csv")

var3_s9_means <- t(means_var3_s9)
var3_s9_means <- as.data.frame(var3_s9_means)

row.names(var3_s9_means)[2] <- "Subject9_Walking_Downstairs"

var3_s9_means = var3_s9_means[-1, ]


var3_s10 <- subset(merged_data,Subject_Number=='10'&Activity=='Walking_Downstairs')

var3_s10$Subject_Number=NULL
var3_s10$Activity=NULL

var3_s10_means <- colMeans(var3_s10)
write.csv(var3_s10_means,file="var3_s10_means.csv")
means_var3_s10 <- read.csv("var3_s10_means.csv")

var3_s10_means <- t(means_var3_s10)
var3_s10_means <- as.data.frame(var3_s10_means)

row.names(var3_s10_means)[2] <- "Subject10_Walking_Downstairs"

var3_s10_means = var3_s10_means[-1, ]


var3_s11 <- subset(merged_data,Subject_Number=='11'&Activity=='Walking_Downstairs')

var3_s11$Subject_Number=NULL
var3_s11$Activity=NULL

var3_s11_means <- colMeans(var3_s11)
write.csv(var3_s11_means,file="var3_s11_means.csv")
means_var3_s11 <- read.csv("var3_s11_means.csv")

var3_s11_means <- t(means_var3_s11)
var3_s11_means <- as.data.frame(var3_s11_means)

row.names(var3_s11_means)[2] <- "Subject11_Walking_Downstairs"

var3_s11_means = var3_s11_means[-1, ]


var3_s12 <- subset(merged_data,Subject_Number=='12'&Activity=='Walking_Downstairs')

var3_s12$Subject_Number=NULL
var3_s12$Activity=NULL

var3_s12_means <- colMeans(var3_s12)
write.csv(var3_s12_means,file="var3_s12_means.csv")
means_var3_s12 <- read.csv("var3_s12_means.csv")

var3_s12_means <- t(means_var3_s12)
var3_s12_means <- as.data.frame(var3_s12_means)

row.names(var3_s12_means)[2] <- "Subject12_Walking_Downstairs"

var3_s12_means = var3_s12_means[-1, ]


var3_s13 <- subset(merged_data,Subject_Number=='13'&Activity=='Walking_Downstairs')

var3_s13$Subject_Number=NULL
var3_s13$Activity=NULL

var3_s13_means <- colMeans(var3_s13)
write.csv(var3_s13_means,file="var3_s13_means.csv")
means_var3_s13 <- read.csv("var3_s13_means.csv")

var3_s13_means <- t(means_var3_s13)
var3_s13_means <- as.data.frame(var3_s13_means)

row.names(var3_s13_means)[2] <- "Subject13_Walking_Downstairs"

var3_s13_means = var3_s13_means[-1, ]


var3_s14 <- subset(merged_data,Subject_Number=='14'&Activity=='Walking_Downstairs')

var3_s14$Subject_Number=NULL
var3_s14$Activity=NULL

var3_s14_means <- colMeans(var3_s14)
write.csv(var3_s14_means,file="var3_s14_means.csv")
means_var3_s14 <- read.csv("var3_s14_means.csv")

var3_s14_means <- t(means_var3_s14)
var3_s14_means <- as.data.frame(var3_s14_means)

row.names(var3_s14_means)[2] <- "Subject14_Walking_Downstairs"

var3_s14_means = var3_s14_means[-1, ]


var3_s15 <- subset(merged_data,Subject_Number=='15'&Activity=='Walking_Downstairs')

var3_s15$Subject_Number=NULL
var3_s15$Activity=NULL

var3_s15_means <- colMeans(var3_s15)
write.csv(var3_s15_means,file="var3_s15_means.csv")
means_var3_s15 <- read.csv("var3_s15_means.csv")

var3_s15_means <- t(means_var3_s15)
var3_s15_means <- as.data.frame(var3_s15_means)

row.names(var3_s15_means)[2] <- "Subject15_Walking_Downstairs"

var3_s15_means = var3_s15_means[-1, ]


var3_s16 <- subset(merged_data,Subject_Number=='16'&Activity=='Walking_Downstairs')

var3_s16$Subject_Number=NULL
var3_s16$Activity=NULL

var3_s16_means <- colMeans(var3_s16)
write.csv(var3_s16_means,file="var3_s16_means.csv")
means_var3_s16 <- read.csv("var3_s16_means.csv")

var3_s16_means <- t(means_var3_s16)
var3_s16_means <- as.data.frame(var3_s16_means)

row.names(var3_s16_means)[2] <- "Subject16_Walking_Downstairs"

var3_s16_means = var3_s16_means[-1, ]

var3_s17 <- subset(merged_data,Subject_Number=='17'&Activity=='Walking_Downstairs')

var3_s17$Subject_Number=NULL
var3_s17$Activity=NULL

var3_s17_means <- colMeans(var3_s17)
write.csv(var3_s17_means,file="var3_s17_means.csv")
means_var3_s17 <- read.csv("var3_s17_means.csv")

var3_s17_means <- t(means_var3_s17)
var3_s17_means <- as.data.frame(var3_s17_means)

row.names(var3_s17_means)[2] <- "Subject17_Walking_Downstairs"

var3_s17_means = var3_s17_means[-1, ]


var3_s18 <- subset(merged_data,Subject_Number=='18'&Activity=='Walking_Downstairs')

var3_s18$Subject_Number=NULL
var3_s18$Activity=NULL

var3_s18_means <- colMeans(var3_s18)
write.csv(var3_s18_means,file="var3_s18_means.csv")
means_var3_s18 <- read.csv("var3_s18_means.csv")

var3_s18_means <- t(means_var3_s18)
var3_s18_means <- as.data.frame(var3_s18_means)

row.names(var3_s18_means)[2] <- "Subject18_Walking_Downstairs"

var3_s18_means = var3_s18_means[-1, ]


var3_s19 <- subset(merged_data,Subject_Number=='19'&Activity=='Walking_Downstairs')

var3_s19$Subject_Number=NULL
var3_s19$Activity=NULL

var3_s19_means <- colMeans(var3_s19)
write.csv(var3_s19_means,file="var3_s19_means.csv")
means_var3_s19 <- read.csv("var3_s19_means.csv")

var3_s19_means <- t(means_var3_s19)
var3_s19_means <- as.data.frame(var3_s19_means)

row.names(var3_s19_means)[2] <- "Subject19_Walking_Downstairs"

var3_s19_means = var3_s19_means[-1, ]


var3_s20 <- subset(merged_data,Subject_Number=='20'&Activity=='Walking_Downstairs')

var3_s20$Subject_Number=NULL
var3_s20$Activity=NULL

var3_s20_means <- colMeans(var3_s20)
write.csv(var3_s20_means,file="var3_s20_means.csv")
means_var3_s20 <- read.csv("var3_s20_means.csv")

var3_s20_means <- t(means_var3_s20)
var3_s20_means <- as.data.frame(var3_s20_means)

row.names(var3_s20_means)[2] <- "Subject20_Walking_Downstairs"

var3_s20_means = var3_s20_means[-1, ]


var3_s21 <- subset(merged_data,Subject_Number=='21'&Activity=='Walking_Downstairs')

var3_s21$Subject_Number=NULL
var3_s21$Activity=NULL

var3_s21_means <- colMeans(var3_s21)
write.csv(var3_s21_means,file="var3_s21_means.csv")
means_var3_s21 <- read.csv("var3_s21_means.csv")

var3_s21_means <- t(means_var3_s21)
var3_s21_means <- as.data.frame(var3_s21_means)

row.names(var3_s21_means)[2] <- "Subject21_Walking_Downstairs"

var3_s21_means = var3_s21_means[-1, ]


var3_s22 <- subset(merged_data,Subject_Number=='22'&Activity=='Walking_Downstairs')

var3_s22$Subject_Number=NULL
var3_s22$Activity=NULL

var3_s22_means <- colMeans(var3_s22)
write.csv(var3_s22_means,file="var3_s22_means.csv")
means_var3_s22 <- read.csv("var3_s22_means.csv")

var3_s22_means <- t(means_var3_s22)
var3_s22_means <- as.data.frame(var3_s22_means)

row.names(var3_s22_means)[2] <- "Subject22_Walking_Downstairs"

var3_s22_means = var3_s22_means[-1, ]


var3_s23 <- subset(merged_data,Subject_Number=='23'&Activity=='Walking_Downstairs')

var3_s23$Subject_Number=NULL
var3_s23$Activity=NULL

var3_s23_means <- colMeans(var3_s23)
write.csv(var3_s23_means,file="var3_s23_means.csv")
means_var3_s23 <- read.csv("var3_s23_means.csv")

var3_s23_means <- t(means_var3_s23)
var3_s23_means <- as.data.frame(var3_s23_means)

row.names(var3_s23_means)[2] <- "Subject23_Walking_Downstairs"

var3_s23_means = var3_s23_means[-1, ]


var3_s24 <- subset(merged_data,Subject_Number=='24'&Activity=='Walking_Downstairs')

var3_s24$Subject_Number=NULL
var3_s24$Activity=NULL

var3_s24_means <- colMeans(var3_s24)
write.csv(var3_s24_means,file="var3_s24_means.csv")
means_var3_s24 <- read.csv("var3_s24_means.csv")

var3_s24_means <- t(means_var3_s24)
var3_s24_means <- as.data.frame(var3_s24_means)

row.names(var3_s24_means)[2] <- "Subject24_Walking_Downstairs"

var3_s24_means = var3_s24_means[-1, ]


var3_s25 <- subset(merged_data,Subject_Number=='25'&Activity=='Walking_Downstairs')

var3_s25$Subject_Number=NULL
var3_s25$Activity=NULL

var3_s25_means <- colMeans(var3_s25)
write.csv(var3_s25_means,file="var3_s25_means.csv")
means_var3_s25 <- read.csv("var3_s25_means.csv")

var3_s25_means <- t(means_var3_s25)
var3_s25_means <- as.data.frame(var3_s25_means)

row.names(var3_s25_means)[2] <- "Subject25_Walking_Downstairs"

var3_s25_means = var3_s25_means[-1, ]


var3_s26 <- subset(merged_data,Subject_Number=='26'&Activity=='Walking_Downstairs')

var3_s26$Subject_Number=NULL
var3_s26$Activity=NULL

var3_s26_means <- colMeans(var3_s26)
write.csv(var3_s26_means,file="var3_s26_means.csv")
means_var3_s26 <- read.csv("var3_s26_means.csv")

var3_s26_means <- t(means_var3_s26)
var3_s26_means <- as.data.frame(var3_s26_means)

row.names(var3_s26_means)[2] <- "Subject26_Walking_Downstairs"

var3_s26_means = var3_s26_means[-1, ]


var3_s27 <- subset(merged_data,Subject_Number=='27'&Activity=='Walking_Downstairs')

var3_s27$Subject_Number=NULL
var3_s27$Activity=NULL

var3_s27_means <- colMeans(var3_s27)
write.csv(var3_s27_means,file="var3_s27_means.csv")
means_var3_s27 <- read.csv("var3_s27_means.csv")

var3_s27_means <- t(means_var3_s27)
var3_s27_means <- as.data.frame(var3_s27_means)

row.names(var3_s27_means)[2] <- "Subject27_Walking_Downstairs"

var3_s27_means = var3_s27_means[-1, ]


var3_s28 <- subset(merged_data,Subject_Number=='28'&Activity=='Walking_Downstairs')

var3_s28$Subject_Number=NULL
var3_s28$Activity=NULL

var3_s28_means <- colMeans(var3_s28)
write.csv(var3_s28_means,file="var3_s28_means.csv")
means_var3_s28 <- read.csv("var3_s28_means.csv")

var3_s28_means <- t(means_var3_s28)
var3_s28_means <- as.data.frame(var3_s28_means)

row.names(var3_s28_means)[2] <- "Subject28_Walking_Downstairs"

var3_s28_means = var3_s28_means[-1, ]


var3_s29 <- subset(merged_data,Subject_Number=='29'&Activity=='Walking_Downstairs')

var3_s29$Subject_Number=NULL
var3_s29$Activity=NULL

var3_s29_means <- colMeans(var3_s29)
write.csv(var3_s29_means,file="var3_s29_means.csv")
means_var3_s29 <- read.csv("var3_s29_means.csv")

var3_s29_means <- t(means_var3_s29)
var3_s29_means <- as.data.frame(var3_s29_means)

row.names(var3_s29_means)[2] <- "Subject29_Walking_Downstairs"

var3_s29_means = var3_s29_means[-1, ]


var3_s30 <- subset(merged_data,Subject_Number=='30'&Activity=='Walking_Downstairs')

var3_s30$Subject_Number=NULL
var3_s30$Activity=NULL

var3_s30_means <- colMeans(var3_s30)
write.csv(var3_s30_means,file="var3_s30_means.csv")
means_var3_s30 <- read.csv("var3_s30_means.csv")

var3_s30_means <- t(means_var3_s30)
var3_s30_means <- as.data.frame(var3_s30_means)

row.names(var3_s30_means)[2] <- "Subject30_Walking_Downstairs"

var3_s30_means = var3_s30_means[-1, ]



# Repeat for activity 4... 

var4_s1 <- subset(merged_data,Subject_Number=='2'&Activity=='Sitting')

var4_s1$Subject_Number=NULL
var4_s1$Activity=NULL

var4_s1_means <- colMeans(var4_s1)
write.csv(var4_s1_means,file="var4_s1_means.csv")
means_var4_s1 <- read.csv("var4_s1_means.csv")

var4_s1_means <- t(means_var4_s1)
var4_s1_means <- as.data.frame(var4_s1_means)

row.names(var4_s1_means)[2] <- "Subject1_Sitting"

var4_s1_means = var4_s1_means[-1, ]


var4_s2 <- subset(merged_data,Subject_Number=='2'&Activity=='Sitting')

var4_s2$Subject_Number=NULL
var4_s2$Activity=NULL

var4_s2_means <- colMeans(var4_s2)
write.csv(var4_s2_means,file="var4_s2_means.csv")
means_var4_s2 <- read.csv("var4_s2_means.csv")

var4_s2_means <- t(means_var4_s2)
var4_s2_means <- as.data.frame(var4_s2_means)

row.names(var4_s2_means)[2] <- "Subject2_Sitting"

var4_s2_means = var4_s2_means[-1, ]


var4_s3 <- subset(merged_data,Subject_Number=='3'&Activity=='Sitting')

var4_s3$Subject_Number=NULL
var4_s3$Activity=NULL

var4_s3_means <- colMeans(var4_s3)
write.csv(var4_s3_means,file="var4_s3_means.csv")
means_var4_s3 <- read.csv("var4_s3_means.csv")

var4_s3_means <- t(means_var4_s3)
var4_s3_means <- as.data.frame(var4_s3_means)

row.names(var4_s3_means)[2] <- "Subject3_Sitting"

var4_s3_means = var4_s3_means[-1, ]


var4_s4 <- subset(merged_data,Subject_Number=='4'&Activity=='Sitting')

var4_s4$Subject_Number=NULL
var4_s4$Activity=NULL

var4_s4_means <- colMeans(var4_s4)
write.csv(var4_s4_means,file="var4_s4_means.csv")
means_var4_s4 <- read.csv("var4_s4_means.csv")

var4_s4_means <- t(means_var4_s4)
var4_s4_means <- as.data.frame(var4_s4_means)

row.names(var4_s4_means)[2] <- "Subject4_Sitting"

var4_s4_means = var4_s4_means[-1, ]


var4_s5 <- subset(merged_data,Subject_Number=='5'&Activity=='Sitting')

var4_s5$Subject_Number=NULL
var4_s5$Activity=NULL

var4_s5_means <- colMeans(var4_s5)
write.csv(var4_s5_means,file="var4_s5_means.csv")
means_var4_s5 <- read.csv("var4_s5_means.csv")

var4_s5_means <- t(means_var4_s5)
var4_s5_means <- as.data.frame(var4_s5_means)

row.names(var4_s5_means)[2] <- "Subject5_Sitting"

var4_s5_means = var4_s5_means[-1, ]


var4_s6 <- subset(merged_data,Subject_Number=='6'&Activity=='Sitting')

var4_s6$Subject_Number=NULL
var4_s6$Activity=NULL

var4_s6_means <- colMeans(var4_s6)
write.csv(var4_s6_means,file="var4_s6_means.csv")
means_var4_s6 <- read.csv("var4_s6_means.csv")

var4_s6_means <- t(means_var4_s6)
var4_s6_means <- as.data.frame(var4_s6_means)

row.names(var4_s6_means)[2] <- "Subject6_Sitting"

var4_s6_means = var4_s6_means[-1, ]


var4_s7 <- subset(merged_data,Subject_Number=='7'&Activity=='Sitting')

var4_s7$Subject_Number=NULL
var4_s7$Activity=NULL

var4_s7_means <- colMeans(var4_s7)
write.csv(var4_s7_means,file="var4_s7_means.csv")
means_var4_s7 <- read.csv("var4_s7_means.csv")

var4_s7_means <- t(means_var4_s7)
var4_s7_means <- as.data.frame(var4_s7_means)

row.names(var4_s7_means)[2] <- "Subject7_Sitting"

var4_s7_means = var4_s7_means[-1, ]


var4_s8 <- subset(merged_data,Subject_Number=='8'&Activity=='Sitting')

var4_s8$Subject_Number=NULL
var4_s8$Activity=NULL

var4_s8_means <- colMeans(var4_s8)
write.csv(var4_s8_means,file="var4_s8_means.csv")
means_var4_s8 <- read.csv("var4_s8_means.csv")

var4_s8_means <- t(means_var4_s8)
var4_s8_means <- as.data.frame(var4_s8_means)

row.names(var4_s8_means)[2] <- "Subject8_Sitting"

var4_s8_means = var4_s8_means[-1, ]


var4_s9 <- subset(merged_data,Subject_Number=='9'&Activity=='Sitting')

var4_s9$Subject_Number=NULL
var4_s9$Activity=NULL

var4_s9_means <- colMeans(var4_s9)
write.csv(var4_s9_means,file="var4_s9_means.csv")
means_var4_s9 <- read.csv("var4_s9_means.csv")

var4_s9_means <- t(means_var4_s9)
var4_s9_means <- as.data.frame(var4_s9_means)

row.names(var4_s9_means)[2] <- "Subject9_Sitting"

var4_s9_means = var4_s9_means[-1, ]


var4_s10 <- subset(merged_data,Subject_Number=='10'&Activity=='Sitting')

var4_s10$Subject_Number=NULL
var4_s10$Activity=NULL

var4_s10_means <- colMeans(var4_s10)
write.csv(var4_s10_means,file="var4_s10_means.csv")
means_var4_s10 <- read.csv("var4_s10_means.csv")

var4_s10_means <- t(means_var4_s10)
var4_s10_means <- as.data.frame(var4_s10_means)

row.names(var4_s10_means)[2] <- "Subject10_Sitting"

var4_s10_means = var4_s10_means[-1, ]


var4_s11 <- subset(merged_data,Subject_Number=='11'&Activity=='Sitting')

var4_s11$Subject_Number=NULL
var4_s11$Activity=NULL

var4_s11_means <- colMeans(var4_s11)
write.csv(var4_s11_means,file="var4_s11_means.csv")
means_var4_s11 <- read.csv("var4_s11_means.csv")

var4_s11_means <- t(means_var4_s11)
var4_s11_means <- as.data.frame(var4_s11_means)

row.names(var4_s11_means)[2] <- "Subject11_Sitting"

var4_s11_means = var4_s11_means[-1, ]


var4_s12 <- subset(merged_data,Subject_Number=='12'&Activity=='Sitting')

var4_s12$Subject_Number=NULL
var4_s12$Activity=NULL

var4_s12_means <- colMeans(var4_s12)
write.csv(var4_s12_means,file="var4_s12_means.csv")
means_var4_s12 <- read.csv("var4_s12_means.csv")

var4_s12_means <- t(means_var4_s12)
var4_s12_means <- as.data.frame(var4_s12_means)

row.names(var4_s12_means)[2] <- "Subject12_Sitting"

var4_s12_means = var4_s12_means[-1, ]


var4_s13 <- subset(merged_data,Subject_Number=='13'&Activity=='Sitting')

var4_s13$Subject_Number=NULL
var4_s13$Activity=NULL

var4_s13_means <- colMeans(var4_s13)
write.csv(var4_s13_means,file="var4_s13_means.csv")
means_var4_s13 <- read.csv("var4_s13_means.csv")

var4_s13_means <- t(means_var4_s13)
var4_s13_means <- as.data.frame(var4_s13_means)

row.names(var4_s13_means)[2] <- "Subject13_Sitting"

var4_s13_means = var4_s13_means[-1, ]


var4_s14 <- subset(merged_data,Subject_Number=='14'&Activity=='Sitting')

var4_s14$Subject_Number=NULL
var4_s14$Activity=NULL

var4_s14_means <- colMeans(var4_s14)
write.csv(var4_s14_means,file="var4_s14_means.csv")
means_var4_s14 <- read.csv("var4_s14_means.csv")

var4_s14_means <- t(means_var4_s14)
var4_s14_means <- as.data.frame(var4_s14_means)

row.names(var4_s14_means)[2] <- "Subject14_Sitting"

var4_s14_means = var4_s14_means[-1, ]


var4_s15 <- subset(merged_data,Subject_Number=='15'&Activity=='Sitting')

var4_s15$Subject_Number=NULL
var4_s15$Activity=NULL

var4_s15_means <- colMeans(var4_s15)
write.csv(var4_s15_means,file="var4_s15_means.csv")
means_var4_s15 <- read.csv("var4_s15_means.csv")

var4_s15_means <- t(means_var4_s15)
var4_s15_means <- as.data.frame(var4_s15_means)

row.names(var4_s15_means)[2] <- "Subject15_Sitting"

var4_s15_means = var4_s15_means[-1, ]


var4_s16 <- subset(merged_data,Subject_Number=='16'&Activity=='Sitting')

var4_s16$Subject_Number=NULL
var4_s16$Activity=NULL

var4_s16_means <- colMeans(var4_s16)
write.csv(var4_s16_means,file="var4_s16_means.csv")
means_var4_s16 <- read.csv("var4_s16_means.csv")

var4_s16_means <- t(means_var4_s16)
var4_s16_means <- as.data.frame(var4_s16_means)

row.names(var4_s16_means)[2] <- "Subject16_Sitting"

var4_s16_means = var4_s16_means[-1, ]

var4_s17 <- subset(merged_data,Subject_Number=='17'&Activity=='Sitting')

var4_s17$Subject_Number=NULL
var4_s17$Activity=NULL

var4_s17_means <- colMeans(var4_s17)
write.csv(var4_s17_means,file="var4_s17_means.csv")
means_var4_s17 <- read.csv("var4_s17_means.csv")

var4_s17_means <- t(means_var4_s17)
var4_s17_means <- as.data.frame(var4_s17_means)

row.names(var4_s17_means)[2] <- "Subject17_Sitting"

var4_s17_means = var4_s17_means[-1, ]


var4_s18 <- subset(merged_data,Subject_Number=='18'&Activity=='Sitting')

var4_s18$Subject_Number=NULL
var4_s18$Activity=NULL

var4_s18_means <- colMeans(var4_s18)
write.csv(var4_s18_means,file="var4_s18_means.csv")
means_var4_s18 <- read.csv("var4_s18_means.csv")

var4_s18_means <- t(means_var4_s18)
var4_s18_means <- as.data.frame(var4_s18_means)

row.names(var4_s18_means)[2] <- "Subject18_Sitting"

var4_s18_means = var4_s18_means[-1, ]


var4_s19 <- subset(merged_data,Subject_Number=='19'&Activity=='Sitting')

var4_s19$Subject_Number=NULL
var4_s19$Activity=NULL

var4_s19_means <- colMeans(var4_s19)
write.csv(var4_s19_means,file="var4_s19_means.csv")
means_var4_s19 <- read.csv("var4_s19_means.csv")

var4_s19_means <- t(means_var4_s19)
var4_s19_means <- as.data.frame(var4_s19_means)

row.names(var4_s19_means)[2] <- "Subject19_Sitting"

var4_s19_means = var4_s19_means[-1, ]


var4_s20 <- subset(merged_data,Subject_Number=='20'&Activity=='Sitting')

var4_s20$Subject_Number=NULL
var4_s20$Activity=NULL

var4_s20_means <- colMeans(var4_s20)
write.csv(var4_s20_means,file="var4_s20_means.csv")
means_var4_s20 <- read.csv("var4_s20_means.csv")

var4_s20_means <- t(means_var4_s20)
var4_s20_means <- as.data.frame(var4_s20_means)

row.names(var4_s20_means)[2] <- "Subject20_Sitting"

var4_s20_means = var4_s20_means[-1, ]


var4_s21 <- subset(merged_data,Subject_Number=='21'&Activity=='Sitting')

var4_s21$Subject_Number=NULL
var4_s21$Activity=NULL

var4_s21_means <- colMeans(var4_s21)
write.csv(var4_s21_means,file="var4_s21_means.csv")
means_var4_s21 <- read.csv("var4_s21_means.csv")

var4_s21_means <- t(means_var4_s21)
var4_s21_means <- as.data.frame(var4_s21_means)

row.names(var4_s21_means)[2] <- "Subject21_Sitting"

var4_s21_means = var4_s21_means[-1, ]


var4_s22 <- subset(merged_data,Subject_Number=='22'&Activity=='Sitting')

var4_s22$Subject_Number=NULL
var4_s22$Activity=NULL

var4_s22_means <- colMeans(var4_s22)
write.csv(var4_s22_means,file="var4_s22_means.csv")
means_var4_s22 <- read.csv("var4_s22_means.csv")

var4_s22_means <- t(means_var4_s22)
var4_s22_means <- as.data.frame(var4_s22_means)

row.names(var4_s22_means)[2] <- "Subject22_Sitting"

var4_s22_means = var4_s22_means[-1, ]


var4_s23 <- subset(merged_data,Subject_Number=='23'&Activity=='Sitting')

var4_s23$Subject_Number=NULL
var4_s23$Activity=NULL

var4_s23_means <- colMeans(var4_s23)
write.csv(var4_s23_means,file="var4_s23_means.csv")
means_var4_s23 <- read.csv("var4_s23_means.csv")

var4_s23_means <- t(means_var4_s23)
var4_s23_means <- as.data.frame(var4_s23_means)

row.names(var4_s23_means)[2] <- "Subject23_Sitting"

var4_s23_means = var4_s23_means[-1, ]


var4_s24 <- subset(merged_data,Subject_Number=='24'&Activity=='Sitting')

var4_s24$Subject_Number=NULL
var4_s24$Activity=NULL

var4_s24_means <- colMeans(var4_s24)
write.csv(var4_s24_means,file="var4_s24_means.csv")
means_var4_s24 <- read.csv("var4_s24_means.csv")

var4_s24_means <- t(means_var4_s24)
var4_s24_means <- as.data.frame(var4_s24_means)

row.names(var4_s24_means)[2] <- "Subject24_Sitting"

var4_s24_means = var4_s24_means[-1, ]


var4_s25 <- subset(merged_data,Subject_Number=='25'&Activity=='Sitting')

var4_s25$Subject_Number=NULL
var4_s25$Activity=NULL

var4_s25_means <- colMeans(var4_s25)
write.csv(var4_s25_means,file="var4_s25_means.csv")
means_var4_s25 <- read.csv("var4_s25_means.csv")

var4_s25_means <- t(means_var4_s25)
var4_s25_means <- as.data.frame(var4_s25_means)

row.names(var4_s25_means)[2] <- "Subject25_Sitting"

var4_s25_means = var4_s25_means[-1, ]


var4_s26 <- subset(merged_data,Subject_Number=='26'&Activity=='Sitting')

var4_s26$Subject_Number=NULL
var4_s26$Activity=NULL

var4_s26_means <- colMeans(var4_s26)
write.csv(var4_s26_means,file="var4_s26_means.csv")
means_var4_s26 <- read.csv("var4_s26_means.csv")

var4_s26_means <- t(means_var4_s26)
var4_s26_means <- as.data.frame(var4_s26_means)

row.names(var4_s26_means)[2] <- "Subject26_Sitting"

var4_s26_means = var4_s26_means[-1, ]


var4_s27 <- subset(merged_data,Subject_Number=='27'&Activity=='Sitting')

var4_s27$Subject_Number=NULL
var4_s27$Activity=NULL

var4_s27_means <- colMeans(var4_s27)
write.csv(var4_s27_means,file="var4_s27_means.csv")
means_var4_s27 <- read.csv("var4_s27_means.csv")

var4_s27_means <- t(means_var4_s27)
var4_s27_means <- as.data.frame(var4_s27_means)

row.names(var4_s27_means)[2] <- "Subject27_Sitting"

var4_s27_means = var4_s27_means[-1, ]


var4_s28 <- subset(merged_data,Subject_Number=='28'&Activity=='Sitting')

var4_s28$Subject_Number=NULL
var4_s28$Activity=NULL

var4_s28_means <- colMeans(var4_s28)
write.csv(var4_s28_means,file="var4_s28_means.csv")
means_var4_s28 <- read.csv("var4_s28_means.csv")

var4_s28_means <- t(means_var4_s28)
var4_s28_means <- as.data.frame(var4_s28_means)

row.names(var4_s28_means)[2] <- "Subject28_Sitting"

var4_s28_means = var4_s28_means[-1, ]


var4_s29 <- subset(merged_data,Subject_Number=='29'&Activity=='Sitting')

var4_s29$Subject_Number=NULL
var4_s29$Activity=NULL

var4_s29_means <- colMeans(var4_s29)
write.csv(var4_s29_means,file="var4_s29_means.csv")
means_var4_s29 <- read.csv("var4_s29_means.csv")

var4_s29_means <- t(means_var4_s29)
var4_s29_means <- as.data.frame(var4_s29_means)

row.names(var4_s29_means)[2] <- "Subject29_Sitting"

var4_s29_means = var4_s29_means[-1, ]


var4_s30 <- subset(merged_data,Subject_Number=='30'&Activity=='Sitting')

var4_s30$Subject_Number=NULL
var4_s30$Activity=NULL

var4_s30_means <- colMeans(var4_s30)
write.csv(var4_s30_means,file="var4_s30_means.csv")
means_var4_s30 <- read.csv("var4_s30_means.csv")

var4_s30_means <- t(means_var4_s30)
var4_s30_means <- as.data.frame(var4_s30_means)

row.names(var4_s30_means)[2] <- "Subject30_Sitting"

var4_s30_means = var4_s30_means[-1, ]




# Repeat for activity 5... 


var5_s1 <- subset(merged_data,Subject_Number=='2'&Activity=='Standing')

var5_s1$Subject_Number=NULL
var5_s1$Activity=NULL

var5_s1_means <- colMeans(var5_s1)
write.csv(var5_s1_means,file="var5_s1_means.csv")
means_var5_s1 <- read.csv("var5_s1_means.csv")

var5_s1_means <- t(means_var5_s1)
var5_s1_means <- as.data.frame(var5_s1_means)

row.names(var5_s1_means)[2] <- "Subject1_Standing"

var5_s1_means = var5_s1_means[-1, ]

var5_s2 <- subset(merged_data,Subject_Number=='2'&Activity=='Standing')

var5_s2$Subject_Number=NULL
var5_s2$Activity=NULL

var5_s2_means <- colMeans(var5_s2)
write.csv(var5_s2_means,file="var5_s2_means.csv")
means_var5_s2 <- read.csv("var5_s2_means.csv")

var5_s2_means <- t(means_var5_s2)
var5_s2_means <- as.data.frame(var5_s2_means)

row.names(var5_s2_means)[2] <- "Subject2_Standing"

var5_s2_means = var5_s2_means[-1, ]


var5_s3 <- subset(merged_data,Subject_Number=='3'&Activity=='Standing')

var5_s3$Subject_Number=NULL
var5_s3$Activity=NULL

var5_s3_means <- colMeans(var5_s3)
write.csv(var5_s3_means,file="var5_s3_means.csv")
means_var5_s3 <- read.csv("var5_s3_means.csv")

var5_s3_means <- t(means_var5_s3)
var5_s3_means <- as.data.frame(var5_s3_means)

row.names(var5_s3_means)[2] <- "Subject3_Standing"

var5_s3_means = var5_s3_means[-1, ]


var5_s4 <- subset(merged_data,Subject_Number=='4'&Activity=='Standing')

var5_s4$Subject_Number=NULL
var5_s4$Activity=NULL

var5_s4_means <- colMeans(var5_s4)
write.csv(var5_s4_means,file="var5_s4_means.csv")
means_var5_s4 <- read.csv("var5_s4_means.csv")

var5_s4_means <- t(means_var5_s4)
var5_s4_means <- as.data.frame(var5_s4_means)

row.names(var5_s4_means)[2] <- "Subject4_Standing"

var5_s4_means = var5_s4_means[-1, ]


var5_s5 <- subset(merged_data,Subject_Number=='5'&Activity=='Standing')

var5_s5$Subject_Number=NULL
var5_s5$Activity=NULL

var5_s5_means <- colMeans(var5_s5)
write.csv(var5_s5_means,file="var5_s5_means.csv")
means_var5_s5 <- read.csv("var5_s5_means.csv")

var5_s5_means <- t(means_var5_s5)
var5_s5_means <- as.data.frame(var5_s5_means)

row.names(var5_s5_means)[2] <- "Subject5_Standing"

var5_s5_means = var5_s5_means[-1, ]


var5_s6 <- subset(merged_data,Subject_Number=='6'&Activity=='Standing')

var5_s6$Subject_Number=NULL
var5_s6$Activity=NULL

var5_s6_means <- colMeans(var5_s6)
write.csv(var5_s6_means,file="var5_s6_means.csv")
means_var5_s6 <- read.csv("var5_s6_means.csv")

var5_s6_means <- t(means_var5_s6)
var5_s6_means <- as.data.frame(var5_s6_means)

row.names(var5_s6_means)[2] <- "Subject6_Standing"

var5_s6_means = var5_s6_means[-1, ]


var5_s7 <- subset(merged_data,Subject_Number=='7'&Activity=='Standing')

var5_s7$Subject_Number=NULL
var5_s7$Activity=NULL

var5_s7_means <- colMeans(var5_s7)
write.csv(var5_s7_means,file="var5_s7_means.csv")
means_var5_s7 <- read.csv("var5_s7_means.csv")

var5_s7_means <- t(means_var5_s7)
var5_s7_means <- as.data.frame(var5_s7_means)

row.names(var5_s7_means)[2] <- "Subject7_Standing"

var5_s7_means = var5_s7_means[-1, ]


var5_s8 <- subset(merged_data,Subject_Number=='8'&Activity=='Standing')

var5_s8$Subject_Number=NULL
var5_s8$Activity=NULL

var5_s8_means <- colMeans(var5_s8)
write.csv(var5_s8_means,file="var5_s8_means.csv")
means_var5_s8 <- read.csv("var5_s8_means.csv")

var5_s8_means <- t(means_var5_s8)
var5_s8_means <- as.data.frame(var5_s8_means)

row.names(var5_s8_means)[2] <- "Subject8_Standing"

var5_s8_means = var5_s8_means[-1, ]


var5_s9 <- subset(merged_data,Subject_Number=='9'&Activity=='Standing')

var5_s9$Subject_Number=NULL
var5_s9$Activity=NULL

var5_s9_means <- colMeans(var5_s9)
write.csv(var5_s9_means,file="var5_s9_means.csv")
means_var5_s9 <- read.csv("var5_s9_means.csv")

var5_s9_means <- t(means_var5_s9)
var5_s9_means <- as.data.frame(var5_s9_means)

row.names(var5_s9_means)[2] <- "Subject9_Standing"

var5_s9_means = var5_s9_means[-1, ]


var5_s10 <- subset(merged_data,Subject_Number=='10'&Activity=='Standing')

var5_s10$Subject_Number=NULL
var5_s10$Activity=NULL

var5_s10_means <- colMeans(var5_s10)
write.csv(var5_s10_means,file="var5_s10_means.csv")
means_var5_s10 <- read.csv("var5_s10_means.csv")

var5_s10_means <- t(means_var5_s10)
var5_s10_means <- as.data.frame(var5_s10_means)

row.names(var5_s10_means)[2] <- "Subject10_Standing"

var5_s10_means = var5_s10_means[-1, ]


var5_s11 <- subset(merged_data,Subject_Number=='11'&Activity=='Standing')

var5_s11$Subject_Number=NULL
var5_s11$Activity=NULL

var5_s11_means <- colMeans(var5_s11)
write.csv(var5_s11_means,file="var5_s11_means.csv")
means_var5_s11 <- read.csv("var5_s11_means.csv")

var5_s11_means <- t(means_var5_s11)
var5_s11_means <- as.data.frame(var5_s11_means)

row.names(var5_s11_means)[2] <- "Subject11_Standing"

var5_s11_means = var5_s11_means[-1, ]


var5_s12 <- subset(merged_data,Subject_Number=='12'&Activity=='Standing')

var5_s12$Subject_Number=NULL
var5_s12$Activity=NULL

var5_s12_means <- colMeans(var5_s12)
write.csv(var5_s12_means,file="var5_s12_means.csv")
means_var5_s12 <- read.csv("var5_s12_means.csv")

var5_s12_means <- t(means_var5_s12)
var5_s12_means <- as.data.frame(var5_s12_means)

row.names(var5_s12_means)[2] <- "Subject12_Standing"

var5_s12_means = var5_s12_means[-1, ]


var5_s13 <- subset(merged_data,Subject_Number=='13'&Activity=='Standing')

var5_s13$Subject_Number=NULL
var5_s13$Activity=NULL

var5_s13_means <- colMeans(var5_s13)
write.csv(var5_s13_means,file="var5_s13_means.csv")
means_var5_s13 <- read.csv("var5_s13_means.csv")

var5_s13_means <- t(means_var5_s13)
var5_s13_means <- as.data.frame(var5_s13_means)

row.names(var5_s13_means)[2] <- "Subject13_Standing"

var5_s13_means = var5_s13_means[-1, ]


var5_s14 <- subset(merged_data,Subject_Number=='14'&Activity=='Standing')

var5_s14$Subject_Number=NULL
var5_s14$Activity=NULL

var5_s14_means <- colMeans(var5_s14)
write.csv(var5_s14_means,file="var5_s14_means.csv")
means_var5_s14 <- read.csv("var5_s14_means.csv")

var5_s14_means <- t(means_var5_s14)
var5_s14_means <- as.data.frame(var5_s14_means)

row.names(var5_s14_means)[2] <- "Subject14_Standing"

var5_s14_means = var5_s14_means[-1, ]


var5_s15 <- subset(merged_data,Subject_Number=='15'&Activity=='Standing')

var5_s15$Subject_Number=NULL
var5_s15$Activity=NULL

var5_s15_means <- colMeans(var5_s15)
write.csv(var5_s15_means,file="var5_s15_means.csv")
means_var5_s15 <- read.csv("var5_s15_means.csv")

var5_s15_means <- t(means_var5_s15)
var5_s15_means <- as.data.frame(var5_s15_means)

row.names(var5_s15_means)[2] <- "Subject15_Standing"

var5_s15_means = var5_s15_means[-1, ]


var5_s16 <- subset(merged_data,Subject_Number=='16'&Activity=='Standing')

var5_s16$Subject_Number=NULL
var5_s16$Activity=NULL

var5_s16_means <- colMeans(var5_s16)
write.csv(var5_s16_means,file="var5_s16_means.csv")
means_var5_s16 <- read.csv("var5_s16_means.csv")

var5_s16_means <- t(means_var5_s16)
var5_s16_means <- as.data.frame(var5_s16_means)

row.names(var5_s16_means)[2] <- "Subject16_Standing"

var5_s16_means = var5_s16_means[-1, ]

var5_s17 <- subset(merged_data,Subject_Number=='17'&Activity=='Standing')

var5_s17$Subject_Number=NULL
var5_s17$Activity=NULL

var5_s17_means <- colMeans(var5_s17)
write.csv(var5_s17_means,file="var5_s17_means.csv")
means_var5_s17 <- read.csv("var5_s17_means.csv")

var5_s17_means <- t(means_var5_s17)
var5_s17_means <- as.data.frame(var5_s17_means)

row.names(var5_s17_means)[2] <- "Subject17_Standing"

var5_s17_means = var5_s17_means[-1, ]


var5_s18 <- subset(merged_data,Subject_Number=='18'&Activity=='Standing')

var5_s18$Subject_Number=NULL
var5_s18$Activity=NULL

var5_s18_means <- colMeans(var5_s18)
write.csv(var5_s18_means,file="var5_s18_means.csv")
means_var5_s18 <- read.csv("var5_s18_means.csv")

var5_s18_means <- t(means_var5_s18)
var5_s18_means <- as.data.frame(var5_s18_means)

row.names(var5_s18_means)[2] <- "Subject18_Standing"

var5_s18_means = var5_s18_means[-1, ]


var5_s19 <- subset(merged_data,Subject_Number=='19'&Activity=='Standing')

var5_s19$Subject_Number=NULL
var5_s19$Activity=NULL

var5_s19_means <- colMeans(var5_s19)
write.csv(var5_s19_means,file="var5_s19_means.csv")
means_var5_s19 <- read.csv("var5_s19_means.csv")

var5_s19_means <- t(means_var5_s19)
var5_s19_means <- as.data.frame(var5_s19_means)

row.names(var5_s19_means)[2] <- "Subject19_Standing"

var5_s19_means = var5_s19_means[-1, ]


var5_s20 <- subset(merged_data,Subject_Number=='20'&Activity=='Standing')

var5_s20$Subject_Number=NULL
var5_s20$Activity=NULL

var5_s20_means <- colMeans(var5_s20)
write.csv(var5_s20_means,file="var5_s20_means.csv")
means_var5_s20 <- read.csv("var5_s20_means.csv")

var5_s20_means <- t(means_var5_s20)
var5_s20_means <- as.data.frame(var5_s20_means)

row.names(var5_s20_means)[2] <- "Subject20_Standing"

var5_s20_means = var5_s20_means[-1, ]


var5_s21 <- subset(merged_data,Subject_Number=='21'&Activity=='Standing')

var5_s21$Subject_Number=NULL
var5_s21$Activity=NULL

var5_s21_means <- colMeans(var5_s21)
write.csv(var5_s21_means,file="var5_s21_means.csv")
means_var5_s21 <- read.csv("var5_s21_means.csv")

var5_s21_means <- t(means_var5_s21)
var5_s21_means <- as.data.frame(var5_s21_means)

row.names(var5_s21_means)[2] <- "Subject21_Standing"

var5_s21_means = var5_s21_means[-1, ]


var5_s22 <- subset(merged_data,Subject_Number=='22'&Activity=='Standing')

var5_s22$Subject_Number=NULL
var5_s22$Activity=NULL

var5_s22_means <- colMeans(var5_s22)
write.csv(var5_s22_means,file="var5_s22_means.csv")
means_var5_s22 <- read.csv("var5_s22_means.csv")

var5_s22_means <- t(means_var5_s22)
var5_s22_means <- as.data.frame(var5_s22_means)

row.names(var5_s22_means)[2] <- "Subject22_Standing"

var5_s22_means = var5_s22_means[-1, ]


var5_s23 <- subset(merged_data,Subject_Number=='23'&Activity=='Standing')

var5_s23$Subject_Number=NULL
var5_s23$Activity=NULL

var5_s23_means <- colMeans(var5_s23)
write.csv(var5_s23_means,file="var5_s23_means.csv")
means_var5_s23 <- read.csv("var5_s23_means.csv")

var5_s23_means <- t(means_var5_s23)
var5_s23_means <- as.data.frame(var5_s23_means)

row.names(var5_s23_means)[2] <- "Subject23_Standing"

var5_s23_means = var5_s23_means[-1, ]


var5_s24 <- subset(merged_data,Subject_Number=='24'&Activity=='Standing')

var5_s24$Subject_Number=NULL
var5_s24$Activity=NULL

var5_s24_means <- colMeans(var5_s24)
write.csv(var5_s24_means,file="var5_s24_means.csv")
means_var5_s24 <- read.csv("var5_s24_means.csv")

var5_s24_means <- t(means_var5_s24)
var5_s24_means <- as.data.frame(var5_s24_means)

row.names(var5_s24_means)[2] <- "Subject24_Standing"

var5_s24_means = var5_s24_means[-1, ]


var5_s25 <- subset(merged_data,Subject_Number=='25'&Activity=='Standing')

var5_s25$Subject_Number=NULL
var5_s25$Activity=NULL

var5_s25_means <- colMeans(var5_s25)
write.csv(var5_s25_means,file="var5_s25_means.csv")
means_var5_s25 <- read.csv("var5_s25_means.csv")

var5_s25_means <- t(means_var5_s25)
var5_s25_means <- as.data.frame(var5_s25_means)

row.names(var5_s25_means)[2] <- "Subject25_Standing"

var5_s25_means = var5_s25_means[-1, ]


var5_s26 <- subset(merged_data,Subject_Number=='26'&Activity=='Standing')

var5_s26$Subject_Number=NULL
var5_s26$Activity=NULL

var5_s26_means <- colMeans(var5_s26)
write.csv(var5_s26_means,file="var5_s26_means.csv")
means_var5_s26 <- read.csv("var5_s26_means.csv")

var5_s26_means <- t(means_var5_s26)
var5_s26_means <- as.data.frame(var5_s26_means)

row.names(var5_s26_means)[2] <- "Subject26_Standing"

var5_s26_means = var5_s26_means[-1, ]


var5_s27 <- subset(merged_data,Subject_Number=='27'&Activity=='Standing')

var5_s27$Subject_Number=NULL
var5_s27$Activity=NULL

var5_s27_means <- colMeans(var5_s27)
write.csv(var5_s27_means,file="var5_s27_means.csv")
means_var5_s27 <- read.csv("var5_s27_means.csv")

var5_s27_means <- t(means_var5_s27)
var5_s27_means <- as.data.frame(var5_s27_means)

row.names(var5_s27_means)[2] <- "Subject27_Standing"

var5_s27_means = var5_s27_means[-1, ]


var5_s28 <- subset(merged_data,Subject_Number=='28'&Activity=='Standing')

var5_s28$Subject_Number=NULL
var5_s28$Activity=NULL

var5_s28_means <- colMeans(var5_s28)
write.csv(var5_s28_means,file="var5_s28_means.csv")
means_var5_s28 <- read.csv("var5_s28_means.csv")

var5_s28_means <- t(means_var5_s28)
var5_s28_means <- as.data.frame(var5_s28_means)

row.names(var5_s28_means)[2] <- "Subject28_Standing"

var5_s28_means = var5_s28_means[-1, ]


var5_s29 <- subset(merged_data,Subject_Number=='29'&Activity=='Standing')

var5_s29$Subject_Number=NULL
var5_s29$Activity=NULL

var5_s29_means <- colMeans(var5_s29)
write.csv(var5_s29_means,file="var5_s29_means.csv")
means_var5_s29 <- read.csv("var5_s29_means.csv")

var5_s29_means <- t(means_var5_s29)
var5_s29_means <- as.data.frame(var5_s29_means)

row.names(var5_s29_means)[2] <- "Subject29_Standing"

var5_s29_means = var5_s29_means[-1, ]


var5_s30 <- subset(merged_data,Subject_Number=='30'&Activity=='Standing')

var5_s30$Subject_Number=NULL
var5_s30$Activity=NULL

var5_s30_means <- colMeans(var5_s30)
write.csv(var5_s30_means,file="var5_s30_means.csv")
means_var5_s30 <- read.csv("var5_s30_means.csv")

var5_s30_means <- t(means_var5_s30)
var5_s30_means <- as.data.frame(var5_s30_means)

row.names(var5_s30_means)[2] <- "Subject30_Standing"

var5_s30_means = var5_s30_means[-1, ]




# Repeat for activity 6... 


var6_s1 <- subset(merged_data,Subject_Number=='2'&Activity=='Laying')

var6_s1$Subject_Number=NULL
var6_s1$Activity=NULL

var6_s1_means <- colMeans(var6_s1)
write.csv(var6_s1_means,file="var6_s1_means.csv")
means_var6_s1 <- read.csv("var6_s1_means.csv")

var6_s1_means <- t(means_var6_s1)
var6_s1_means <- as.data.frame(var6_s1_means)

row.names(var6_s1_means)[2] <- "Subject1_Laying"

var6_s1_means = var6_s1_means[-1, ]


var6_s2 <- subset(merged_data,Subject_Number=='2'&Activity=='Laying')

var6_s2$Subject_Number=NULL
var6_s2$Activity=NULL

var6_s2_means <- colMeans(var6_s2)
write.csv(var6_s2_means,file="var6_s2_means.csv")
means_var6_s2 <- read.csv("var6_s2_means.csv")

var6_s2_means <- t(means_var6_s2)
var6_s2_means <- as.data.frame(var6_s2_means)

row.names(var6_s2_means)[2] <- "Subject2_Laying"

var6_s2_means = var6_s2_means[-1, ]


var6_s3 <- subset(merged_data,Subject_Number=='3'&Activity=='Laying')

var6_s3$Subject_Number=NULL
var6_s3$Activity=NULL

var6_s3_means <- colMeans(var6_s3)
write.csv(var6_s3_means,file="var6_s3_means.csv")
means_var6_s3 <- read.csv("var6_s3_means.csv")

var6_s3_means <- t(means_var6_s3)
var6_s3_means <- as.data.frame(var6_s3_means)

row.names(var6_s3_means)[2] <- "Subject3_Laying"

var6_s3_means = var6_s3_means[-1, ]


var6_s4 <- subset(merged_data,Subject_Number=='4'&Activity=='Laying')

var6_s4$Subject_Number=NULL
var6_s4$Activity=NULL

var6_s4_means <- colMeans(var6_s4)
write.csv(var6_s4_means,file="var6_s4_means.csv")
means_var6_s4 <- read.csv("var6_s4_means.csv")

var6_s4_means <- t(means_var6_s4)
var6_s4_means <- as.data.frame(var6_s4_means)

row.names(var6_s4_means)[2] <- "Subject4_Laying"

var6_s4_means = var6_s4_means[-1, ]


var6_s5 <- subset(merged_data,Subject_Number=='5'&Activity=='Laying')

var6_s5$Subject_Number=NULL
var6_s5$Activity=NULL

var6_s5_means <- colMeans(var6_s5)
write.csv(var6_s5_means,file="var6_s5_means.csv")
means_var6_s5 <- read.csv("var6_s5_means.csv")

var6_s5_means <- t(means_var6_s5)
var6_s5_means <- as.data.frame(var6_s5_means)

row.names(var6_s5_means)[2] <- "Subject5_Laying"

var6_s5_means = var6_s5_means[-1, ]


var6_s6 <- subset(merged_data,Subject_Number=='6'&Activity=='Laying')

var6_s6$Subject_Number=NULL
var6_s6$Activity=NULL

var6_s6_means <- colMeans(var6_s6)
write.csv(var6_s6_means,file="var6_s6_means.csv")
means_var6_s6 <- read.csv("var6_s6_means.csv")

var6_s6_means <- t(means_var6_s6)
var6_s6_means <- as.data.frame(var6_s6_means)

row.names(var6_s6_means)[2] <- "Subject6_Laying"

var6_s6_means = var6_s6_means[-1, ]


var6_s7 <- subset(merged_data,Subject_Number=='7'&Activity=='Laying')

var6_s7$Subject_Number=NULL
var6_s7$Activity=NULL

var6_s7_means <- colMeans(var6_s7)
write.csv(var6_s7_means,file="var6_s7_means.csv")
means_var6_s7 <- read.csv("var6_s7_means.csv")

var6_s7_means <- t(means_var6_s7)
var6_s7_means <- as.data.frame(var6_s7_means)

row.names(var6_s7_means)[2] <- "Subject7_Laying"

var6_s7_means = var6_s7_means[-1, ]


var6_s8 <- subset(merged_data,Subject_Number=='8'&Activity=='Laying')

var6_s8$Subject_Number=NULL
var6_s8$Activity=NULL

var6_s8_means <- colMeans(var6_s8)
write.csv(var6_s8_means,file="var6_s8_means.csv")
means_var6_s8 <- read.csv("var6_s8_means.csv")

var6_s8_means <- t(means_var6_s8)
var6_s8_means <- as.data.frame(var6_s8_means)

row.names(var6_s8_means)[2] <- "Subject8_Laying"

var6_s8_means = var6_s8_means[-1, ]


var6_s9 <- subset(merged_data,Subject_Number=='9'&Activity=='Laying')

var6_s9$Subject_Number=NULL
var6_s9$Activity=NULL

var6_s9_means <- colMeans(var6_s9)
write.csv(var6_s9_means,file="var6_s9_means.csv")
means_var6_s9 <- read.csv("var6_s9_means.csv")

var6_s9_means <- t(means_var6_s9)
var6_s9_means <- as.data.frame(var6_s9_means)

row.names(var6_s9_means)[2] <- "Subject9_Laying"

var6_s9_means = var6_s9_means[-1, ]


var6_s10 <- subset(merged_data,Subject_Number=='10'&Activity=='Laying')

var6_s10$Subject_Number=NULL
var6_s10$Activity=NULL

var6_s10_means <- colMeans(var6_s10)
write.csv(var6_s10_means,file="var6_s10_means.csv")
means_var6_s10 <- read.csv("var6_s10_means.csv")

var6_s10_means <- t(means_var6_s10)
var6_s10_means <- as.data.frame(var6_s10_means)

row.names(var6_s10_means)[2] <- "Subject10_Laying"

var6_s10_means = var6_s10_means[-1, ]


var6_s11 <- subset(merged_data,Subject_Number=='11'&Activity=='Laying')

var6_s11$Subject_Number=NULL
var6_s11$Activity=NULL

var6_s11_means <- colMeans(var6_s11)
write.csv(var6_s11_means,file="var6_s11_means.csv")
means_var6_s11 <- read.csv("var6_s11_means.csv")

var6_s11_means <- t(means_var6_s11)
var6_s11_means <- as.data.frame(var6_s11_means)

row.names(var6_s11_means)[2] <- "Subject11_Laying"

var6_s11_means = var6_s11_means[-1, ]


var6_s12 <- subset(merged_data,Subject_Number=='12'&Activity=='Laying')

var6_s12$Subject_Number=NULL
var6_s12$Activity=NULL

var6_s12_means <- colMeans(var6_s12)
write.csv(var6_s12_means,file="var6_s12_means.csv")
means_var6_s12 <- read.csv("var6_s12_means.csv")

var6_s12_means <- t(means_var6_s12)
var6_s12_means <- as.data.frame(var6_s12_means)

row.names(var6_s12_means)[2] <- "Subject12_Laying"

var6_s12_means = var6_s12_means[-1, ]


var6_s13 <- subset(merged_data,Subject_Number=='13'&Activity=='Laying')

var6_s13$Subject_Number=NULL
var6_s13$Activity=NULL

var6_s13_means <- colMeans(var6_s13)
write.csv(var6_s13_means,file="var6_s13_means.csv")
means_var6_s13 <- read.csv("var6_s13_means.csv")

var6_s13_means <- t(means_var6_s13)
var6_s13_means <- as.data.frame(var6_s13_means)

row.names(var6_s13_means)[2] <- "Subject13_Laying"

var6_s13_means = var6_s13_means[-1, ]


var6_s14 <- subset(merged_data,Subject_Number=='14'&Activity=='Laying')

var6_s14$Subject_Number=NULL
var6_s14$Activity=NULL

var6_s14_means <- colMeans(var6_s14)
write.csv(var6_s14_means,file="var6_s14_means.csv")
means_var6_s14 <- read.csv("var6_s14_means.csv")

var6_s14_means <- t(means_var6_s14)
var6_s14_means <- as.data.frame(var6_s14_means)

row.names(var6_s14_means)[2] <- "Subject14_Laying"

var6_s14_means = var6_s14_means[-1, ]


var6_s15 <- subset(merged_data,Subject_Number=='15'&Activity=='Laying')

var6_s15$Subject_Number=NULL
var6_s15$Activity=NULL

var6_s15_means <- colMeans(var6_s15)
write.csv(var6_s15_means,file="var6_s15_means.csv")
means_var6_s15 <- read.csv("var6_s15_means.csv")

var6_s15_means <- t(means_var6_s15)
var6_s15_means <- as.data.frame(var6_s15_means)

row.names(var6_s15_means)[2] <- "Subject15_Laying"

var6_s15_means = var6_s15_means[-1, ]


var6_s16 <- subset(merged_data,Subject_Number=='16'&Activity=='Laying')

var6_s16$Subject_Number=NULL
var6_s16$Activity=NULL

var6_s16_means <- colMeans(var6_s16)
write.csv(var6_s16_means,file="var6_s16_means.csv")
means_var6_s16 <- read.csv("var6_s16_means.csv")

var6_s16_means <- t(means_var6_s16)
var6_s16_means <- as.data.frame(var6_s16_means)

row.names(var6_s16_means)[2] <- "Subject16_Laying"

var6_s16_means = var6_s16_means[-1, ]

var6_s17 <- subset(merged_data,Subject_Number=='17'&Activity=='Laying')

var6_s17$Subject_Number=NULL
var6_s17$Activity=NULL

var6_s17_means <- colMeans(var6_s17)
write.csv(var6_s17_means,file="var6_s17_means.csv")
means_var6_s17 <- read.csv("var6_s17_means.csv")

var6_s17_means <- t(means_var6_s17)
var6_s17_means <- as.data.frame(var6_s17_means)

row.names(var6_s17_means)[2] <- "Subject17_Laying"

var6_s17_means = var6_s17_means[-1, ]


var6_s18 <- subset(merged_data,Subject_Number=='18'&Activity=='Laying')

var6_s18$Subject_Number=NULL
var6_s18$Activity=NULL

var6_s18_means <- colMeans(var6_s18)
write.csv(var6_s18_means,file="var6_s18_means.csv")
means_var6_s18 <- read.csv("var6_s18_means.csv")

var6_s18_means <- t(means_var6_s18)
var6_s18_means <- as.data.frame(var6_s18_means)

row.names(var6_s18_means)[2] <- "Subject18_Laying"

var6_s18_means = var6_s18_means[-1, ]


var6_s19 <- subset(merged_data,Subject_Number=='19'&Activity=='Laying')

var6_s19$Subject_Number=NULL
var6_s19$Activity=NULL

var6_s19_means <- colMeans(var6_s19)
write.csv(var6_s19_means,file="var6_s19_means.csv")
means_var6_s19 <- read.csv("var6_s19_means.csv")

var6_s19_means <- t(means_var6_s19)
var6_s19_means <- as.data.frame(var6_s19_means)

row.names(var6_s19_means)[2] <- "Subject19_Laying"

var6_s19_means = var6_s19_means[-1, ]


var6_s20 <- subset(merged_data,Subject_Number=='20'&Activity=='Laying')

var6_s20$Subject_Number=NULL
var6_s20$Activity=NULL

var6_s20_means <- colMeans(var6_s20)
write.csv(var6_s20_means,file="var6_s20_means.csv")
means_var6_s20 <- read.csv("var6_s20_means.csv")

var6_s20_means <- t(means_var6_s20)
var6_s20_means <- as.data.frame(var6_s20_means)

row.names(var6_s20_means)[2] <- "Subject20_Laying"

var6_s20_means = var6_s20_means[-1, ]


var6_s21 <- subset(merged_data,Subject_Number=='21'&Activity=='Laying')

var6_s21$Subject_Number=NULL
var6_s21$Activity=NULL

var6_s21_means <- colMeans(var6_s21)
write.csv(var6_s21_means,file="var6_s21_means.csv")
means_var6_s21 <- read.csv("var6_s21_means.csv")

var6_s21_means <- t(means_var6_s21)
var6_s21_means <- as.data.frame(var6_s21_means)

row.names(var6_s21_means)[2] <- "Subject21_Laying"

var6_s21_means = var6_s21_means[-1, ]


var6_s22 <- subset(merged_data,Subject_Number=='22'&Activity=='Laying')

var6_s22$Subject_Number=NULL
var6_s22$Activity=NULL

var6_s22_means <- colMeans(var6_s22)
write.csv(var6_s22_means,file="var6_s22_means.csv")
means_var6_s22 <- read.csv("var6_s22_means.csv")

var6_s22_means <- t(means_var6_s22)
var6_s22_means <- as.data.frame(var6_s22_means)

row.names(var6_s22_means)[2] <- "Subject22_Laying"

var6_s22_means = var6_s22_means[-1, ]


var6_s23 <- subset(merged_data,Subject_Number=='23'&Activity=='Laying')

var6_s23$Subject_Number=NULL
var6_s23$Activity=NULL

var6_s23_means <- colMeans(var6_s23)
write.csv(var6_s23_means,file="var6_s23_means.csv")
means_var6_s23 <- read.csv("var6_s23_means.csv")

var6_s23_means <- t(means_var6_s23)
var6_s23_means <- as.data.frame(var6_s23_means)

row.names(var6_s23_means)[2] <- "Subject23_Laying"

var6_s23_means = var6_s23_means[-1, ]


var6_s24 <- subset(merged_data,Subject_Number=='24'&Activity=='Laying')

var6_s24$Subject_Number=NULL
var6_s24$Activity=NULL

var6_s24_means <- colMeans(var6_s24)
write.csv(var6_s24_means,file="var6_s24_means.csv")
means_var6_s24 <- read.csv("var6_s24_means.csv")

var6_s24_means <- t(means_var6_s24)
var6_s24_means <- as.data.frame(var6_s24_means)

row.names(var6_s24_means)[2] <- "Subject24_Laying"

var6_s24_means = var6_s24_means[-1, ]


var6_s25 <- subset(merged_data,Subject_Number=='25'&Activity=='Laying')

var6_s25$Subject_Number=NULL
var6_s25$Activity=NULL

var6_s25_means <- colMeans(var6_s25)
write.csv(var6_s25_means,file="var6_s25_means.csv")
means_var6_s25 <- read.csv("var6_s25_means.csv")

var6_s25_means <- t(means_var6_s25)
var6_s25_means <- as.data.frame(var6_s25_means)

row.names(var6_s25_means)[2] <- "Subject25_Laying"

var6_s25_means = var6_s25_means[-1, ]


var6_s26 <- subset(merged_data,Subject_Number=='26'&Activity=='Laying')

var6_s26$Subject_Number=NULL
var6_s26$Activity=NULL

var6_s26_means <- colMeans(var6_s26)
write.csv(var6_s26_means,file="var6_s26_means.csv")
means_var6_s26 <- read.csv("var6_s26_means.csv")

var6_s26_means <- t(means_var6_s26)
var6_s26_means <- as.data.frame(var6_s26_means)

row.names(var6_s26_means)[2] <- "Subject26_Laying"

var6_s26_means = var6_s26_means[-1, ]


var6_s27 <- subset(merged_data,Subject_Number=='27'&Activity=='Laying')

var6_s27$Subject_Number=NULL
var6_s27$Activity=NULL

var6_s27_means <- colMeans(var6_s27)
write.csv(var6_s27_means,file="var6_s27_means.csv")
means_var6_s27 <- read.csv("var6_s27_means.csv")

var6_s27_means <- t(means_var6_s27)
var6_s27_means <- as.data.frame(var6_s27_means)

row.names(var6_s27_means)[2] <- "Subject27_Laying"

var6_s27_means = var6_s27_means[-1, ]


var6_s28 <- subset(merged_data,Subject_Number=='28'&Activity=='Laying')

var6_s28$Subject_Number=NULL
var6_s28$Activity=NULL

var6_s28_means <- colMeans(var6_s28)
write.csv(var6_s28_means,file="var6_s28_means.csv")
means_var6_s28 <- read.csv("var6_s28_means.csv")

var6_s28_means <- t(means_var6_s28)
var6_s28_means <- as.data.frame(var6_s28_means)

row.names(var6_s28_means)[2] <- "Subject28_Laying"

var6_s28_means = var6_s28_means[-1, ]


var6_s29 <- subset(merged_data,Subject_Number=='29'&Activity=='Laying')

var6_s29$Subject_Number=NULL
var6_s29$Activity=NULL

var6_s29_means <- colMeans(var6_s29)
write.csv(var6_s29_means,file="var6_s29_means.csv")
means_var6_s29 <- read.csv("var6_s29_means.csv")

var6_s29_means <- t(means_var6_s29)
var6_s29_means <- as.data.frame(var6_s29_means)

row.names(var6_s29_means)[2] <- "Subject29_Laying"

var6_s29_means = var6_s29_means[-1, ]


var6_s30 <- subset(merged_data,Subject_Number=='30'&Activity=='Laying')

var6_s30$Subject_Number=NULL
var6_s30$Activity=NULL

var6_s30_means <- colMeans(var6_s30)
write.csv(var6_s30_means,file="var6_s30_means.csv")
means_var6_s30 <- read.csv("var6_s30_means.csv")

var6_s30_means <- t(means_var6_s30)
var6_s30_means <- as.data.frame(var6_s30_means)

row.names(var6_s30_means)[2] <- "Subject30_Laying"

var6_s30_means = var6_s30_means[-1, ]




# Finally, merge all of these data frames into a single tidy data set
# that contains the average of each variable for each activity and each subject

tidydata <- rbind(var1_s1_means,var1_s2_means,var1_s3_means,var1_s4_means,var1_s5_means, 
                  var1_s6_means,var1_s7_means,var1_s8_means,var1_s9_means,var1_s10_means,
                  var1_s11_means,var1_s12_means,var1_s13_means,var1_s14_means,var1_s15_means,
                  var1_s16_means,var1_s17_means,var1_s18_means,var1_s19_means,
                  var1_s20_means,var1_s21_means,var1_s22_means,var1_s23_means,
                  var1_s24_means,var1_s25_means,var1_s26_means,var1_s27_means,
                  var1_s28_means,var1_s29_means,var1_s30_means,
                  var2_s1_means,var2_s2_means,var2_s3_means,var2_s4_means,var2_s5_means,
                  var2_s6_means,var2_s7_means,var2_s8_means,var2_s9_means,var2_s10_means,
                  var2_s11_means,var2_s12_means,var2_s13_means,var2_s14_means,var2_s15_means,
                  var2_s16_means,var2_s17_means,var2_s18_means,var2_s19_means,
                  var2_s20_means,var2_s21_means,var2_s22_means,var2_s23_means,
                  var2_s24_means,var2_s25_means,var2_s26_means,var2_s27_means,
                  var2_s28_means,var2_s29_means,var2_s30_means,
                  var3_s1_means,var3_s2_means,var3_s3_means,var3_s4_means,var3_s5_means,
                  var3_s6_means,var3_s7_means,var3_s8_means,var3_s9_means,var3_s10_means,
                  var3_s11_means,var3_s12_means,var3_s13_means,var3_s14_means,var3_s15_means,
                  var3_s16_means,var3_s17_means,var3_s18_means,var3_s19_means,
                  var3_s20_means,var3_s21_means,var3_s22_means,var3_s23_means,
                  var3_s24_means,var3_s25_means,var3_s26_means,var3_s27_means,
                  var3_s28_means,var3_s29_means,var3_s30_means,
                  var4_s1_means,var4_s2_means,var4_s3_means,var4_s4_means,var4_s5_means,
                  var4_s6_means,var4_s7_means,var4_s8_means,var4_s9_means,var4_s10_means,
                  var4_s11_means,var4_s12_means,var4_s13_means,var4_s14_means,var4_s15_means,
                  var4_s16_means,var4_s17_means,var4_s18_means,var4_s19_means,
                  var4_s20_means,var4_s21_means,var4_s22_means,var4_s23_means,
                  var4_s24_means,var4_s25_means,var4_s26_means,var4_s27_means,
                  var4_s28_means,var4_s29_means,var4_s30_means,
                  var5_s1_means,var5_s2_means,var5_s3_means,var5_s4_means,var5_s5_means,
                  var5_s6_means,var5_s7_means,var5_s8_means,var5_s9_means,var5_s10_means,
                  var5_s11_means,var5_s12_means,var5_s13_means,var5_s14_means,var5_s15_means,
                  var5_s16_means,var5_s17_means,var5_s18_means,var5_s19_means,
                  var5_s20_means,var5_s21_means,var5_s22_means,var5_s23_means,
                  var5_s24_means,var5_s25_means,var5_s26_means,var5_s27_means,
                  var5_s28_means,var5_s29_means,var5_s30_means,
                  var6_s1_means,var6_s2_means,var6_s3_means,var6_s4_means,var6_s5_means,
                  var6_s6_means,var6_s7_means,var6_s8_means,var6_s9_means,var6_s10_means,
                  var6_s11_means,var6_s12_means,var6_s13_means,var6_s14_means,var6_s15_means,
                  var6_s16_means,var6_s17_means,var6_s18_means,var6_s19_means,
                  var6_s20_means,var6_s21_means,var6_s22_means,var6_s23_means,
                  var6_s24_means,var6_s25_means,var6_s26_means,var6_s27_means,
                  var6_s28_means,var6_s29_means,var6_s30_means)
                  
# Re-replace column names with variable names... 
colnames(tidydata) <- c(names)

# Save this data frame as a .txt file for easy storage/sharing/use.... 
write.table(tidydata,file="tidydata.txt",row.name=FALSE)

# FIN
