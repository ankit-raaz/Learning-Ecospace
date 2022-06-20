##Random Forest Model Basics##
#'[based on recursive partition and regression trees
# rather than a single tree, many trees are constructed with random subsets
# rather than a single tree, many trees are constructed with random subset of data
# "voting" among trees is helpful to determine classification
#many poor learners can collectively be a good learner
#evaluation of variable importance is possible 

library(rpart)
library(randomForest)
library(rfUtilities)
?rpart
data(iris)
names(iris)


#fit a single recursive partitioning or classification tree
tree<-rpart(Species~., method="class", control = rpart.control(cp=0, minsplit = 1),
            data=iris)

par(mfrow=c(1,2), xpd=NA)
plot(tree)
text(tree,use.n = T)
 

#Now fit a random  forest model
set.seed(187)
rf.mod<-randomForest(Species~., ntree=500, mtry=1, data=iris)
plot(rf.mod)
rf.mod
?randomForest
#No. of variables tried at each split =mtry 
#how do we know what mtry value to choose ---  use tuneRf ;  

#tune the model 
set.seed(8675309)
tuneRF(iris[,c(1:4)],iris$Species, stepFactor = 3)
?tuneRF
# have a look at variable importance
varImpPlot(rf.mod)
  # higher value of meandecreaseGini represent important variable
?varImpPlot
# have a look at partial dependence
?rf.partial.prob
#what will the probability of assignment to particular classes across those variables
# if we hold all the other variable at their average value ~ Parital dependence
rf.partial.prob(x=rf.mod, pred.data = iris, xname="Petal.Width",
                which.class = "virginica" , smooth = "spline")

#cross validation
rf.crossValidation(rf.mod,iris[,c(1:4)], ydata=iris$Species, p=0.1,
                n=99 ,seed=597)
  #p= proportion of data hold back 
# Users accuracy AKA error of commission AKA inclusion AKA False positive
#Producers accuracy AKA error of omission AKA exclusion AKA False Negative 