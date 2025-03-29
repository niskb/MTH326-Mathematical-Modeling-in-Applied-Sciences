% Niski Homework 5 Question 2

format long;

% Part (a)
disp("(a)");

f1 = @(x,y) x + y - cos(x) + sin(y - 1);
f2 = @(x,y) x^4 + y^4 - 2*x*y;

% Initial Guess
X0 = [0.8; 0.3];

tol = 1e-8;
error = 1;
while(error > tol)
    x = X0(1); y = X0(2);
% Jacobian Matrix
J = [1+sin(x) 1+cos(y-1); 4*x^3-2*y 4*y^3-2*x];
X1 = X0 - J\[f1(x,y); f2(x,y)]
error = abs(X1-X0);
X0 = X1;
end

% Part (b)
disp("(b)");

g1 = @(x,y) 2*x^2 - 5*x*y + y^2 + 2*x - 2*y + 1;
g2 = @(x,y) -2*x*y - 3*x + y + 1;

% initial Guess
X0 = [-0.7; -1.3];

tol = 1e-8;
error = 1;
while(error > tol)
    x = X0(1); y = X0(2);
% Jacobian Matrix
J = [4*x-5*y+2 -5*x+2*y-2; -2*y-3 -2*x+1];
X1 = X0 - J\[g1(x,y); g2(x,y)]
error = abs(X1-X0);
X0 = X1;
end