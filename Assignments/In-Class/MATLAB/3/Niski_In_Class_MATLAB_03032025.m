% 03/03/2025

% Phase Portrait (direction fields) of the Lotka-Volterra system

%% In-class practice #1:
% x' = -2*x + y
% y' =  x - 2*y
% 1. solve for the equilibrium
% 2. plot the phase portrait (x=-10:10; y=-10:10)
% 3. determine the type of the equilibrium
figure(2)
x = -1:0.1:1; y = -1:0.1:1;
[X,Y] = meshgrid(x,y);

p = @(x,y)  -2*x + y;
q = @(x,y)  x - 2*y;

quiver(X,Y,p(X,Y),q(X,Y),2)
set(gca,'fontsize',10)
hold on
plot(0,0,'r.','markersize',10)
plot(7/19,7/9,'r.','markersize',10)
plot(a/b,0,'r.','markersize',10)
xlabel('x')
ylabel('y')

%% In-class practice #2:
% x' = x*y - 5*x + 2*y
% y' = -4*x*y + x + y
% 1. solve for the equilibria
% 2. plot the phase portrait (x=-5:5; y=-5:5)
% 3. determine the type of the equilibrium
figure(3)
x = -1:0.1:1; y = -1:0.1:1;
[X,Y] = meshgrid(x,y);

p = @(x,y)  x*y - 5*x + 2*y;
q = @(x,y)  -4*x*y + x + y;

quiver(X,Y,p(X,Y),q(X,Y),2)
set(gca,'fontsize',10)
hold on
plot(0,0,'r.','markersize',10)
plot(7/19,7/9,'r.','markersize',10)
xlabel('x')
ylabel('y')