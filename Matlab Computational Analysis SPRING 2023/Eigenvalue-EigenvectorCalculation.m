clc
clear

% Define the matrix
A = [[0 11 -5];[-2,17,-7];[-4,26,-10]];


% Set the initial guess for the dominant eigenvector
X_0 = [1;1;1];

c1_x1 = (A*X_0);

x1_norm = c1_x1 / abs((max(c1_x1)));

xn_norm = x1_norm;

tol = 1e-5;

previous_eigenval = 0;

% Perform the power method
while(true)

cn_xn = A*xn_norm;

xn_norm = cn_xn / abs(max(cn_xn));

eigenval = abs(max(cn_xn));

if(abs(previous_eigenval - eigenval) < tol)
 
    break;
end

previous_eigenval = abs(max(cn_xn));
previous_xnnorm = cn_xn / abs(max(cn_xn));
end

% Display the results
format long

fprintf('Dominant eigenvalue: %f\n', lambda);
fprintf('Dominant eigenvector:\n');
disp(v);
