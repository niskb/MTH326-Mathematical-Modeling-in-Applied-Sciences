% MATLAB assignment 2
% A free fall ball dropped from a 400-ft height cliff. Without 
% considering the air resistance force, (a) plot the trajectory of the ball
% for the time period 0<=t<=50 (sec) where the function s(t) represents 
% the height of the ball above the ground. (b) Generate velocity v.s. time
% plot. (c) Consider the case when the initial velocity is 2 ft/sec, how
% does the trajectory look like?

% In-class part (d)
% (d) consider bouncing in the model, generate the plot s(t) v.s. time.

% s(t) = -4.9*t^2;  <-----fix this (convert to ft and include initial height
% v(t) = -9.8*t;
% a(t) = -9.8;

% reference: 
% https://www.mathworks.com/matlabcentral/fileexchange/95458-bouncing-ball

% -> s(t) = -4.9 * (t * t) + 400; -> 400 - (16 (t * t));
% -> v(t) = -9.8 * (t);           -> -32 * t -> (-32 * t) + 2;
% -> a(t) = -9.8;                 -> t;

% Functions
t = 0:1:50;
s1 = @(t) 400-16*t.^2;
s2 = @(t) 400-16*t.^2 + 2*t;
v1 = @(t) -32*t;
v2 = @(t) -32*t + 2;

% Plots
figure(1);
plot(t, s1(t));

figure(2);
plot(t, s2(t));

figure(3);
plot(t, v1(t));

figure(4);
plot(t, v2(t));

figure(5);
plot(s1(t), t);

figure(6)
plot(s2(t), t);