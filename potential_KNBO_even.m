clear; clc; close all;
scale = 1;
d = 0.01;
[Px, Py] = meshgrid(-scale:d:scale, scale:-d:-scale);
[n, m] = size(Px);

T = 300;
alpha1 = 138.2 * (T - 676);
alpha11 = -1.625e+04;
alpha12 = -6.021e+06;
alpha111 = -1.431e+04;
alpha112 = 5.971e+06;

Q11 = 0.0228; Q12 = -0.018259;


%======================Scaling==============================
ab = 1e7;
alpha1 = alpha1 / ab;
alpha11 = alpha11 / ab;
alpha111 = alpha111 / ab;
alpha112 = alpha112 / ab;
alpha12 = alpha12 / ab;

E1 = 0.0;
E2 = 0.0;

Ex = E1 * ones(n);
Ey = E2 * ones(n);

GL_alpha1 = alpha1 * (Px.^2 + Py.^2);
GL_alphabar11 = alpha11 * (Px.^4 + Py.^4);
GL_alphabar12 = alpha12 * Px.^2 .* Py.^2;
GL_alpha111 = alpha111 * (Px.^6 + Py.^6);
GL_alpha112 = alpha112 * (Px.^4 .* Py.^2 + Px.^2 .* Py.^4);

% 3-fold rotational symmetry term
theta = atan2(Py, Px);
GL_threefold = alpha111 * cos(6 * theta) * (Px.^6 + Py.^6);

G_GL = GL_alpha1 + GL_alphabar11 + GL_alphabar12 + GL_alpha111 + GL_alpha112 + GL_threefold - Ex .* Px - Ey .* Py;


figure('Position', [100, 100, 1500, 1080]); % Setting the figure size to 1080p resolution
surfc(Px, Py, G_GL);
colormap(turbo(256));
ax = gca;
ax.FontSize = 60;
% Labeling x and y axis based on values
%ax.XTick = [-scale, 0, scale];
%ax.XTickLabel = {'-Px', '0', 'Px'};
%ax.YTick = [-scale, 0, scale];
%ax.YTickLabel = {'-Py', '0', 'Py'};

%xlabel('P_x'), ylabel('P_y'), 
%zlabel('\DeltaG (MJ)')
% Removing x, y, and z axis data labels (tick labels)
%ax.XTick = [];
%ax.YTick = [];
%ax.ZTick = [];
