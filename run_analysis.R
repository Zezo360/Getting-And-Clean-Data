setwd("WorkSpaceForR/")
dataFile = "dataset.RData"
temp = read.table("activity_labels.txt", sep = "")
activityLabels = as.character(temp$V2)
temp = read.table("features.txt", sep = "")
attributeNames = temp$V2

Xtrain = read.table("train/X_train.txt", sep = "")
names(Xtrain) = attributeNames
Ytrain = read.table("train/y_train.txt", sep = "")
names(Ytrain) = "Activity"
Ytrain$Activity = as.factor(Ytrain$Activity)
levels(Ytrain$Activity) = activityLabels
trainSubjects = read.table("train/subject_train.txt", sep = "")
names(trainSubjects) = "subject"
trainSubjects$subject = as.factor(trainSubjects$subject)
train = cbind(Xtrain, trainSubjects, Ytrain)

Xtest = read.table("test/X_test.txt", sep = "")
names(Xtest) = attributeNames
Ytest = read.table("test/y_test.txt", sep = "")
names(Ytest) = "Activity"
Ytest$Activity = as.factor(Ytest$Activity)
levels(Ytest$Activity) = activityLabels
testSubjects = read.table("test/subject_test.txt", sep = "")
names(testSubjects) = "subject"
testSubjects$subject = as.factor(testSubjects$subject)
test = cbind(Xtest, testSubjects, Ytest)

save(train, test, file = dataFile)
rm(train, test, temp, Ytrain, Ytest, Xtrain, Xtest, trainSubjects, testSubjects, 
   activityLabels, attributeNames)
load(dataFile)
dada <- rbind(
train, test)
mm <- lapply(dada, function(x) mean(x))
sss <- lapply(dada, function(x) sd(x))
ddd <- cbind(mm, sss)
write.table(ddd, file = "dataOfS2.txt", row.names = FALSE)
