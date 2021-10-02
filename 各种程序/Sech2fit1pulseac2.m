%���1��sech2����
clear all;clc;close all
format long

filename='D:\����\2021.8.27ʵ������\����Ƶ��ʾ���������\�����\20210827�����\����\ACF_2021_Aug_27_12_58_48PM.csv';
trace=csvread(filename);
[ymax pos]=max(trace(:,2));%��2��Ϊ������
[ymin pos2]=min(trace(:,2));
i=(trace(:,2)-ymin)/(ymax-ymin);%��һ��
t=trace(:,1)-trace(pos,1);%��1��Ϊ������
[p1 p2]=max(i); 
t=t-t(p2);%���ֵ�Ƶ�0��
% figure(1)
% plot(t,i)%ԭʼ���ݻ�ͼ


%����ԭ��
%���������Ϊ���幦�ʲ��εľ��������丵��Ҷ�任=������ȫ��ͬ����ĸ���Ҷ�任�ĳ˻�������������ĸ���Ҷ�任ƽ��
%   ��������ź�Ϊi(t)������Ҷ�任��õ�I��w��
%   �����岨���ź�Ϊf(t)������Ҷ�任��õ�F��w��
%   i(t)-fft-I(w)
%   f(t)-fft-F(w)
%   I(w)=F(w)^2
%  �ɴ˻������Ĳ���f(t),Ȼ���f(t)����sech^2�����

I=fftshift(fft(fftshift(i)));%����Ҷ�任
f=fftshift(ifft(fftshift(abs(I).^0.5))); %��������з�����Ҷ�任
[p1 p2]=max(f); 
t1=t-t(p2);%���ֵ�Ƶ�0��
% figure(2)
% plot(t1,f)

fx =inline('a(1)*(sech(t1/a(2))).^2','a','t1');%���
a=nlinfit(t1,f,fx,[1 1]*5000)
f_fit=a(1)*(sech(t1/a(2))).^2; 

I_fit=fftshift(fft(fftshift(f_fit)));
i_fit=fftshift(ifft(fftshift(abs(I_fit).^2))); 
i_fitnormal=(i_fit-min(i_fit))/(max(i_fit)-min(i_fit));

figure(3);
plot(t,i,'ko');hold on
plot(t1,i_fitnormal,'r-','linewidth',2);
zong=(0+max(abs(i_fitnormal)))/2
FWHM=1.763*a(2)%�����3dB���
xlabel('Time Delay(fs)','fontname','Times New Roman','Fontsize',15,'fontweight','bold')
ylabel('Intensity(a.u.)','fontname','Times New Roman','fontsize',15,'FontWeight','bold');
set(gca,'linewidth',2)%������Ӵ�
legend('Exp.data','Sech.fitting');
set(gca,'fontsize',13,'fontweight','bold','fontname','Times New Roman')
title('ACF-2021-Aug-27-12-58-48PM','fontname','Times New Roman','fontsize',15,'FontWeight','bold','color','r')
% str=abs(FWHM)
txt=[num2str(abs(FWHM))]%ͼ�ϱ�ע
text(-9000,0.7,txt,'fontsize',25) 
ylim([-0.1 1.1])
