# load Advertising Dataset and split it into train set and test set
ad <- read.csv("Advertising.csv")
X <- ad[,2:4]
Y <- ad[,5]
set.seed(0506)
train <- sample(1:nrow(X),2*nrow(X)/3)
trainX <- X[train,]
trainY <- Y[train]
testX <- X[-train,]
testY <- Y[-train]

# implement krr
source("krr.r")

# using polynomial as a function
method = 1
d = 3
lambda = 0.01
predY1 <- krr(method, d, trainX, trainY, testX, lambda)
MSE1 <- mean((predY1-testY)^2)
# MSE=10.17497, with d=3, lambda=0.01

# using radial as a function
method = 2
r = 0.001
lambda = 0.1
predY2 <- krr(method, r, trainX, trainY, testX, lambda)
MSE2 <- mean((predY2-testY)^2)
# MSE=10.39921, with r=0.001, lambda=0.1
