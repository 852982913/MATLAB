%------------定义式-----------
clear;clc;
syms beta;M=[sqrt(beta),0;0,0];%定义隔离器M
syms W2;syms W4;W2=[-1i,0;0,1i];W4=1/sqrt(2).*[1-1i,0;0,1+1i];%定义pc

syms a1;syms a2;
rot_p1=[cos(a1),-sin(a1);sin(a1),cos(a1)];rot_p2=[cos(a2),-sin(a2);sin(a2),cos(a2)];%定义正旋转角
rot_n1=[cos(-a1),-sin(-a1);sin(-a1),cos(-a1)];rot_n2=[cos(-a2),-sin(-a2);sin(-a2),cos(-a2)];%定义负旋转角

syms u_in;syms v_in;syms u_out;syms v_in;
% -----------计算------------
answer=rot_p2*W2*rot_n2*rot_p1*W4*rot_n1*M*[u_in;v_in]%计算


-beta^(1/2)*u_in*(2^(1/2)*cos(a1)*(cos(a1)*(cos(a2)^2*1i - sin(a2)^2*1i) + cos(a2)*sin(a1)*sin(a2)*2i)*(1/2 - 1i/2) + 2^(1/2)*sin(a1)*(sin(a1)*(cos(a2)^2*1i - sin(a2)^2*1i) - cos(a1)*cos(a2)*sin(a2)*2i)*(1/2 + 1i/2))
 beta^(1/2)*u_in*(2^(1/2)*cos(a1)*(sin(a1)*(cos(a2)^2*1i - sin(a2)^2*1i) - cos(a1)*cos(a2)*sin(a2)*2i)*(1/2 - 1i/2) - 2^(1/2)*sin(a1)*(cos(a1)*(cos(a2)^2*1i - sin(a2)^2*1i) + cos(a2)*sin(a1)*sin(a2)*2i)*(1/2 + 1i/2))
 