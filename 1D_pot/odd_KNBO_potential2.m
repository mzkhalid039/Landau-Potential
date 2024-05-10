clear;clc;close all;
scale=0.3;
d=0.001;
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
Tc=676;

% Define the coefficients a, b, and g
alpha0 = 286;
alpha1 = 2.22e+06;
alpha11 = -3.046e+06;
alpha12 = -6.56e+04;
alpha111 = 1.424e+07;
alpha112 = 3.173e+06;
beta1 = -6.851e+04;
beta11 = 1.926e+05;
alpha1111 = 0;
alpha1112 = 0;
alpha1122 = 0;

epsilon = 1e7;



Q11=0; Q12=-0;
E1=0;
E2=0;
Ex=E1*ones(n);
Ey=E2*ones(n);

for i=1:200
    T=200+i;
    alpha1=2.22*1e6*(T-Tc);
    GL_alpha1=alpha1*Px.^2+alpha1*Py.^2;
    GL_alphabar11=alpha11*Px.^4+alpha11*Py.^4;
    GL_alphabar12=alpha12*Px.^2.*Py.^2;
    GL_alpha111=alpha111*Px.^6+alpha111*Py.^6;
    GL_alpha112=alpha112*(Px.^4.*Py.^2+Px.^2.*Py.^4);
    GL_alpha1111=alpha1111*Px.^8+alpha1111*Py.^8;
    GL_alpha1112=alpha1112*(Px.^6.*Py.^2+Px.^2.*Py.^6);
    GL_alpha1122=alpha1122*Px.^4.*Py.^4;
    G_GL=GL_alpha1+GL_alphabar11+GL_alphabar12+GL_alpha111+GL_alpha112+GL_alpha1111+GL_alpha1112+GL_alpha1122-Ex.*Px-Ey.*Py;
    G_min=min(min(G_GL));
    a=find(G_GL==G_min);
    y=mod(a(1),n);
    x=floor(a(1)/n);
    P(i)=sqrt(Px(x,y)^2+Py(x,y)^2);
end
T=(201:400);
plot(T,P);
