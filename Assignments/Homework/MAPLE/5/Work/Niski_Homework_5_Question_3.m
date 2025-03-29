% Niski Homework 5 Question 3

% Part (a)
mu_values = [0, 0.1, 0.5, 1, 5, 10];
A = 1.5;
omega = pi/5;
tspan = [0, 100];
h = 0.01;

figure;
hold on;

colors = {'r', 'g', 'b', 'c', 'm', 'y'}; % Colors for different mu values

for i = 1:length(mu_values)
    mu = mu_values(i);
    
    % Euler's Method
    t = tspan(1):h:tspan(2);
    y1 = zeros(size(t));
    y2 = zeros(size(t));
    
    y1(1) = 0;
    y2(1) = 2;
    
    for j = 1:length(t) - 1
        y1(j+1) = y1(j) + h * y2(j);
        y2(j+1) = y2(j) + h * (mu * (1 - y1(j)^2) * y2(j) - y1(j) + A * sin(omega * t(j))) ;
    end
    
    plot(t, y1, colors{i});
end

title('Van der Pol Oscillator Solutions for Different mu');
xlabel('t');
ylabel('y');
grid on;
legend('mu = 0', 'mu = 0.1', 'mu = 0.5', 'mu = 1', 'mu = 5', 'mu = 10');
hold off;

% Part (b)

% Set mu to 1 and A to 0
mu = 1;
A = 0;

% Solve, A = 0 values should cancel out
odefun = @(t,y) [y(2); mu*(1-y(1)^2)*y(2) - y(1) + A*sin(omega*t)];
[t_ode, y_ode] = ode45(odefun, tspan, [0; 2]);

figure;
plot(y_ode(:,1), y_ode(:,2));
title('y'' vs y (mu = 1, A = 0)');
xlabel('y');
ylabel('y''');
grid on;