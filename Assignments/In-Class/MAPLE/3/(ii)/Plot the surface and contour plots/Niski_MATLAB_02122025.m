% 02/12/2025

clear 
close all
%% Example 2.1

x1 = -5:0.1:5;
x2 = -5:0.1:5;
[x,y] = meshgrid(x1,x2);

f = @(x,y) (x+y-1/4).*exp(-x.^2-y.^2);

figure(1)
surf(x,y,f(x,y))
colorbar
xlabel('x')
ylabel('y')
zlabel('f(x,y)')
set(gca,'fontsize',16)

figure(2)
contour(x,y,f(x,y))
xlabel('x')
ylabel('y')
colorbar
set(gca,'fontsize',16)
hold on
% line([0 10000],[10000 0])

% figure(3)
% hold on
% xc = 3846; yc = 6154;
% line([5000 5000],[0 10000])
% line([0 10000],[8000 8000])
% line([10000 0],[0 10000])
% plot(xc,yc, '.','markersize',20)
% text(500,4000,'Feasible region','fontsize',20)