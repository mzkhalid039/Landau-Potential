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
%exy = 0;

Q11=0.0228;
Q12=-0.018259;
Q44=0.064;

C11=2.88e11;
C12=1.15e11;
C44=1.76e10;

%======================Scaling==============================
ab = 1e7;
alpha1 = alpha1 / ab;
alpha11 = alpha11 / ab;
alpha111 = alpha111 / ab;
alpha112 = alpha112 / ab;
alpha12 = alpha12 / ab;

Q11 = Q11 / ab;
Q12 = Q11 / ab;
Q44 = Q11 / ab;

C11 = C11 / ab;
C12 = C12 / ab;
C44 = C44 / ab;

flag=(C12*C44)/C44;
D=C11+flag.*(C11+C12); % material's response to longitudinal and shear stiffness components of deformation and elastic anisotropy

ex=(C44+(C11-C44))/(C44.*D); 
ey=(C44+(C11-C44))/(C44.*D);
exy= -(C12+C44)/(C44.*D);

E1 = 1e14;
E2 = 1e14;

Ex = E1 * ones(n);
Ey = E2 * ones(n);

theta = atan2(Py, Px);
GL_threefold = alpha112 * cos(3 * theta);


flx = 2*Px*alpha1 + alpha112*(4*Px^3*Py^2 + 2*Px*Py^4) + 4*Px^3*alpha11 + 6*Px^5*alpha111 + 4*Py*Q44*exy + 2*Px*ey*(Q11 - 2*Q44) + 2*Px*Py^2*alpha12 + 2*Px*Q11*ex^2 + GL_threefold  - Ex;
fly = 2*Py*alpha1 + alpha112*(2*Px^4*Py + 4*Px^2*Py^3) + 4*Py^3*alpha11 + 6*Py^5*alpha111 + 4*Px*Q44*exy + 2*Py*ex*(Q11 - 2*Q44) + 2*Px^2*Py*alpha12 + 2*Py*Q11*ey^2 + GL_threefold - Ey;

fex = 2*Q11*ex*Px^2 + (Q11 - 2*Q44)*Py^2 + C11*ex + (ey*(2*C11 - 4*C44))/2;
fey = (Q11 - 2*Q44)*Px^2 + 2*Q11*ey*Py^2 + C11*ey + 4*C44*ey + (ex*(2*C11 - 4*C44))/2;


G_GL = flx + fly - fex - fey;


figure('Position', [100, 100, 1500, 1080]); % Setting the figure size to 1080p resolution
surfc(Px, Py, G_GL);
colormap(wintermap(256));
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
ax.XTick = [];
ax.YTick = [];
%ax.ZTick = [];
%zlim([-1 1])
