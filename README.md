# Master Repository
This repository contains a collection of *Matlab* functions that were created for the course **MECH 105** at **Colorado State University**
## What are the functions?
- SpecialMatrix.m
  - Creates an NxM matrix where any value is the sum of the value above and below the given position of the value in question
- falsePosition.m
  - Calculates a root of a given equation using methods of false position
- luFactor.m
  - Performs Lowere and Upper matrix factorization of a given square matrix
- Heun.m
  - Evaluates a differential equation over a given interval and step size to a specified precision per y-value
## Function Highlight (Heun.m)
Being the last function we created in class it makes sense that *Heun.m* would be the most advanced. Its purpose is to evaluate a differential equation but it also has some flexibility, should there be user error, and warns the user if a special procedure is being used.

**Properties**
 - Checks inputs and displays a message if there is an error or warning
 - Defaults precision values should the user not specify them
 - Creates t-values from a given span and step size
 - If the span does not properly divide by the step size, performs a seperate Heun Method for the last interval and gives a warning
