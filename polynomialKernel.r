polynomialKernel <- function(x,y,d){
    kxy <- (1+sum(x*y))^d
    kxx <- (1+sum(x*x))^d
    kyy <- (1+sum(y*y))^d
    if (kxx==0 | kyy==0) {
        res <- 0
    }
    else{
        res <- kxy/(sqrt(kxx)*sqrt(kyy))
    }
    #res <- (1+sum(x*y))^d+1
    return(res+1)
}
