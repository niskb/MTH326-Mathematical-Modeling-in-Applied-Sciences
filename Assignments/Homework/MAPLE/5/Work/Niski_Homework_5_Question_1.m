% Niski Homework 5 Question 1

function chaotic_dynamics
    % Parameters
    a1 = 5.0;
    b1 = 3.0;
    a2 = 0.1;
    b2 = 2.0;
    d1 = 0.4;
    d2 = 0.01;

    % Time settings
    tspan = [0 10000];
    dt = 0.1;
    t = tspan(1):dt:tspan(2);

    % Initial conditions
    initial_conditions1 = [0.5, 0.5, 0.5]; % Initial conditions for the first trajectory
    initial_conditions2 = [0.51, 0.5, 0.5]; % Initial conditions for the second trajectory

    % Solve the system of equations
    [T1, Y1] = ode45(@(t, y) model(t, y, a1, b1, a2, b2, d1, d2), t, initial_conditions1);
    [T2, Y2] = ode45(@(t, y) model(t, y, a1, b1, a2, b2, d1, d2), t, initial_conditions2);

    % Plotting
    figure;

    % Plot x vs time
    subplot(3, 1, 1);
    plot(T1, Y1(:, 1), 'LineWidth', 1.5);
    xlim([5000 6500]);
    xlabel('time');
    ylabel('X');
    title('A');

    % Plot y vs time
    subplot(3, 1, 2);
    plot(T1, Y1(:, 2), 'LineWidth', 1.5);
    xlim([5000 6500]);
    xlabel('time');
    ylabel('Y');
    title('B');

    % Plot z vs time
    subplot(3, 1, 3);
    plot(T1, Y1(:, 3), 'LineWidth', 1.5);
    xlim([5000 6500]);
    xlabel('time');
    ylabel('Z');
    title('C');

    % 3D Phase Plot
    figure;
    plot3(Y1(:, 1), Y1(:, 2), Y1(:, 3), 'LineWidth', 1.5);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title('D');
    grid on;

    % Plot Divergence of Trajectories
    figure;
    plot(T1, Y1(:, 1), 'LineWidth', 1.5); hold on; % Solid line for the first trajectory
    plot(T2, Y2(:, 1), 'LineWidth', 1.5, 'LineStyle', '--'); % Dashed line for the second trajectory
    xlabel('time');
    ylabel('X');
    title('Fig. 3.');
    legend('Initial Condition 1', 'Initial Condition 2');
    xlim([0 500]);
    hold off;
end

function dydt = model(t, y, a1, b1, a2, b2, d1, d2)
    x = y(1);
    y1 = y(2);
    z = y(3);

    f1 = (a1 * x) / (1 + b1 * x);
    f2 = (a2 * y1) / (1 + b2 * y1);

    dydt = zeros(3, 1);
    dydt(1) = x * (1 - x) - f1 * y1; % dx/dt
    dydt(2) = f1 * y1 - f2 * z - d1 * y1; % dy/dt
    dydt(3) = f2 * z - d2 * z; % dz/dt
end