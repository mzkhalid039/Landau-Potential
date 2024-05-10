% Define the coefficients a, b, and g
%alpha0 = 275.9
%alpha1 = 5.072e+04;
%alpha11 = -6.208e+06;
%alpha12 = 6.56e+04;
%alpha111 = 1.348e+07;
%alpha112 = 0;
epsilon = 1e7;

alpha0 = 274.6
alpha1 = 4.996e+06;
alpha2 = -6.538e+04;
beta = 5.991e+06;
%======================Scaling==============================
ab=1e7;
alpha0=alpha0/ab;
alpha1=alpha1/ab;
alpha11=alpha11/ab;
alpha111=alpha111/ab;
alpha112=alpha112/ab;
alpha12=alpha12/ab;
alpha2=alpha2/ab;
beta=beta/ab;

% Define multiple values of E
T_values = [300];

% Define the range of E values
%E_values = linspace(-20, 20, 100); % This will create 100 points between -20 and 20 for E

% Define the range of P values
P = linspace(-1, 1, 100); % This will create 100 points between -2 and 2

% Plot the equation for each value of E
hold on; % This allows multiple curves to be plotted on the same figure
for T = T_values
    epsilon =  2*alpha1 * (T - 676) + 6*alpha2 * P + 12*beta * P.^2;
    plot(P, epsilon, 'LineWidth', 4);
end
hold off;

% Add labels and title
xlabel('P');
ylabel('(1/\epsilong)');
%title('Plot of 2\alpha P + 4\beta P^3 + 6\gamma P^5');
grid on;


% Add a legend to differentiate between different curves
%legend('T = 300 K', 'T = 500 K', 'T = 700 K', 'T = 800 K');
