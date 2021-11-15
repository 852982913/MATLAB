clear all;clc;format long;
xita=pi/4; % pi/6,pi/12   �������߷ֱ�ȡ45��30��15��

ex=300+3000i;ey=50+5000i; % ����ex��ey
faipc=2*pi; %�����pc
wl=1548:0.01:1552; %���岨��

n=0.0004;L=0.25
fail=2*pi./wl*n*L;   %�����L

% ====================͸���ʹ�ʽ=====================
p1=ey*sin(xita);
p2=ex*cos(xita)*exp(j*fail);
p3=ey;
p4=ex*sin(xita);
p5=ey*cos(xita)*exp(-j*(fail+faipc))

fenzi=(abs(p1+p2+p3-p4+p5)).^2;
fenmu=abs(ex).^2+abs(ey).^2;
T=fenzi/fenmu;

% =================��ͼ================
plot(wl,T);hold on;
xlabel('Wavelength (nm)','fontname','Times New Roman','fontsize',20,'FontWeight','bold'); 
ylabel('Transmission (dB)','fontname','Times New Roman','fontsize',20,'FontWeight','bold');


