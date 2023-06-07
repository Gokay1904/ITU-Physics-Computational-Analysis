clc 
clear all

% Here are the roots.
x_p2 = [0.57735 -0.57735];
x_p3 = [0        0.774597 -0.774597];
x_p4 = [0.339981 -0.339981 0.861136 -0.861136];
x_p5 = [0        0.538469 -0.538469  0.90618 -0.90618];

%  In order for the column numbers of the weight and root matrices to be consistent,
%  one of the same roots added into matrix. Because some of these 
%  weight indexes will be multiplied by both plus and minus roots.

w_p2 = [1];
w_p3 = [0.888889 0.555556 0.555556];
w_p4 = [0.652145 0.652145 0.347855 0.347855];
w_p5 = [0.568889 0.478629 0.478629 0.236927 0.236927];

% I defined a function given in the question.
q = @(x) exp(-x);

format long

% For 2nd Quadrature
res_q2 = sum(w_p2.* q(x_p2))

% For 3rd Quadrature
res_q3 = sum(w_p3.* q(x_p3))

% For 4th Quadrature
res_q4 = sum(w_p4.* q(x_p4))


% For 5th Quadrature
res_q5 = sum(w_p5.* q(x_p5))

% Original Solution
original_solution = integral(q,-1,1)





