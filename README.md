## Kernel Ridge Regression
---
### 1. Load and split Advertising dataset 

	> ad <- read.csv("Advertising.csv")
	> X <- ad[,2:4]
	> Y <- ad[,5]
	> set.seed(0506)
	> train <- sample(1:nrow(X),2*nrow(X)/3)
	> trainX <- X[train,]
	> trainY <- Y[train,]
	> testX <- X[-train,]
	> testY <- Y[-train,]

### 2. fit KRR using polynomial        
get the testMSE = 10.45449, with d=3, lambda=0.01 

	> method = 2
	> d = 3
	> lambda = 0.01
	> predY1 <- krr(method, d, trainX, trainY, testX, lambda)
	> MSE1 <- mean((predY1-testY)^2)


### 3. fit KRR using radial
get the testMSE = 10.3372, with r=0.001, lambda=0.1

	> method = 2
	> r = 0.001
	> lambda = 0.1
	> predY2 <- krr(method, d, trainX, trainY, testX, lambda)
	> MSE2 <- mean((predY2-testY)^2)
