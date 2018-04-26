function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%This function is designed to perform Heun's method on a given differential
%equation to calculate t and y values of a function.
%
%Inputs:
%dydt-differential equation to be evaluated in form dydt=@(t,y) <function>
%tspan-span of t values to evaluate y
%y0-initial condition for y(0)
%h-step size for tspan
%es-stopping criteria for approximate error (defaults to 0.001)
%maxit-maximum # of iterations for predictor/corrector loop for each y
%value and defaults to 50 (maxit=0 means no iteration)
%
%Outputs:
%t-vector of t (independant variable) values
%y-vector of y (dependant variable) values
%
%Run this for an example of outputs:
%dydt=@(t,y) -y+t^2
%h= 0.5
%tspan= [0 3.2]
%y0= 1
%[t,y] = Heun(dydt,tspan,y0,h)

%These statements check the inputs and set defaults based on inputs
if nargin<4
    error('At least 4 inputs are needed, see help')
elseif nargin==4
    warning('es and maxit values have been set to default')
    es=0.001;
    maxit=50;
elseif nargin==5
    warning('the maxit value has been set to default')
    maxit=50;
elseif nargin>6
    error('You have used too many input variables')
end

t=tspan(1):h:tspan(2); %sets up t values
y=zeros(1,length(t)); %creates blank vector for y values
y(1)=y0; %sets initial condition in position 1 of y vector

for i=1:length(t)-1
    %Euler's Method
    slopeL=dydt(t(i),y(i));
    yguess=y(i)+h*slopeL;
    %Heun's Method
    slopeR=dydt(t(i+1),yguess);
    y(i+1)=y(i)+(h/2)*(slopeL+slopeR);
    %Set defaults for while loop
    iter=1;
    ea=1;
    while ea>es && maxit>=iter %stopping criteria (given or defaulted)
        %Performs iterations for precision on single point
        y_bad=y(i+1); %Used for ea calculation
        y(i+1)=y(i)+(h/2)*(slopeL+dydt(t(i+1),y(i+1)));
        ea=abs(((y(i+1)-y_bad)/y(i+1))*100);
        iter=iter+1;
    end
end

%Checks to see if there is a spot at the end of the interval where the
%spacing, h, leaves out and if so calculates it
if rem(tspan(2),h)~=0
    warning('seperate h used on last interval')
    l=length(t); %Used to save time instead of using length(t/y)
    h=tspan(2)-t(l); %Set new h for the last interval
    t(l+1)=tspan(2); %Set final t value
    y(l+1)=0; %placeholder for final y value
    %Euler's Method
    slopeL=dydt(t(l),y(l));
    yguess=y(l)+h*slopeL;
    %Heun's Method
    slopeR=dydt(t(l+1),yguess);
    y(l+1)=y(l+1)+(h/2)*(slopeL+slopeR);
    %Set defaults for while loop
    iter=1;
    ea=1;
    while ea>es && maxit>=iter %Stopping criteria (given/defaulted)
        y_bad=y(l+1); %Used for ea calculation
        y(l+1)=y(l)+(h/2)*(slopeL+dydt(t(l+1),y(l+1)));
        ea=abs(((y(l+1)-y_bad)/y(l+1))*100);
        iter=iter+1;
    end
end

%plots the t and y values
plot(t,y)
title('plot of Heuns method t and y values')
xlabel('t-values')
ylabel('y-values')
end