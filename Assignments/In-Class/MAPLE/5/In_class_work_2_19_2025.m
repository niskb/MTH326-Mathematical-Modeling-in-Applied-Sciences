% inv(J)*[]

% f(x,y) = x^2+y^2-4;
% g(x,y) = x^2-y^2-1;
% x0     = [1.6,1.2];
% X_n+1 = Xn - inv(J)*F(Xn)

format long
f = @(x,y) x.^2+y.^2-4;
g = @(x,y) x.^2-y.^2-1;

% initial guess
X0 = [1.6; 1.2];

tol = 1e-4;
error = 1;
while(error > tol)
    x = X0(1); y = X0(2);
% Jacobian matrix
J = [2*x 2*y; 2*x -2*y];
X1 = X0 - J\[f(x,y); g(x,y)]
error = abs(X1-X0);
X0 = X1;
end

% In-class practice
disp("(1)");

f = @(x,y) x.^2 + y.^2 - 2*x - 2*y + 1;
g = @(x,y) -2*x*y + x + y;

% initial guesses: [0.6; 3], & [2;0.5]
X0 = [1.9; 0.6];
% X0 = [0.6; 1.9]; (another solution)

tol = 1e-8;
error = 1;
while(error > tol)
    x = X0(1); y = X0(2);
% Jacobian matrix
J = [2*x-2 2*y-2; -2*y+1 -2*x+1];
X1 = X0 - J\[f(x,y); g(x,y)]
error = abs(X1-X0);
X0 = X1;
end

% Plotting to make a rough guess
th = 0:pi/20:2*pi;
x = cos(th)+1; y = sin(th)+1;
plot(x,y);
hold on
xx = 0.6:0.01:2;
plot(xx,-xx./(1-2*xx));

disp("2");
f = @(x,y) x.^4+x*y+(1+y)^2;
fx = @(x,y) 4*x.^3+y;
fy = @(x,y) x+2*y+2;

% initial guess
X0 = [2; 3];

tol = 1e-8;
error = 1;
while(error > tol)
    x = X0(1); y = X0(2);
% Jacobian matrix
J = [12*x^2 1; 1 2];
X1 = X0 - J\[fx(x,y); fy(x,y)]
error = abs(X1-X0);
X0 = X1;
end