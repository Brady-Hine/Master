%Brady Hine
%January 30th 2018
function [matrix] = SpecialMatrix(n,m)
%SpecialMatrix creates an n x m matrix that has the following values; 
%The value of each element in the first row is the number of the column.
%The value of each element in the first column is the number of the row.
%The rest of the elements each has a value equal to the sum of the element
%above it and element to the left.
%
%Inputs:
%n=number of rows
%m=number of columns
%
%Outputs:
%matrix=the special matrix that is created

if nargin<2 || nargin>2 %checks if there is an appropriate number of input 
    %arguments
    error('Incorrect number of input arguments. see help')
else
    matrix=zeros(n,m); %creates an n x m matrix of zeroes to save time
    for r=1:n
        for c=1:m
            if r==1
                matrix(r,c)=c; %sets first row values to the column number
            elseif c==1
                matrix(r,c)=r; %sets first column values to the row number
            else
                matrix(r,c)=matrix(r-1,c)+matrix(r,c-1);
                %sets each value left in the matrix to be equal to the sum
                %of the element above it and element to the left
            end
        end
    end
end
end

