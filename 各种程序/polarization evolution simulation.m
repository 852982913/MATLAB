%% =========Fiber Parameters of SMF-28=================
gamma=13e-4; %nonlinear parameter（1/W/m）
LB=15; %beat length（m）    拍长，两个偏振分量间功率的周期交换，这个周期就称为拍长。
kappa=pi/LB; %linear birefringence parameter（m）
q=2*pi*(n*turns/m); %twist rate（rad/m）
rho=0.05*q; %rotatory power(1/m)
% -----------------初始条件----------------
P0=I0 % initial pulse power（W）
psi=psi0 % initial orientation(rad)
(u,v)=(u0,v0); % initial polarization state
% S3=0,则(u,v)=(1/sqrt(2),1/sqrt(2))
% S3=0.2,则(u,v)=(sqrt(3/5),sqrt(2/5))
% S3=0.4,则(u,v)=(sqrt(7/10),sqrt(3/10))
% S3=0.6,则(u,v)=(sqrt(4/5),sqrt(1/5))
% S3=0.8,则(u,v)=(sqrt(9/10),sqrt(1/10))
% S3=1,则(u,v)=(1,0)
A1in=sqrt(P0)*u*exp(i*psi); % A+(z=0)
A2in=sqrt(P0)*v*exp(-i*psi);% A-(z=0)

%% ===============spatial array=====================

distance = zf;% total fiber length of propagation
h=delta_x;% h-step size
step_num=zf/delta_x;% number of iterative steps
z=(0:h:zf);%spatial vector z=[0,h,2h,...,zf]

%% Numberical integration of the NLSE by Dormand-Prince method in MATLAB
z=linspace(0,distance,round(distance/h));
A0=[real(Alin);imag(Alin);real(A2in);imag(A2in)];
opts=odeset('RelTol',1e-8,'AbsTol',1e-6);
[z,A]=ode45(@imaginaryNLSE,z,A0,opts);
% Numberical solution of the cotinuous wave propagatin over z_f m of 
% twisted single mode fiber:
A1out=A(:,1)+li*A(:,2);%A_+(z)
A2out=A(:,3)+li*A(:,4);%A_-(z)
% ------------------------------------------------------------
fuction f=imaginaryNLSE(z,Av)
At(1)=Av(1)+li*Av(2);
At(2)=Av(3)+li*Av(4);
% Evaluation of the complexNLSE function
Ap=complexNLSE(z,At);
% Return real and imaginary part
f=[real(Ap(1)); imag(Ap(1));real(Ap(2)); imag(Ap(2))];
% -------------------------------
fuction f=complexNLSE(z,A)
% g←γ，q←q，K←κ
Pr=0.05*q;
f=zeros(1,2);
f(1,1)=li*(2/3)*g*(abs(A(1)).^2+2*abs(A(2)).^2).*A(1)+li*Pr.*A(1)+li*k*exp(2i*q*z).*A(2);
f(1,2)=li*(2/3)*g*(abs(A(2)).^2+2*abs(A(1)).^2).*A(2)-li*Pr.*A(2)+li*k*exp(-2i*q*z).*A(1);


%% =Numerical algorithm used to obtain the evolution of the azimuth angle=================
% S_1←S1(z),S_2←S_2(z)
step_num=round(step_num);
for r = 1:number
    for k=1:step_num
        chi(k,r)=azimuth_angle(S1(k,r),S2(k,r));
    end
end
% Azimuth angle χ(z)←chi(1:step_num,1)


fuction [psi]=azimuth_angle(S1,S2)
if abs(S1)<1*10^-7
    S1=0;
end
if abs(S2)<1*10^-7
    S2=0;
end
if S1>0 && S2>0
    psi=atan(S2/S1);
else if S1<0 && S2>0
        psi=pi-atan(S2/abs(S1));
else if S1<0 && S2<0
        psi=pi+atan(abs(S2/S1));
else if
        psi=3*pi/2+atan(S1/abs(S2));
end
end
end
end
if S1==0
    if S2>0
        psi=pi/2;
    else
        psi=3*pi/2;
    end
end
if S2==0
    if S1>0
        psi=0;
    else
        psi=pi;
    end
end









