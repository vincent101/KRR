radialKernel <- function(x,y,r){
    kxy <- exp(-r*(sum(x-y))^2)
    kxx <- exp(-r*(sum(x-x))^2)
    kyy <- exp(-r*(sum(y-y))^2)
    if (kxx==0 | kyy==0) {
        res <- 0
    }
    else{
        res <- kxy/(sqrt(kxx)*sqrt(kyy))
    }
    #res <- exp(-r*(sum(x-y))^2)+1
    return(res+1)
}
