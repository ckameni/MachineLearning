
library(caret,quietly=TRUE)
library(randomForest,quietly=TRUE) 

trainingDf<-read.csv("./pml-training.csv", na.strings=c("", "NA", "NULL"))
dim(trainingDf)# Check number of variables and observations

testDf<-read.csv("./pml-testing.csv", na.strings=c("", "NA", "NULL"))
dim(testDf)# Check number of variables and observations

trainingDf<-trainingDf[,colSums(is.na(trainingDf)) == 0];dim(trainingDf)
testDf <-testDf[,colSums(is.na(testDf)) == 0];dim(testDf)

trainingDf <-trainingDf[,-c(1:7)];dim(trainingDf)
testDf <-testDf[,-c(1:7)];dim(testDf)

set.seed(1442)
data <- createDataPartition(y=trainingDf$classe, p=0.70, list=FALSE)
train.Sub.trainingDf <- trainingDf[data, ];dim(train.Sub.trainingDf)
test.Sub.trainingDf<- trainingDf[-data, ];dim(test.Sub.trainingDf)


model <- randomForest(classe ~. , data=train.Sub.trainingDf, method="class")

# perform the Prediction
prediction <- predict(model, test.Sub.trainingDf, type = "class")

# Test the prediction:
confusionMatrix(prediction, test.Sub.trainingDf$classe)


endPrediction <- predict(model, testDf, type="class")
endPrediction
