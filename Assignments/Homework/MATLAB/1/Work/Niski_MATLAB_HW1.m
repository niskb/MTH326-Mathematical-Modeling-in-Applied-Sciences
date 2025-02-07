% MTH-326 MATH MODELING SPRING 2025 Homework 1
% Brian Niski

% 1. A free fall ball dropped from a 400-ft height cliff. Once the ball
% reaches the ground, it bounces.

% (a) Plot the trajectory of the ball for the time period 0 ≤ t ≤ 50 (sec)
% where the function s(t) represents the height of the ball above the ground.
% (b) Generate velocity v(t) v.s. time plot.
% (c) Consider the case when the initial velocity is 5 ft/sec, how does the
% trajectory look like?
% (d) If we consider the air resistance force where the coefficient k = 4,
% how does the trajectory look like?

% (a)
t = 0:1:50;
s = @(t) -16*t.^2 + 400;

figure(1);
plot(t, s(t));
xlabel('time t (sec)');
ylabel('s(t) (ft)')

% (b)
v = @(t) -32*t;

figure(2);
plot(v(t), t);
xlabel('v(t) (ft/sec)');
ylabel('time t (sec)')

% (c)
v = @(t) -32*t + 5;

figure(3);
plot(v(t), t);
xlabel('v(t) (ft/sec)');
ylabel('time t (sec)')

% (d)
v = @(t) -4*t-32*t + 5;

figure(4);
plot(v(t), t);
xlabel('v(t) (ft/sec)');
ylabel('time t (sec)')