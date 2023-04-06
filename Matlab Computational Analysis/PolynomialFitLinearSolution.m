clear
clc

% Order can be adjusted for any other degrees. Here I defined the order 3.
order = 3;

% Given data in the question
x = [1;2;3;4;5];
y = [2;4;1;3;8];

% N is the size of the data
N = size(x,1);

% M must be a matrix of order+1 x order+1 .

M = zeros(order+1,order+1);

% V must be a matrix of order+1 x 1 .
V = zeros(order+1,1);

% A is the coefficient for the equation is must be also order+1 because of x^0.
a = zeros(order+1,1);


%M(1) and V(1) is same for all orders.
M(1) = N;
V(1) = sum(y);

for i=1:(order+1)
   
    % If it is the first row then add normally.
    if(i == 1)
        for j=2:(order+1)
            M(i,j) = sum(power(x,j));
        end 
 
    
    else  
        % If it is other other rows increase the power of first indices by 1.
        for j=1:(order+1)
            M(i,j) = sum(power(x,j+i-1));
        end
         % I also defined V in the same loop.
        V(i) = sum(power(x,i-1).*y);

    end
end


% Find the Linear Solution for M * a = V. It is the same with M\V operation.

a = linsolve(M,V);

% Create fit datas for visualizing.
x_fit = [1:size(x,1)];
y_fit = zeros(size(x_fit,2),1);

% Define each y data for given coefficients.
for k = 1: size(x_fit,2)

    for e = 1:(order+1)
       y_fit(k) = y_fit(k) + power(x_fit(k),e)*a(e);
    end
      
end


% Fit data is plotted.

plot(x_fit,y_fit);
hold on
% Given data in the question.
scatter(x,y)

M
V
a
