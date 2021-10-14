clear all;clc;close all
format long
trace=load('W0012.CSV');
xin=trace(:,1);
yin=10.^(trace(:,2)/10);
figure(1)

% -------------------拟合--------------------

fx =inline('a(1)*(sech((xin-a(2))/a(3))).^2+a(4)*(sech((xin-a(5))/a(6))).^2','a','xin');%拟合
a=nlinfit(xin,yin,fx,[1 1555.648 1 1 1559.376 1]);%a(2)a(5)是中心波长
x=trace(:,1);
y1=a(1)*(sech((x-a(2))/a(3))).^2;
y2=a(4)*(sech((x-a(5))/a(6))).^2;
FWHM=1.763*a([3 6])

% ----------------- 画图 --------------------

plot(xin,10*log10(yin),'k-');hold on % 原图
plot(x,10*log10(y1),'b--');% 第一个拟合
plot(x-1.5,10*log10(y2)+3.5,'r--');% 第二个拟合
% plot(x,10*log10(y1+y2),'g-.');% 总拟合

% --------------- 调整图更美观 ------------------

xlim([1500,1600])
ylim([-220,-30])
xlabel('Wavelength (nm)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r')
ylabel('Spectral intensity (dBm)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r')
title('W0012.CSV拟合','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r')

% --------------- 寻峰（中心波长1） ----------------

zxbc_dbm=findpeaks(trace(:,2));%伪峰值
zxbc_dbm=sort(zxbc_dbm,'descend');%降序排列
zxbc_dbm1=zxbc_dbm(6);%峰值，即中心波长,改这个改这个改这个改这个改这个改这个改这个
% 改这个改这个改这个改这个改这个改这个改这个改这个改这个改这个改这个改这个改这个
% 改这个改这个改这个改这个改这个改这个改这个改这个
[raw1,col1]=find(trace==zxbc_dbm1);%获取峰值点的坐标
zxbc_1=trace(raw1,1);
zxbc_1=zxbc_1(1)%出错时选择执行，直接执行也可以，但会降低程序效率
plot(zxbc_1,zxbc_dbm1,'.','color','r','MarkerSize',20);%峰值红点
txt=[num2str(zxbc_1),' nm'];%图上标注
nameda = 'λ =            ';
text(zxbc_1+5,zxbc_dbm1+10,txt,'fontsize',20);
text(zxbc_1+2,zxbc_dbm1+10,nameda,'fontsize',20);%符号λ

% -----------------寻峰（中心波长2）------------------

zxbc_dbm2=zxbc_dbm(50);%峰值，即中心波长,改这个改这个改这个改这个改这个改这个改这个
% 改这个改这个改这个改这个改这个改这个改这个改这个改这个改这个改这个改这个改这个
% 改这个改这个改这个改这个改这个改这个改这个改这个
[raw2,col2]=find(trace==zxbc_dbm2);%获取峰值点的坐标
zxbc_2=trace(raw2,1);
zxbc_2=zxbc_2(1)%出错时选择执行，直接执行也可以，但会降低程序效率
plot(zxbc_2,zxbc_dbm2,'.','color','r','MarkerSize',20);%峰值红点
txt=[num2str(zxbc_2),' nm'];%图上标注
nameda = 'λ =            ';
text(zxbc_2-7,zxbc_dbm2+10,txt,'fontsize',20);
text(zxbc_2-10,zxbc_dbm2+10,nameda,'fontsize',20);%符号λ

