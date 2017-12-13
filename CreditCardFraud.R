# Importing the dataset
dataset = read.csv('creditcard.csv')

#checking overall dataset and coverting 'class' as factor variables 
str(dataset)
dataset$Class = as.factor(dataset$Class)
str(dataset$Class)

# Taking care of missing data
sum(is.na(dataset)) #no missing values found

#Excluding 'Time' variable from dataset for further analysis
dataset = dataset[,2:31]

#checking correlation between 'time' and 'class'
#cor(dataset$Time,dataset$Class)
#cor.test(dataset$Time,dataset$Class)


#To overcome the imbalance in dataset I'll apply oversampling 
#Checking imbalance in the dataset
summary(dataset$Class)
prop.table(table(dataset$Class)) #99.8% proper transaction, 0.2% fraud. 

#install.packages("ROSE")
#Implementing oversampling
library(ROSE)
dataset = ovun.sample(Class~., data = dataset, method = 'over', 
                        N = 2*284315, seed = 1234)$data
summary(dataset$Class)

#Getting rid of 'time variable
#dataset = dataset[-1]

# Feature Scaling for 'amount'
library(scales)
dataset[,29] = rescale(dataset[,29], to = c(0,1))
summary(dataset$Amount)


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Class, SplitRatio = 0.8)
training = subset(dataset, split == TRUE)
test = subset(dataset, split == FALSE)
summary(training$Class)
summary(test$Class)

#fitting random forest classifier model 
#install.packages("randomForest")
library(randomForest)
set.seed(123)
classifier = randomForest(x = training[-30],
                          y = training$Class,
                          ntree = 50)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test[-31])

# Making the Confusion Matrix
library(caret)
confusionMatrix(test$Class,y_pred)

#calcualting predictive precision using 
#install.packages("pROC")
library(pROC)
rocobj <-roc(test$Class,as.numeric(y_pred))
print(rocobj)
# the dedicated function:
print(rocobj$auc)
# Print a smoothed roc object
print(smooth(rocobj))
