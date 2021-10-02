% Program for evaluating and graphing integrals
clear all
clc
syms y(x) x;
Dy = diff(y);

while true
    % selection reverts back to 0 to prevent infinite loop
    selection = 0;
    % func_string takes the user's input and
    % turns the input into a string
    disp("Type 'q' to quit")
    func_string = input("Please type in your functions using x:\n",'s');
    % Used to stop the program
    if func_string == 'q'
        break
    end
    % tests if the function is graphable
    % checks func_string for string 'q'
    try
        % func will be the function used for plot
        % e.g. Selection 3: 2*x will be plotted as y = 2*x
        func = str2sym(func_string);
        % indef_func will be used for printing results from function
        % e.g Selection 1: 2*x = x^2 + C1
        indef_func = matlabFunction(func);
        % if not, then returns back to top and prints warning
    catch
        warning("Function %s is invalid. Please try again", func_string)
        continue
    end
    % 4 fprintf statements below display options for user to input
    fprintf("Option 1: Indefinite integral\n")
    fprintf("Option 2: Definite integral\n")
    fprintf("Option 3: Graph of function\n")
    fprintf("Option 4: Change function\n")
    % loops until user inputs a number from vector below.
    while selection ~= [1,2,3,4]
        selection = input("Input number for desired option: ")
        % Returns indefinite integration of function
        if selection == 1
            zint = dsolve(Dy == indef_func)
            % Returns value of definite integral from a to b
            
        elseif selection == 2
            a = input('Input the lower bound for your integral: ')
            b = input('Input the upper bound for your integral: ')
            area = integral(indef_func,a,b)
            
        % Graphs function with domain [x1.x2]
        elseif selection == 3
             x1 = input('Input left domain of the graph: ')
             x2 = input('Input right domain of the graph: ')
             %opens up a new window for every graph
             figure
             hold on
             fplot(func,[x1 x2],'-r')
             f = @(x)0*x;
             fplot(f,[x1 x2],'-k')
             xlabel('x-axis')
             ylabel('y-axis')
             title(['Graph of function ',func_string,' with domain from ',int2str(x1), ...
             ' to ',int2str(x2)])
             hold off
                
        %Breaks selection loop and rerturns to inputting function
        elseif selection == 4
             break
             %Returns back to inputting selection
        else
        fprintf("Number %d is not an option\n", selection)
        end
    end
end