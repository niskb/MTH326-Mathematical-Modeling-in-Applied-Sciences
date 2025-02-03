% MATLAB assignment 2
% A free fall ball dropped from a 400-ft height cliff. Without 
% considering the air resistance force, (a) plot the trajectory of the ball
% for the time period 0<=t<=50 (sec) where the function s(t) represents 
% the height of the ball above the ground. (b) Generate velocity v.s. time
% plot. (c) Consider the case when the initial velocity is 2 ft/sec, how
% does the trajectory look like?

% s(t) = -16*t^2;
% v(t) = -32*t;
% a(t) = -32;

% reference: 
% https://www.mathworks.com/matlabcentral/fileexchange/95458-bouncing-ball

%(a)
t = 0:0.1:50;
s = @(t) -16*t.^2+400;
v1 = @(t) -32*t;

figure(1);
plot(t,s(t))
xlabel('time t (sec)');
ylabel('s(t) (ft)')

%(b)
figure(2);
plot(t,v1(t));
xlabel('time t (sec)');
ylabel('v(t) (ft/sec)')

%(c)
v2 = @(t) -32*t + 2;
figure(3);
plot(t,v2(t));
xlabel('time t (sec)');
ylabel('v(t) (ft/sec)')

