% MATLAB assignment 1
% Instruction:
% 1. First, display your name.
% 2. Write a formula that converts Celsius to Fahrenheit in a function
% 3. Have an input in degree C then ouput it in degree F using fprintf

fprintf('my name is Peter Fu\n');

C = input("Enter a number in degree C:");
F = CelsiusToFahrenheit(C);
fprintf('%.2f degree C is the same as %.2f degree F\n',C,F);





% ----------------------------------------------------------

function F = CelsiusToFahrenheit(C)

F = C*9/5 +32;

end