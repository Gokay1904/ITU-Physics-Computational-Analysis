% Gökay AKÇAY 090200147
clc 
clear

%% DATA READING
% Load the data from jellyhunt.txt
data = load('jellyhunt.txt');

% Passed minutes
minutes = data(:,1);

% Hunted jellyfishes in 1 minute
hunted_jelly_fish = data(:,2);

%% CALCULATION PART

% t is equal to minutes in matrix notation.
t = minutes;

% N is the size of the minutes
N = size(t,1);

% |Σ(t^6)      Σ(t^3)   |   M matrix
% |Σ(t^3)          N    |

M = [sum(t.^6) sum(t.^3); sum(t.^3) N];

%   | Σ(hunted_jelly_fish.*t.^3) |  V matrix
%   | Σ(hunted_jelly_fish)       |

V = [sum(hunted_jelly_fish.*t.^3); sum(hunted_jelly_fish)];

% Coefficients are the linear solution of M and V matrices.
coefs = linsolve(M,V)

%% VISUALIZATION PART

% Scattering the data
scatter(minutes,hunted_jelly_fish);
hold on
% For visulalization of F(x) = A * t^3 + B
plot(coefs(1)*t.^3 + coefs(2));
xlabel("minutes")
ylabel("hunted jellies")
legend("data","fit");

