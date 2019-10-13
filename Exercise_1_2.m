% Numerical Computation 
% Exercise 1.2
% 10.10.2019

% Neville Scheme algorithm

% Inputs
x =[0,1,4];
f =[0,2,8];
% evaluating point
e_p = 2;

R = neville_scheme(x,f,e_p);




function R = neville_scheme (knots,d_v,e_k)

% polynomial degree
n = length(knots) - 1;

% Output matrix
R = zeros(n+1, n+1);

% Fill in the first column with input values
for i = 1:n+1
    R(i,1) = d_v(i);
end

% Fill in the rest of the columns by the Neville scheme definition
for j = 2:n+1
    m = j - 1; % polynomial degree of the column
    for i = 1:n-m+1
        R(i,j) = ((e_k - knots(i))* R(i+1,m) - (e_k - knots(i+m))* R(i,m)) / (knots(i+m)-knots(i));
    end
end
end

