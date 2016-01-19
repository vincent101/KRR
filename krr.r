krr <- function(method, dr, trainX, trainY, testX, lambda){
    N <- nrow(trainX)
    M <- nrow(testX)
    Km <- matrix(,N,N)
    km <- matrix(,N,M)
    # method = 1, means use polynomial kernel
    if (method == 1) {
        source("polynomialKernel.r")
        #d <- 2
        for (i in 1:N) {
            for (j in 1:N) {
                Km[i,j] <- polynomialKernel(trainX[i,],trainX[j,],dr)
            }
            for (k in 1:M) {
                km[i,k] <- polynomialKernel(trainX[i,],testX[k,],dr)
            }
        }
    }
    # method = 2, means use radial kernel
    if (method == 2) {
        source("radialKernel.r")
        #r = 2
        for (i in 1:N) {
            for (j in 1:N) {
                Km[i,j] <- radialKernel(trainX[i,],trainX[j,],dr)
            }
            for (k in 1:M) {
                km[i,k] <- radialKernel(trainX[i,],testX[k,],dr)
            }
        }
    }

    predY <- c()
    for (i in 1:M) {
        predY[i] <- trainY%*%solve(lambda*diag(N)+Km)%*%km[,i]
    }

    return(predY)
}
