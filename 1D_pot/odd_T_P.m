% Define the coefficients a, b, and g
%alpha0 = 275.9
%alpha1 = 5.072e+04;
%alpha11 = -6.208e+06;
%alpha12 = 6.56e+04;
%alpha111 = 1.348e+07;
%alpha112 = 0;
epsilon = 1e7;

alpha0 = 119.61e1;
alpha1 = 2.099e+02;
beta = -2.844e+02;
gamma = 2.546e+04;
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
T_values = [300, 700, 1000];
E = 0;
% Define the range of E values
%E_values = linspace(-20, 20, 100); % This will create 100 points between -20 and 20 for E


% Define the range of P values
P = linspace(-2, 2, 1000); % This will create 100 points between -2 and 2

% Create a figure with 1080p resolution
figure('Position', [100, 100, 1200, 1080]);

% Plot the equation for each value of E
hold on; % This allows multiple curves to be plotted on the same figure
for T = T_values
    %U = alpha0 * P + alpha1 * (T - 676) * P.^2 + alpha12 * P.^3 + alpha11 * P.^4  + alpha111 * P.^6 + alpha112 * P.^4 - E * P;
    U = alpha0 * P + alpha1 * (T - 700) * P.^2 + beta * P.^3 + gamma * P.^4 - E * P;

    plot(P, U, 'LineWidth', 5)
end
hold off;

% Add labels and title
set(gca, 'FontSize', 80);
xlabel('P (C/m^2)', 'FontSize', 80);
ylabel('Free energy', 'FontSize', 80);
title('f-f_0 = \alpha_0 P + \alpha_1 P^2(T-Tc) + \beta P^3 + \gamma P^4 ', 'FontSize', 40);
grid on;

% Add a legend to differentiate between different curves
%legend('T = 300 K', 'T = 400 K', 'T = 500 K', 'T = 600 K', 'T = 700 K', 'T = 800 K', 'FontSize', 50, 'Location', 'best');
% Add horizontal and vertical lines at zero
%line([0 0], ylim, 'Color', 'k', 'LineWidth', 2); % Vertical line
%line(xlim, [0 0], 'Color', 'k', 'LineWidth', 2); % Horizontal line

% Remove x and y labels and data axis
%axis off;

% Save the figure as a tight-fit PDF file with high resolution
pdfFileName = 'T-P.pdf';
exportgraphics(gcf, pdfFileName, 'ContentType', 'vector', 'Resolution', 1080);  % Here 300 DPI is an example, adjust as needed
disp(['Tight-fit PDF saved as "', pdfFileName, '" in the current location.']);
