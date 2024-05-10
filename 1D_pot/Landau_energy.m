% Define the coefficients alpha1, alpha11, alpha12, alpha111, and alpha112
T = 300;
alpha1 = 138.2 * (T - 676);
alpha11 = -1.625e+04;
alpha12 = -6.021e+06;
alpha111 = -1.431e+04;
alpha112 = 5.971e+06;

%======================Scaling==============================
ab=1e7;
alpha1=alpha1/ab;
alpha11=alpha11/ab;
alpha111=alpha111/ab;
alpha112=alpha112/ab;
alpha12=alpha12/ab;

% Define multiple values of E
%E_values = [0, 4e5, 8e5, 12e5, 16e5, 20e5, 24e5];
E_values = [0, 0.04, 0.08, 0.12,0.16,0.2,0.24];

% Define the range of P values
P = linspace(-1.025, 1.025, 100); % This will create 100 points between -10 and 10

% Plot the equation for each value of E
figure; % Create a new figure
hold on; % This allows multiple curves to be plotted on the same figure
for E = E_values
    U = alpha1 * P.^2 + alpha11 * P.^4 + alpha12 * P.^2 + alpha111 * P.^6 + alpha112 * P.^4 - E * P;
    plot(P, U, 'LineWidth', 3);
end
hold off;

ax = gca; 
ax.FontSize = 18; 

% Add labels and title
xlabel('Polarization (C/m^2)');
ylabel('\DeltaG (MJ)');
%title('F = \alpha_1 P^2 + \alpha_{11} P^4 + \alpha_{12} P^2 + \alpha_{111} P^6 + \alpha_{112} P^4 - E P');
grid on;
xlim([-1.25 1.25])
% Add a legend to differentiate between different curves
legend('E = 0 kV/cm','E = 4 kV/cm', 'E = 8 kV/cm', 'E = 12 kV/cm', 'E = 16 kV/cm', 'E = 20 kV/cm', 'E = 24 kV/cm', Fontsize = 18);
