clear; clc;
beta2=-0.02; % 群速度色散
T0=0.74; % 1/e点半宽

C=-0.1;
delta_omega=1.36 * 10^12;
% C=sqrt((delta_omega*T0)^2-1); %啁啾参数,delta_omega 是谱1/e点半宽

q0=1.1; % 脉冲相对间隔初始值
pusai0=1/2 * pi; % 相对相位初始值
z=[10,25,40,55,80,105,125,145,160,170,202]; % 距离

LD=T0^2/abs(beta2);
kesai=z/LD; % 标准化距离

% -----------------脉冲持续时间Tz------------------------

p1=(1 + z * beta2 * C / T0^2).^2;
p2=(z * beta2 / T0^2).^2;

Tz=2 * log(1+sqrt(2)) * T0 * sqrt(p1+p2);

% -----------------啁啾参数C1----------------------------

C1=C + (1 + C^2) * (beta2 * z / T0^2);

% -----------------脉冲相对间隔q-------------------------

p3=cosh(2 * kesai * exp(1)^(-q0) * sin(pusai0));
p4=cos(2 * kesai * exp(-q0) * cos(pusai0)).^2;
q=q0 + 1/2 * log(p3+p4-1);

% -----------------拟合,画图---------------------------------

P1=polyfit(z,Tz,3)% 持续时间拟合
Tz_0=polyval(P1,z);
figure (1)
f1=scatter(z,Tz,'filled');
f1.MarkerFaceColor=[1,0.62,0.76]
hold on
plot(z,Tz_0,'LineWidth',0.5,'color','b');
xlim([0,205]);
ylim([0,12]);
xlabel('Distance (m)','fontname','Times New Roman','fontsize',20,'FontWeight','bold'); 
ylabel('Pulse duration (ps)','fontname','Times New Roman','fontsize',20,'FontWeight','bold');
legend('Experimental data','Theoretical fit');
hold off


P2=polyfit(z,q,3)% 脉冲间隔拟合
q_0=polyval(P2,z);
figure(2)
f2=scatter(z,q,'filled');
f2.MarkerFaceColor=[1,0.62,0.76]
hold on
plot(z,q_0,'LineWidth',0.5,'color','b')
xlim([0,205]);
ylim([0,14]);
xlabel('Distance (m)','fontname','Times New Roman','fontsize',20,'FontWeight','bold'); 
ylabel('Pulse separation (ps)','fontname','Times New Roman','fontsize',20,'FontWeight','bold');
legend('Experimental data','Theoretical fit');
hold off

