clear all;clc;format long;
theta=pi/2; % pi/6,pi/12   三条曲线分别取45°30°15°

Ex=1;Ey=0.5; % 定义ex，ey
phipc=0.15*pi; %定义φpc
wl=1545:0.01:1580; %定义波长

deltan=0.0004;L=0.23;
phil=2*pi./wl*deltan*L;   %定义φL

% ====================透过率公式=====================
p1=Ey*sin(theta);
p2=Ex*cos(theta)*exp(i*phil);
p3=-Ex*sin(theta);
p4=Ey*cos(theta)*exp(-i*(phil+phipc));

numerator=sqrt((abs(p1+p2+p3+p4)).^2);
denumerator=abs(Ex).^2+abs(Ey).^2;
T=numerator/denumerator;

% =================画图================
plot(wl,T);hold on;
xlabel('Wavelength (nm)','fontname','Times New Roman','fontsize',20,'FontWeight','bold'); 
ylabel('Transmission (%)','fontname','Times New Roman','fontsize',20,'FontWeight','bold');


