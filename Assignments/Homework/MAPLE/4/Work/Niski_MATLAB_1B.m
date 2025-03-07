function [x_opt, y_opt] = optimize_color_tv()
    % Initial guess
    x0 = 100; % Initial guess for x
    y0 = 100; % Initial guess for y
    tol = 1e-6; % Tolerance for convergence
    max_iter = 1e+18; % Maximum iterations

    % Newton's method
    for iter = 1:max_iter
        % Evaluate the function and its gradients
        [P_val, grad] = objective_function(x0, y0);
        
        % Evaluate the Jacobian matrix
        J = jacobian(x0, y0);
        
        % Update step
        delta = -J \ grad; % Solve J * delta = -grad
        
        % Update x and y
        x0 = x0 + delta(1);
        y0 = y0 + delta(2);
        
        % Check for convergence
        if norm(delta) < tol
            break;
        end
    end
    
    x_opt = x0;
    y_opt = y0;

    disp("x output: " + x_opt);
    disp("y output: " + y_opt);
end

function [P, grad] = objective_function(x, y)
    P = (339 - 0.011*x - 0.003*y)*x + (399 - 0.004*x - 0.011*y)*y - 400000 - 195*x - 225*y;
    dPdx = -0.022*x + 144 - 0.007*y;
    dPdy = -0.007*x - 0.022*y + 174;
    grad = [dPdx; dPdy]; % Gradient vector
end

function J = jacobian(x, y)
    J = [-0.02, -0.007; -0.007, -0.02]; % Jacobian matrix
end