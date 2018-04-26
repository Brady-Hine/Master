%Brady Hine
%February 19th 2018
function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%falsePosition.m False Position algorithm calculates a root of a function
%based on a given function and 2 bounds. 
%
%command window example for the function tan(x):
%y=@(x) tan(x)
%fplot(tan(x))   this is used to find lower and upper guesses
%falsePosition(y,-0.3,0.5)
%
%Inputs:
%func = the function being evaluated
%xl = the lower guess
%xu = the upper guess
%es = the desired relative error (defaults to 0.0001% with 3 inputs)
%maxiter = the number of iterations desired (defaults to 200 with 3 or 4
%inputs)
%
%Outputs:
%root = the estimated location of the root
%fx = the function evaluated at the root
%ea = the approximate relative error in percentage
%iter = how many iterations were performed
%
%NOTE:
%if the root is at 0 the approximate error returned will be NaN. This is
%due to the way the error is calculated and with a root at zero the
%equation divides by zero yielding ea=NaN

%test if number of inputs meets criteria and sets defaults
if nargin<3
    error('you have not entered enough input variables, check help')
elseif nargin==3
    es=0.0001;
    maxiter=200;
elseif nargin==4
    maxiter=200;
elseif nargin>5
    error('you have entered too many input variables, check help')
end

%calculate root to given/default precision or maximum iterations
iter=1; %index for iterations performed
roots(1)=0; %first value in roots matrix to allow for error calculation
ea=100; %index for approximate relative error
while iter<=maxiter && ea>=es %first bound to be met is when loop stops
    roots(iter+1)=xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    ea=abs((roots(iter+1)-roots(iter))/roots(iter+1))*100;
    if func(xl)*func(roots(iter+1))<0 %calculates bounds for next loop
        xu=roots(iter+1);
    elseif func(xu)*func(roots(iter+1))<0
        xl=roots(iter+1);
    end
    iter=iter+1; %increases iteration index value for next loop
end
iter=iter-1; %determines how many iterations were actually performed
root=roots(iter+1); %sets root value to be last value in roots matrix
fx=func(root); %evaluates function at given root
end

