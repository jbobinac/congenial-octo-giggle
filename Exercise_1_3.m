% Numerical Computation 
% Exercise 1.3
% 10.10.2019

% Neville Scheme algorithm

% Inputs
I = 10;
h =zeros(I+1,1);
f =zeros(I+1,1);
% evaluating knot
e_k = 0;


% Assign values to knots and
for i = 1:I+1
    h(i) = power(2,-i+1);
    f(i) = values(h(i));
end

% create a Neville scheme
R = neville_scheme(h,f,e_k);

% plot the absolute error
loglog(h(1 : I + 1), abs(R(1 : I + 1, 1) - 1),'red');
hold on
grid on
loglog(h(1 : I + 1 - 1), abs(R(1 : I + 1 - 1, 2) - 1),'blue');
loglog(h(1 : I + 1 - 2), abs(R(1 : I + 1 - 2, 3) - 1),'green');


% function definitions

function f = values(h)
    f = (exp(h)-1)/h;
end

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

