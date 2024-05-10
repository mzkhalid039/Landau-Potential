% Create a figure with 1080p resolution
figure('Position', [100, 100, 1300, 1080]);

% Define the coefficients
alpha1 = 138.2;
alpha11 = -1.625e+04;
alpha12 = -6.021e+06;
alpha111 = -1.431e+04;
alpha112 = 5.971e+06;
epsilon = 1e7;
Q11=0.0228;
C11=2.88e11;
C11=2.88e11;
C12=1.15e11;

% Scaling
ab=1e7;
alpha1=alpha1/ab;
alpha11=alpha11/ab;
alpha111=alpha111/ab;
alpha12=alpha12/ab;
alpha112=alpha112/ab;

C11=C11/ab;
C12=C12/ab;

K = (C11+2*C12)/3;

% Define values of T and P
T_values = [300];
P_values = [0.2];

% Define the range of epsilon values
epsilon_values = linspace(-100e7, 100e7, 100);
E_values = zeros(length(epsilon_values), length(P_values));

% Calculate E for each combination of P and epsilon
for i = 1:length(P_values)
    P = P_values(i);
    for j = 1:length(epsilon_values)
        epsilon = epsilon_values(j);
        T = T_values(1); % Assuming a single value for T from T_values
        a = 2*alpha1*(T-676)*P + 4*alpha11 * P.^3 + 6*alpha111 * P.^5 + 2*alpha12*P + 4*alpha112*P^3 + 2*Q11*epsilon^2*P - K*epsilon-2*Q11*epsilon*P^2;
        b = 0;
        c = 0; % Placeholder value for c
        E_values(j, i) = a + b + c;
    end
end

% Plot the results
hold on;
for i = 1:length(P_values)
    plot(epsilon_values, E_values(:, i), 'LineWidth', 6);
end
hold off;

% Add labels and title
set(gca, 'FontSize', 80);
xlabel('\epsilon', 'FontSize', 80);
ylabel('E (V/m)', 'FontSize', 80);
%title('E(P, \epsilon) = \alpha_0 + 2\alpha_1 P + 3\beta P^2 + 4\gamma P^3 + 1/2C_{11}\epsilon^2+2Q_{11}\epsilon^2P', 'FontSize', 40);
grid on;

% Add horizontal and vertical lines at zero
line([0 0], ylim, 'Color', 'k', 'LineWidth', 2); % Vertical line
line(xlim, [0 0], 'Color', 'k', 'LineWidth', 2); % Horizontal line

% Remove x and y labels and data axis
axis off;

% Save the figure as a tight-fit PDF file with high resolution
pdfFileName = 'P-Epsilon.pdf';
exportgraphics(gcf, pdfFileName, 'ContentType', 'vector', 'Resolution', 1080);
disp(['Tight-fit PDF saved as "', pdfFileName, '" in the current location.']);
