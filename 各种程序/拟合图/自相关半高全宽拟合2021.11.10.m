%拟合1个sech2脉冲
clear all;clc;close all
format long

path='C:\Users\wc852\Desktop\新建文件夹';
list = dir([path,'\*.csv']); %读取path路径下所有csv格式文件
fileNames={list.name};      %将数据文件名添加到元胞数组
disp(fileNames)             %显示变量 X 的值，而不打印变量名称
for j = 1:length(fileNames) %加载数据，放入矩阵数组
    disp(fileNames{j})
    exist(fileNames{j}', 'file')
    trace =csvread(fileNames{j},20); %修改数值从不同行开始读取
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
%     FWHM=1.763*a(2)%脉冲的3dB宽度
% ----------------------图上细节-----------------
    xlabel('Time Delay(fs)','fontname','Times New Roman','Fontsize',15,'fontweight','bold','color','r')
    ylabel('Intensity (arb.units)','fontname','Times New Roman','fontsize',15,'FontWeight','bold','color','r');
    set(gca,'linewidth',2)%坐标轴加粗
    set(gca,'fontsize',13,'fontweight','bold','fontname','Times New Roman')
    title([fileNames{j} '自相关'],'fontname','Times New Roman','fontsize',15,'FontWeight','bold','color','r')
    % str=abs(FWHM)
%     ylim([-0.1 1.1])
    col_daikuan=find(i > (max(i)/2));
    plot(t,max(i)/2,'.','color','r');
%     plot(t(col_daikuan),i(col_daikuan),'color','g')
    temh=t(col_daikuan);
    temz=i(col_daikuan);
    FWHM=temh(end)-temh(1);
    txt=[num2str(abs(FWHM))]%图上标注
    texth=(trace(1,1)+trace(1,end))/2;
%     textz=(trace(2,1)+trace(2,end))/2;
    text(texth-500,0.6,txt,'fontsize',15) 
    text(texth-7/10*(trace(1,end)-trace(1,1)),0.6,'FWHM =','fontsize',15)
%     line([temh(1) temh(1)],[temz(end) temz(end)-0.5],'Color','r','LineStyle','--');
%     line([temh(end) temh(end)],[temz(end) temz(end)-0.5],'Color','g','LineStyle','--');
%     line([temh(1) temh(end)],[temz(end)-0.5 temz(end)-0.5],'Color','k','LineStyle','--');
    legend('Exp.data','Sech.fitting');
    % ------------------------存图---------------------------
    mkdir csv_image;           %新建dat_image文件夹，如存在会警告，不影响程序
    filepath=pwd;              %保存当前工作目录
    cd('C:\Users\wc852\Desktop\新建文件夹\csv_image');    %把当前工作目录切换到指定文件夹
    f = getframe(gcf);
    imwrite(f.cdata,[fileNames{j} '自相关.png']);%将fileNames{i} 变量写入文件名
    cd(filepath); %返回工作目录
    hold off;
end
