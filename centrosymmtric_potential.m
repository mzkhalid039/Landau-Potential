clear;clc;close all;
scale=1;
d=0.02;
[Px,Py]=meshgrid(-scale:d:scale,scale:-d:-scale);
[n,m]=size(Px);

%T=300;
%alpha1=-3.456e+05*(T-676);
%alpha11=2.735e+06;
%alpha12=-3.958e+05;
%alpha111=-1.335e+06;
%alpha112=3.302e+06;
%beta1 = 5803
%beta11 = -4.078e+06


T=300;
alpha1=-1.371e+06*(T-676);
alpha11=4.06e+06;
alpha12=-1.369e+06;
alpha111=-7.85e+06;
alpha112=2.686e+06;
Q11=0.0228; Q12=-0.018259;

%======================Scaling==============================
ab=1e7;
alpha1=alpha1/ab;
alpha11=alpha11/ab;
alpha111=alpha111/ab;
alpha112=alpha112/ab;
alpha12=alpha12/ab;


E1=0;
E2=0;

Ex=E1*ones(n);
Ey=E2*ones(n);

GL_alpha1=alpha1*Px.^2+alpha1*Py.^2;
%GL_beta1=beta1*Px.^2+beta1*Py.^2;
GL_alphabar11=alpha11*Px.^4+alpha11*Py.^4;
%GL_beta11=beta11*Px.^5+beta11*Py.^5;
GL_alphabar12=alpha12*Px.^2.*Py.^2;
GL_alpha111=alpha111*Px.^6+alpha111*Py.^6;
GL_alpha112=alpha112*(Px.^4.*Py.^2+Px.^2.*Py.^4);

% 3-fold rotational symmetry term
theta = atan2(Py, Px);
GL_threefold = alpha112 * cos(3 * theta);

e1=0;

G_GL=GL_alpha1+GL_alphabar11+GL_alphabar12+GL_alpha111+GL_alpha112-Ex.*Px + GL_threefold -Ey.*Py-e1*Q11*Px.^2;

figure('Position', [100, 100, 1500, 1080]); % Setting the figure size to 1080p resolution
surfc(Px, Py, G_GL);
colormap(winter(256));
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
ax.ZTick = [];
