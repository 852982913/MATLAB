%拟合1个sech2脉冲
clear all;clc;close all
format long

filename='D:\读研\2021.8.27实验数据\光谱频谱示波器自相关\自相关\20210827自相关\下午\ACF_2021_Aug_27_12_58_48PM.csv';
trace=csvread(filename);
[ymax pos]=max(trace(:,2));%第2列为纵坐标
[ymin pos2]=min(trace(:,2));
i=(trace(:,2)-ymin)/(ymax-ymin);%归一化
t=trace(:,1)-trace(pos,1);%第1列为横坐标
[p1 p2]=max(i); 
t=t-t(p2);%最大值移到0点
% figure(1)
% plot(t,i)%原始数据画图


%计算原理
%自相关曲线为脉冲功率波形的卷积，因此其傅里叶变换=两个完全相同脉冲的傅里叶变换的乘积，即单个脉冲的傅里叶变换平方
%   设自相关信号为i(t)，傅里叶变换后得到I（w）
%   设脉冲波形信号为f(t)，傅里叶变换后得到F（w）
%   i(t)-fft-I(w)
%   f(t)-fft-F(w)
%   I(w)=F(w)^2
%  由此获得脉冲的波形f(t),然后对f(t)进行sech^2的拟合

I=fftshift(fft(fftshift(i)));%傅里叶变换
f=fftshift(ifft(fftshift(abs(I).^0.5))); %开方后进行反傅里叶变换
[p1 p2]=max(f); 
t1=t-t(p2);%最大值移到0点
% figure(2)
% plot(t1,f)

fx =inline('a(1)*(sech(t1/a(2))).^2','a','t1');%拟合
a=nlinfit(t1,f,fx,[1 1]*5000)
f_fit=a(1)*(sech(t1/a(2))).^2; 

I_fit=fftshift(fft(fftshift(f_fit)));
i_fit=fftshift(ifft(fftshift(abs(I_fit).^2))); 
i_fitnormal=(i_fit-min(i_fit))/(max(i_fit)-min(i_fit));

figure(3);
plot(t,i,'ko');hold on
plot(t1,i_fitnormal,'r-','linewidth',2);
zong=(0+max(abs(i_fitnormal)))/2
FWHM=1.763*a(2)%脉冲的3dB宽度
xlabel('Time Delay(fs)','fontname','Times New Roman','Fontsize',15,'fontweight','bold')
ylabel('Intensity(a.u.)','fontname','Times New Roman','fontsize',15,'FontWeight','bold');
set(gca,'linewidth',2)%坐标轴加粗
legend('Exp.data','Sech.fitting');
set(gca,'fontsize',13,'fontweight','bold','fontname','Times New Roman')
title('ACF-2021-Aug-27-12-58-48PM','fontname','Times New Roman','fontsize',15,'FontWeight','bold','color','r')
% str=abs(FWHM)
txt=[num2str(abs(FWHM))]%图上标注
text(-9000,0.7,txt,'fontsize',25) 
ylim([-0.1 1.1])
