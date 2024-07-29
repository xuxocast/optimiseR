##################################################################################
### Main. Employs gradient descent to minimise the Loss function

gradient.descent <- function(Function, initial_param_vector, h=0.1, Niter=10, learn_rate=0.5, zero_level=1e-12, plot=TRUE){
    L <- length(initial_param_vector)
    loss_function <- rep(0,L)
    vk <- matrix(initial_param_vector,L,1)
    for(i in 1:Niter){
        df <- Ngrad(Function, vk, h=h)
        #--------------------------
        # Gradient descent
        vk <- vk - learn_rate*df
        loss_function[i] <- Function(vk)
    }
    if(plot){
        dfl <- data.frame('Niter'=1:Niter,loss_function) 
        p <- ggplot(dfl, aes(x=Niter, y=loss_function)) + 
             geom_line() 
        print(p)
    }
    return(vk)
}


###############################################################################
# Computes the gradient a function in arbitrary dimentions
Ngrad <- function(ff,param_vector, h=0.1){
    L <- length(param_vector)
    gradf <- rep(0,L)
    for(j in 1:L){
      vh <- rep(0,L)
      vh[j] <- h[1]
      #--------------------- Finite difference -----------------------
      df <- (ff(param_vector + vh) -  ff(param_vector - vh))/(2*h)
      gradf[j] <- df[1]
    }
    return(matrix(gradf,L,1))
}