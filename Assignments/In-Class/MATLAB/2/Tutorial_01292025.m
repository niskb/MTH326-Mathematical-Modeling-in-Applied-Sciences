% Tutorial 01/29/2024


clear 
close all

%% use double percentage sign to separate "sections"
4 + 10
%
5 *10 + 6
%%
(6 + 6) / 3

%% The ans Variable
4 + 5
%%
ans
%%
ans + 10

%% Defining Your Own Variables
a = 10
%%
b = 20
%%
c = 30
%%
a
%%
the_average = (a + b + c) / 3

%% Listing Currently Defined Variables and Clearing Variables
clear % clear variables from memory 
%%
a = 5
%%
b = 6
%%
whos
%%
clear
whos

%% Suppressing results with semicolons
%%
a = 10;
b = 20;
c = 30;
d = 40;
%%
the_average = (a + b + c + d) / 4
%%
the_average;
%%
b
%%
e = 50
%%
the_blank_average = (a + b + c + d + e) / 5;
the_blank_average

%% Variable Names and Assigning Strings to Variables
%%
some_text = 'This is some text assigned to a variable!';
some_text
%%
a = 5;
b = '5';
a/b
%%
a*b

%-------------------------------------------------------

my_scalar = 3.1415

%% Creating Matrices in MATLAB
my_vector1 = [1, 5, 7]

%%
my_vector2 = [1; 5; 7]

%%
my_matrix = [8, 12, 19; 7, 3, 2; 12, 4, 23; 8, 1, 1]

%%
row_vector1 = [1 2 3]

%%
row_vector2 = [3 2 1]

%%
matrix_from_row_vec = [row_vector1 ; row_vector2]

%%
column_vector1 = [1;3]

%%
column_vector2 = [2;8]

%%
matrix_from_col_vec = [column_vector1 column_vector2]

%%
my_matrix = [8, 12, 19; 7, 3, 2; 12, 4, 23; 8, 1, 1]

%%
combined_matrix = [my_matrix, my_matrix]

%%
time = 0:100:2300

%%
time_dec = 2300:-100:0

%% Indexing Into a Matrix

%%
my_vector1 = [1 5 7]
%%
my_vector2 = [1; 5; 7]
%%
my_vector1(1)
%%
my_vector2(2)
%%
my_vector1(3)
%%
my_vector2(1)
%%
my_vector2(2)
%%
my_vector2(3)

%%
my_matrix = [8, 12, 19; 7, 3, 2; 12, 4, 23; 8, 1, 1]

%%
my_matrix(3,2)
%%
mat = [1  8 9 4 5 2 4 8
       9  3 7 4 8 2 8 8 
       1  2 9 4 6 2 3 4
      10  2 2 4 6 7 3 2
       3 12 3 3 2 8 4 9]
%%
new_mat = mat(2:4,4:7)
%%
new_mat
%%
new_mat(2,3) = 1999

%-----------------------------------------------------
%% Line Plots in Two Dimensions
simple_x_points = [1 2 3 4 5]
%%
simple_y_points = [25 0 20 5 15]
%%
plot(simple_x_points, simple_y_points);
%%
plot(simple_y_points, simple_x_points);

%%
plot(simple_x_points, simple_y_points);
xlabel('this is text describing the x-axis');
ylabel('this is text describing the y-axis');
title('this is text giving a title for the graph');
grid on;

%%
x_points = [-5 : .1 : 5];
y_points = x_points .^ 2;
plot(x_points,y_points);
xlabel('x-axis'); ylabel('y-axis'); title('A Parabola');
grid on

%% Multiple Plots and Subplots
x_points = [-10 : .05 : 10];
plot(x_points, exp(x_points));
%%
grid on
hold on
plot(x_points, exp(.95 .* x_points));
plot(x_points, exp(.85 .* x_points));
plot(x_points, exp(.75 .* x_points));
xlabel('x-axis'); ylabel('y-axis');
title('Comparing Exponential Functions');

%%
x_points = [-10 : .05 : 10];
line = 5 .* x_points;
parabola = x_points .^ 2;
exponential = exp(x_points);
absolute_value = abs(x_points);
subplot(2,2,1);plot(x_points,line);
title('Here is the line');
subplot(2,2,2);plot(x_points,parabola);
title('Here is the parabola');
subplot(2,2,3);plot(x_points,exponential);
title('Here is the exponential');
subplot(2,2,4);plot(x_points,absolute_value);
title('Here is the absolute value');

%% Line Plots in Three Dimensions
clf; % clear the figure
X = [10 20 30 40];
Y = [10 20 30 40];
Z = [0 210 70 500];
plot3(X,Y,Z); grid on;
xlabel('x-axis'); ylabel('y-axis'); zlabel('z-axis');
title('Pretty simple');

%% 
Z = [0 : pi/50 : 10*pi];
X = exp(-.2.*Z).*cos(Z);
Y = exp(-.2.*Z).*sin(Z);
plot3(X,Y,Z); grid on;
xlabel('x-axis'); ylabel('y-axis'); zlabel('z-axis');...
title('A little more interesting!');

%% Three-Dimensional Surface Mesh Plots
x_points = [-10 : 1 : 10];
y_points = [-10 : 4 : 10];
[X, Y] = meshgrid(x_points,y_points);
Z = X.^2 + Y.^2;
mesh(X,Y,Z); xlabel('x-axis'); ...
ylabel('y-axis');zlabel('z-axis');
%-------------------------------------------------------

%% logical operators
% 'AND' &&
% 'OR'  ||
% 'NOT' ~
a = 4;
b = -8;
(a > 0) && (b>0)
(a > 0) || (b>0)
(a > 0) && ~(b>0)

%% for loop
% calculate 1+2+...+100

s = 0;
for i = 1:100
    s = s+i;
end

fprintf('The sum is %i\n',s)
save("-ascii", "test.dat", "s");
%%

% Remark:
% You can create a PDF or HTML version of this MATLAB file by 
% choosing opening it in the MATLAB Editor and choosing "File > Publish ..."



%% basic algebra

x = 5; y = 10; 

a = x*y; b = x/y; c = mod(y,x);

fprintf('x times y = %i\n',a)       % fprintf is for screen output
fprintf('x divided by y = %g\n',b)  % \n is for a line change
fprintf('y mod x = %d\n',c)         % we use  '  ' for char strings.

%% basic plot

x = 0:0.1*pi:2*pi;      % create an array for x with dx = 0.1pi
y = cos(x);             % let y = cos(x)
f = @(x) cos(x);        % we can also define a function


figure(1);              % used for different window
plot(x,y);             
grid on                 % default is off 
xlabel('x')             % name the axes
ylabel('y')
legend('y = cos(x)')    % legend
set(gca,'fontsize',16)  % set fontsize

figure(2);
plot(x,f(x),'k--*')
% grid on
xlabel('x')
ylabel('f(x)')
% legend can be adjusted easily
legend('f(x)=cos(x)','location','north')
set(gca,'fontsize',16)  % set fontsize

%%

% for loop
sum = 0;
prod = 1;
for i = 1:10
    sum = sum + i;
    prod = prod*i;
end
fprintf('Sum of integers from 1 to 10 is %i\n', sum)
fprintf('Product of integers from 1 to 10 is %i\n', prod)
fprintf('10! = %i\n',factorial(10))

%% Calculate Partial sums

sum = 0;

% for loop

for n = 0:10
    sum = sum + (-1)^n/(2*n+1);

fprintf('the %i th partial sum is %.4f\n',n,sum);
end

%%

% matrices
A = magic(5);       % create a random matrix with elements from 1 to 25
B = zeros(5);       % zero matrix of size 5x5
C = ones(5);        % 5x5 matrix with all ones
D = eye(5);        % identity matrix of size 5x5

E = A+B; F = A*B; 
G = A\D;          % This means that G * A = D i.e. G = D*inv(A)

%% if...then... statement

a = [1 2 3 4 5 ];

for i = 1:length(a)
    if (a(i)^2 >5)
        fprintf('%i square is greater than 5\n',a(i));
    else
        fprintf('%i square is not greater than 5\n',a(i));
    end
end

%% while loop

x = 100;
k = 0;

while(x~=0)
 x = x-1;
 k = k+1
end


