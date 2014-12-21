#Submission
# predict outcome levels on the original Testing data set using Random Forest algorithm
predictfinal <- predict(model2, testDf, type="class")
predictfinal
##  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 
##  B  A  B  A  A  E  D  B  A  A  B  C  B  A  E  E  A  B  B  B 
## Levels: A B C D E
# Write files for submission

txtFiles = function(x){
      n = length(x)
      for(i in 1:n){
            title = paste0("Submission_",i,".txt")
            write.table(x[i],file=title,quote=FALSE,row.names=FALSE,col.names=FALSE)
      }
}

txtFiles(endPrediction)



