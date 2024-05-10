clear;clc;close all;
scale=1;
d=0.02;
[Px,Py]=meshgrid(-scale:d:scale,scale:-d:-scale);
[n,m]=size(Px);

% Define the coefficients
alpha0 = 286;
alpha1 = -2.22e+06;
alpha11 = -3.046e+06;
alpha12 = -6.56e+04;
alpha111 = 1.424e+07;
alpha112 = 3.173e+06;
beta1 = -6.851e+04;
beta11 = 1.926e+05;

epsilon = 1e7;

%======================Scaling==============================
ab=1e7;
alpha0=alpha0/ab;
alpha1=alpha1/ab;
alpha11=alpha11/ab;
alpha111=alpha111/ab;
alpha112=alpha112/ab;
alpha12=alpha12/ab;
beta1=beta1/ab;
beta11=beta11/ab;

Q11=0.0228; Q12=-0.018259;

E1=0.0;
E2=0.0;

Ex=E1*ones(n);
Ey=E2*ones(n);

theta = atan2(Py, Px);
GL_threefold = epsilon * cos(3 * theta);

GL_alpha0 = alpha1 * Px + alpha1 * Py;
GL_alpha1 = alpha1 * Px.^2 + alpha1 * Py.^2;
GL_beta1 = beta1 * Px.^3 + beta1 * Py.^3;
GL_alphabar11 = alpha11 * Px.^4 + alpha11 * Py.^4;
GL_beta11 = beta11 * Px.^5 + beta11 * Py.^5;
GL_alphabar12 = alpha12 * Px.^3 .* Py - alpha12 * Px .* Py.^3;
GL_alpha111 = alpha111 * Px.^6 + alpha111 * Py.^6;
GL_alpha112 = alpha112 * (Px.^4 .* Py.^2 + Px.^2 .* Py.^4);

G_GL = GL_alpha1 + GL_alphabar11 + GL_alphabar12 + GL_alpha111 + GL_alpha112 + GL_threefold - Ex .* Px - Ey .* Py;

figure('Position', [100, 100, 1500, 1080]); % Setting the figure size to 1080p resolution
surf(Px, Py, G_GL);
colormap(jet(256));
ax = gca; 
ax.FontSize = 60;
% Labeling x and y axis based on values
ax.XTick = [-scale, 0, scale];
ax.XTickLabel = {'-Px', '0', 'Px'};
ax.YTick = [-scale, 0, scale];
ax.YTickLabel = {'-Py', '0', 'Py'};

%xlabel('P_x'), ylabel('P_y'), 
zlabel('\DeltaG (MJ)')
% Removing x, y, and z axis data labels (tick labels)
%ax.XTick = [];
%ax.YTick = [];
%ax.ZTick = [];

