% Numerical Computation 
% Exercise 1.d
% 10.10.2019

x =[0,1,4];
y =[0,2,8];
x_r = 2;

p = polyfit(x,y,2);
result =0;

for i = 1:3
    result = result + power(x_r,i-1)*p(i);
end

p
result

%%

result2 = polyval(p,2) % evaluate the polynomial p at x = 2

