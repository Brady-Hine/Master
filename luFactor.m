%Brady Hine
%April 3rd 2018
function [L,U,P] = luFactor(A)
%This function is designed to complete LU factorization of a square
%coefficient matrix of a system of linear equations.
%
%Inputs:
%A - coefficient matrix
%
%Outputs:
%L - lower triangular matrix
%U - upper triangular matrix
%P - pivot matrix

[r,c]=size(A); %creates variables r and c based on the number of rows and
%columns in matrix A

%checks if there is a correct number of inputs and if the input matrix is
%square. If either of these requirements is not met an error message will
%occur
if nargin~=1
    error('incorrect number of inputs, please check help information')
elseif r~=c
    error('the input matrix must be a square matrix')
end

P=eye(r,c); %creates initial identity matrix
L=P; %creates initial lower triangular matrix
U=A; %creates the initial upper triangular matrix
i=0; %creates index for while loop
while i<(r-1)
    i=i+1;
    [~,I]=max(abs(U([i:r],i))); %finds maximum absolute value of the 
    %column vector in question for gauss elimination and stores it's
    %row index in variable I
    I=I+(i-1); %corrects for the changing size of the column vector in
    %question as subsequent eliminations are done
    C=U; %creates temporary copy of matrix U
    %swap rows in order to pivot matrix U
    U(i,:)=C(I,:);
    U(I,:)=C(i,:);
    C=L; %creates temporary copy of matrix L
    %swap rows of matrix L to match matrix U
    L(i,:)=C(I,:);
    L(I,:)=C(i,:);
    C=P; %creates temporary copy of matrix P
    %swap rows of the identity matrix to match matrix U
    P(i,:)=C(I,:);
    P(I,:)=C(i,:);
    j=0; %index for second while loop
    while j<(r-i)
        j=j+1;
        elim=U((j+i),i)/U(i,i); %creates value to be used for gauss elim.
        L((j+i),i)=elim; %edits elim value into L matrix
        R=U(i,:)*elim; %creates a row vector for use in next equation
        U((j+i),:)=U((j+i),:)-R; %performs Gauss Elimination
    end
end 

end

