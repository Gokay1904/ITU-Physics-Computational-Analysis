x1 = [-10:0.1:10];

x2 = zeros(size(x1));

% 2x1-3x2=7
% solution for 1st equation for x2 = (2x1-7)/3

eqn1_x2 =round((((2*x1) - 7)/3),2);

% 3x1-7x2=11
% solution for 2nd equation for x2 = (3x1-11)/7
eqn2_x2= round((((3*x1) -11)/7),2);

% I just rounded numbers because intersection point can be missed
% due to decimals x.000y


% By plotting different x2's with the same x1 values.
% The intersection of each line gives us the solution for x2

plot(x1,eqn1_x2);
hold on
plot(x1,eqn2_x2);
hold off
legend("2x1-3x2=7","3x1-7x2=11");

% By observing the plot, it can be seen that solution for x1 = 3.2 
% while x2 = (-0.2)

%Lets check is it really true:

intersection_index = find(eqn1_x2==eqn2_x2);
fprintf("Intersected in %.0f \n",intersection_index);

fprintf("---SOLUTIONS--- \n")
fprintf("Solution for x1: %.1f \n",x1(intersection_index));
fprintf("Solution for x2: %.1f \n",eqn2_x2(intersection_index));
% index can be put into eqn1 or eqn2, it doesnt matter.
