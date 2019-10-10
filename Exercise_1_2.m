% Numerical Computation 
% Exercise 1.2
% 10.10.2019

% Neville Scheme algorithm

% Inputs
x =[0,1,4];
f =[0,2,8];
% evaluating knot
e_k = 2;

R = neville_scheme(x,f,2);




function R = neville_scheme (knots,d_v,e_k)

n = length(knots) - 1;
% Output matrix
R = zeros(n+1, n+1);

% Fill in the first column with input values
for i = 1:n+1
    R(i,1) = d_v(i);
end

% Fill in the rest of the columns by the Neville scheme definition
for j = 2:n+1
    for i = 1:n-j+2
        R(i,j) = ((e_k - knots(i))* R(i+1,j-1) - (e_k - knots(i+j-1))* R(i,j-1)) / (knots(i+j-1)-knots(i));
    end
end
end

