% f=@(x,y) (x-y-1/4).*exp(-x.^2-y.^2);
% g=@(x,y) x.^2+y.^2
%
% x = -2:0.1:2; y=x;
% [X,Y] = meshgrid(x,y);
%
% contour(X,Y,f(X,Y),30)
% colorbar;
% hold on
% theta=0:0.1:2*pi;
% % plot(cos(theta));
% %plot(theta);
% % plot(-surf);
%
format long

f=@(r) 10000*(1 + r)^60 - 250*((1 + r)^60 - 1)/r;
fp=@(r) 600000*(1 + r)^59 + 250*((1 + r)^60 - 1)/r^2 - 15000*(1 + r)^59/r;

r0 = 0.02;
tol = 1e-4;
error = 1;
while(error>tol)
    r1=r0-f(r0)/fp(r0);
    error = abs(r1-r0);
    r0 = r1;
end