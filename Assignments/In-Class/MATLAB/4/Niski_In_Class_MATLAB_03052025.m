% 03/05/2025
% Solve a 2nd order ODE example

% y'' - 2y'+ y = e^t/(1+t^2)

% given dt = 0.01, t0 = 0, Tend = 10
dt = 0.01;
t0 = 0;
Tend = 10;
tspan = t0:dt:Tend;

% Initial conditions
y0 = [1;0];

[t,y] = ode45(@ode1, tspan, y0);
figure(1)
plot(t,y(:,1))
% Use MAPLE to find the exact solution
ye = @(t) exp(t)-exp(t).*t-exp(t).*(-2*atan(t).*t + log(t.^2 + 1))/2;

hold on
plot(t,ye(t),'--','linewidth',2)
% 
% max(abs(ye(t)-y(:,1)))




%% In class assignment:
% Solve following differential equations using MAPLE and MATLAB and compare
% your results.
%% (a) y''+2*y'+5*y=4*exp(-t)*cos(2*t), y(0) = 1, y'(0) = 0

% given dt = 0.01, t0 = 0, Tend = 10
dt = 0.01;
t0 = 0;
Tend = 10;
tspan = t0:dt:Tend;

% Initial conditions: y(0) = 1; y'(0) = 0
y0 = [1;0];

[t,y] = ode45(@ode2, tspan, y0);
figure(2)
plot(t,y(:,1))
% Use MAPLE to find the exact solution
ye = @(t) exp(-t).*(2*t.*sin(2*t) + sin(2*t) + 2*cos(2*t))./2;

hold on
plot(t,ye(t),'--','linewidth',2)
% 
% max(abs(ye(t)-y(:,1)))



%% (b) y'''+4*y'= t, y(0)=y'(0)=0, y''(0) = 1

% given dt = 0.01, t0 = 0, Tend = 10
dt = 0.01;
t0 = 0;
Tend = 10;
tspan = t0:dt:Tend;

% Initial conditions: y(0) = y'(0) = 0, y''(0) = 1
y0 = [1;0];

[t,y] = ode45(@ode3, tspan, y0);
figure(3)
plot(t,y(:,1))
% Use MAPLE to find the exact solution
ye = @(t) t.^2/8 + 3/16 - (3*cos(2*t))./16;

hold on
plot(t,ye(t),'--','linewidth',2)
% 
% max(abs(ye(t)-y(:,1)))


%--------------------------------------------------------------------------
function dydt = ode1(t,y)

dydt = [y(2); 2*y(2)-y(1)+exp(t)./(1+t.^2)];

end

function dydt = ode2(t,y)

dydt = [y(2); -2*y(2)-5*y(1)+4*exp(-t)*cos(2*t)];

end


function dydt = ode3(t,y)

dydt = [y(2); y(3); -4*y(2)+t];

end

