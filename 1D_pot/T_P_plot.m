% Define the coefficients a, b, and g
alpha1 = 138.2;
alpha11 = -1.625e+04;
alpha12 = -6.021e+06;
alpha111 = -1.431e+04;
alpha112 = 5.971e+06;
epsilon = 1e7

%======================Scaling==============================
ab=1e7;
alpha1=alpha1/ab;
alpha11=alpha11/ab;
alpha111=alpha111/ab;
alpha112=alpha112/ab;
alpha12=alpha12/ab;

% Define multiple values of E
T_values = [300, 500, 700, 800];
E = 0;
% Define the range of E values
%E_values = linspace(-20, 20, 100); % This will create 100 points between -20 and 20 for E

% Define the range of P values
P = linspace(-1, 1, 1000); % This will create 100 points between -2 and 2

% Plot the equation for each value of E
hold on; % This allows multiple curves to be plotted on the same figure
for T = T_values
    U = alpha1 * (T - 676) * P.^2 + alpha11 * P.^4 + alpha12 * P.^2 + alpha111 * P.^6 + alpha112 * P.^4 - Q11*sigma*P.^2- E * P;
    plot(P, U, 'LineWidth', 2);
end
hold off;

% Add labels and title
xlabel('P');
ylabel('Equation Value');
title('Plot of \alpha P^2 + \beta P^4 + \gamma P^6 - EP');
grid on;

% Add a legend to differentiate between different curves
legend('T = 300 K', 'T = 500 K', 'T = 700 K', 'T = 800 K');
