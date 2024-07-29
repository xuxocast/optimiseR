# Optimisation functions in R


##  a) 2D.newton.rapson

Employs finite differences to calculate the divergence and Hessian matrix of a two dimentional function. It employs the Newton-Rapson method to find a maximal point. This functions takes as input:

  1. float **Function**. Function to minimise 
  2. float **x0**. Starting point (x coordinate)
  3. float **y0**. Starting point (y coordinate)
  4. float **hx**. Finite difference (to calculate derivatives along x coordinate). Smaller values provide more precise derivatives
  5. float ** hy**. Finite difference (to calculate derivatives along y coordinate). Smaller values provide more precise derivatives
  6. int **Niter**. Number of iterations for the Newton-Rapson algorithm
  7. float **zero_level**. The iterations stop when the gradient is below this threshold.
 
It returns a list with two elements c(xmin, ymin).


##  b) gradient.descent

Employs finite differences to calculate the divergence of a two dimentional function. Finds a minima trough gradient-descent. This functions takes as input:

  1. float **Function**.  Function to minimise 
  2. N*float **initial_param_vector**. Vector of starting points (dimention N)
  4. float **h**. Finite difference. Smaller values provide more precise derivatives
  6. int **Niter**. Number of iterations for the Newton-Rapson algorithm
  7. float **learn_rate**. Step size at each iteration
  8. float **zero_level**. The iterations stop when the gradient is below this threshold.

It returns the minimun as a vector with N elements.

