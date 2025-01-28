% MATLAB assignment 1
% Instruction:
% 1. First, display your name.
% 2. Write a formula that converts Celsius to Fahrenheit in a function
% 3. Have an input in degree C then ouput it in degree F using fprintf

% 1.
name = "Brian Niski";

disp(name);
% fprintf(name + "\n");

% 3.
prompt = "Input temperature in degree C: ";
celsius = input(prompt);
fprintf('The inputed temperature in degree F: %f\n', celsiusToFahrenheit(celsius));

% 2.
function F = celsiusToFahrenheit(celsius)
    F = (celsius * 1.8) + 32;
end