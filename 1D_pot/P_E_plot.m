% Define the coefficients a, b, and g
%alpha0 = 275.9
%alpha1 = 5.072e+04;
%alpha11 = -6.208e+06;
%alpha12 = 6.56e+04;
%alpha111 = 1.348e+07;
%alpha112 = 0;
epsilon = 1e7;

alpha0 = 119.61e3;
alpha1 = 2.099e+04;
beta = -2.844e+04;
gamma = 2.546e+06;
Q11=0.0228;
%======================Scaling==============================
ab=1e7;
alpha0=alpha0/ab;
alpha1=alpha1/ab;
%alpha11=alpha11/ab;
%alpha111=alpha111/ab;
%alpha112=alpha112/ab;
%alpha12=alpha12/ab;
%alpha2=alpha2/ab;
beta=beta/ab;
gamma=gamma/ab;

% Define multiple values of E
%T_values = [300, 400, 500, 600, 700, 800];
T_values = [300];

% Define the range of E values
%E_values = linspace(-20, 20, 100); % This will create 100 points between -20 and 20 for E
% Create a figure with 1080p resolution
figure('Position', [100, 100, 1300, 1080]);

% Define the range of P values
P = linspace(-2, 2, 100); % This will create 100 points between -2 and 2

% Plot the equation for each value of E
hold on; % This allows multiple curves to be plotted on the same figure
for T = T_values
    %E = alpha0 + 2*alpha1 * (T - 676) * P + 3*alpha12 * P.^2 + 4*alpha11 * P.^3  + 6*alpha111 * P.^5 + 4*alpha112 * P.^3;
    E = alpha0 + 2*alpha1 * (T - 676) * P + 3*beta * P.^2 + 4*gamma * P.^3;
    plot(E, P, 'LineWidth', 5);
end
hold off;

% Add labels and title
set(gca, 'FontSize', 80);
xlabel('E (V/m)', 'FontSize', 80);
ylabel('Polarization', 'FontSize', 80);
title('E(P) = \alpha_0 + 2\alpha_1 P + 3\beta P^2 + 4\gamma P^3 ', 'FontSize', 40);
grid on;

%line([0 0], ylim, 'Color', 'k', 'LineWidth', 2); % Vertical line
%line(xlim, [0 0], 'Color', 'k', 'LineWidth', 2); % Horizontal line

% Remove x and y labels and data axis
%axis off;


% Add a legend to differentiate between different curves
%legend('T = 300 K', 'T = 500 K', 'T = 700 K', 'T = 800 K');

% Save the figure as a tight-fit PDF file with high resolution
pdfFileName = 'P-E.pdf';
exportgraphics(gcf, pdfFileName, 'ContentType', 'vector', 'Resolution', 1080);  % Here 300 DPI is an example, adjust as needed
disp(['Tight-fit PDF saved as "', pdfFileName, '" in the current location.']);

