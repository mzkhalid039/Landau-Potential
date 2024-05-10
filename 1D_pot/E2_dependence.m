% Define the coefficients a, b, and g
alpha1 = 138.2;
alpha11 = -1.625e+04;
alpha12 = -6.021e+06;
alpha111 = -1.431e+04;
alpha112 = 5.971e+06;
epsilon = 1e7;
Q11=0.0228;

%======================Scaling==============================
ab=1e7;
alpha1=alpha1/ab;
alpha11=alpha11/ab;
alpha111=alpha111/ab;
alpha112=alpha112/ab;
alpha12=alpha12/ab;



% Define multiple values of P
P_values = [0.2, 0.3, 0.4];


% Define the range of E and sigma values
sigma_values = linspace(-200, 200, 100); % This will create 100 points between -20 and 20 for sigma
E_values = zeros(length(sigma_values), length(P_values)); % Initialize E_values matrix

% Calculate E for each combination of P and sigma
for i = 1:length(P_values)
    P = P_values(i);
    a = 2*alpha1 * P + 4*alpha11 * P.^3 + 6*alpha111 * P.^5;
    b = 2*alpha12 * P + 4*alpha112 * P.^3 - 2*Q11*P;
    c = 0; % Assuming a placeholder value for c, adjust as needed
    
    for j = 1:length(sigma_values)
        sigma = sigma_values(j);
        E_values(j, i) = -a * sigma^2 + b + c;
    end
end

% Plot the results
figure;
hold on;
for i = 1:length(P_values)
    plot(sigma_values, E_values(:, i), 'LineWidth', 2);
end
hold off;

% Add labels, title, and legend
xlabel('Sigma (σ)');
ylabel('Electric Field (E)');
title('Quadratic relationship between E and σ for different values of P');
grid on;
legend('P = 0.2', 'P = 0.4', 'P = 0.6', 'P = 0.8');
