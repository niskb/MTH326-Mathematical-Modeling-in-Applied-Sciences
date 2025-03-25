% Niski Graph 2 - Crashes/Collisions
clear all;
% Parameters
n = 8;            % Number of cars
tau = 2;          % Delay (Set to 2 so there are crashes in this case)
v = 8;            % Velocity constant
d_plus_l = 8;     % Equilibrium spacing
P_max = 0.2;      % Maximum density
tspan = [0 50];   % Time span
d = 6.4;          % Equidistant spacing
v0 = 1;           % Initial velocity
k = 0.5;          % Constant
t_1 = 10;         % Braking time

% Time Span
dt = 0.01;
t_values = 0:dt:tspan(2); % Time values from 0 to tspan(2)

% Initialize z_1
z_1 = zeros(size(t_values));
z_1(t_values <= 0) = v0;
z_1(t_values > 0) = v0 * (1 - k * (t_values(t_values > 0) .* exp((t_1 - t_values(t_values > 0)) / t_1)));

% Initial Conditions
initial_positions = flip((1:n) * d); % Car Starts at a Unique Position
Z = zeros(n, length(t_values)); % Initialize positions
Z(:, 1) = initial_positions'; % Set initial positions

% Time loop for Euler's Method
for i = 1:length(t_values)-1
    t = t_values(i);
    
    % Get the delayed positions
    if i > round(tau/dt)
        Z_delayed = Z(:, i - round(tau/dt)); % Get positions from tau time ago
    else
        Z_delayed = Z(:, 1); % Use initial positions if delay is not yet reached
    end
    
    % Calculate the rate of change for each car
    dZdt = zeros(n, 1);
    
    % Initial z_1(t) Velocity
    z1_t = interp1(t_values, z_1, t, 'linear', 'extrap');
    
    % Car 1: starts braking
    if t < 0.5
        dZdt(1) = -5 + z1_t; % Decelerate
    else
        dZdt(1) = 0;  % No More Braking
    end
    
    % Cars 2 to n: React to Car(s) in Front With Delay
    for j = 2:n
        expr = -(d_plus_l) + Z_delayed(j) - Z_delayed(j-1);
        dZdt(j) = v * log(abs(P_max * expr)) - v + z1_t; % Follow z_1 while reacting
    end
    
    % Update positions using Euler's Method
    Z(:, i + 1) = Z(:, i) + dZdt * dt;
end

% Plotting
figure;
hold on;
grid on;
colors = lines(n);
legend_labels = cell(n,1);
for i = 1:n
    plot(t_values, Z(i, :), 'LineWidth', 2, 'Color', colors(i,:), ...
         'DisplayName', sprintf('Car %d', i));
end

% Collision Detection and Plotting Circles
collision_threshold = 0.05; % Threshold for detecting collisions
for i = 1:n-1
    for j = i+1:n
        for k = 1:length(t_values)
            if abs(Z(i, k) - Z(j, k)) < collision_threshold
                % Plot yellow outlined circles at intersection points
                plot(t_values(k), Z(i, k), 'o', 'MarkerEdgeColor', 'yellow', ...
                     'MarkerFaceColor', 'none', 'MarkerSize', 10);
            end
        end
    end
end

xlabel('Time (t)');
ylabel('Vehicle Displacements');
title('Traffic Model with Crashes/Collisions');
grid on;
hold off;