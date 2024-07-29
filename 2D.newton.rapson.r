##########################################################################################

####### Find Maximal point of a 2D-function using Newton-Rapson Method (Main)
newton.rapson <- function(ff, x0, y0, Niter = 10, hx = .1, hy = .1, zero_level = 1.e-12){
    # Employs matrix operations for easier readability (overkill in 2D)
    vk <- matrix(c(x0,y0),2,1)
    for(i in 1:Niter){
        derivatives_f <- derivate(ff,vk,hx,hy)
        df <- matrix(head(derivatives_f,2),2,1)
        H  <- matrix(tail(derivatives_f,4),2,2)
        # Check if Hessian is invertible
        if(abs(det(H)) < zero_level) break
        # Check for non-zero gradient
        #print(derivatives_f)
        if(norm(df)<zero_level) break
        #--------------------------
        # Newton-Rapson Method
        vk <- vk - solve(H) %*% df
        #print(vk)
    }
    return(c(vk[1],vk[2]))
}

####################################################
#   Calculates finite differences for NR method 
derivate <- function(ff,v,hx,hy){
    x <- v[1]
    y <- v[2]
    f <- ff(x,y)
    # First derivative X
    fi <- ff(x+hx,y)
    f_i <- ff(x-hx,y)
    fx <- (fi - f_i)/(2*hx)
    # First derivative Y
    fk <- ff(x,y+hy)
    f_k <- ff(x,y-hy)
    fy <- (fk - f_k)/(2*hy)
    # Second derivative
    fxx <- (fi - 2.*f + f_i)/(hx**2.) # X
    fyy <- (fk - 2.*f + f_k)/(hy**2.) # Y
    # Crossed second derivative
    fik <- ff(x+hx,y+hy)
    f_ik <- ff(x-hx,y-hy)
    fxy <- (fik - fi - fk + 2.*f - f_i - f_k + f_ik)/(2.*hx*hy)
    # Store values in list to easily define Hessian and gradient
    return(c(fx,fy,fxx,fxy,fxy,fyy))
}
