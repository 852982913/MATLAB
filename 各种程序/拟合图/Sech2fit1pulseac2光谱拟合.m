clear all;clc;close all
format long
trace=load('W0003.csv');
xin=trace(:,1);
yin=10.^(trace(:,2)/10);%dBm换算过去

% fx =inline('sech((pi*a(1)*a(2))/3.526).^2','a');%拟合

% zxbc=(trace(1,1)+trace(end,1))/2;

% a=nlinfit(xin,yin,fx,1555);%a(2)a(5)是中心波长
fx =inline('a(1)*(sech((xin-a(2))/a(3))).^2+a(4)*(sech((xin-a(5))/a(6))).^2','a','xin');%拟合
a=nlinfit(xin,yin,fx,[1 1558 1 1 1569 1]);%a(2)a(5)是中心波长
x=trace(:,1);
y1=a(1)*(sech((x-a(2))/a(3))).^2;
y2=a(4)*(sech((x-a(5))/a(6))).^2;
% subplot(121)
plot(xin,10*log10(yin),'k-',x,10*log10(y1),'b--',x,10*log10(y2),'r--',x,10*log10(y1+y2),'g-.');
hold on
plot(xin,10*log10(yin),xin,10*log10(y1),'r--')
% FWHM=1.763*a([3 6])
xlabel('Wavelength (nm)')
ylabel('Spectral intensity (dBm)')




