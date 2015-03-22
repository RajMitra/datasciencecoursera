train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")

test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")

combined <- rbind(train,test)

features <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")

colnames(combined) <- features$V2

m1 <- grepl("mean()", colnames(merged))

m2 <- grepl("mean()", colnames(merged))

final <- cbind(merged[,m1],merged[,m2])

train_y <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")

test_y <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")

activity <- rbind(train_y,test_y)

train_sub <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

test_sub <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

subject <- rbind(train_sub,test_sub)

final <- cbind(final,activity)
names(final)[names(final)=="V1"] <- "Activity"

final <- cbind(final,subject)
names(final)[names(final)=="V1"] <- "Subject"

final <- group_by(final,Subject,Activity)
final <- summarise_each(final,funs(mean))
