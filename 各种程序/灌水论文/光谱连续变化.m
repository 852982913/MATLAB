clear; clc; format long
path='C:\Users\青春猪头少年不会梦到兔女郎学姐\Desktop\光谱';
list = dir([path,'\*.csv']); %读取path路径下所有csv格式文件
fileNames={list.name};      %将数据文件名添加到元胞数组
disp(fileNames)        
for i=1:length(fileNames)
    disp(fileNames{i})
    exist(fileNames{i}', 'file')
    data_in =csvread(fileNames{i},46); %修改数值从不同行开始读取
    x=data_in(:,1);
    y=data_in(:,2);
    plot(x,y);
    hold on;
end
legend('Δλ = 2.66 nm','Δλ = 3.28 nm','Δλ = 4.22 nm','Δλ = 5.56 nm','Δλ = 6.50 nm','Δλ = 2.66 nm','Δλ = 7.28 nm','Δλ = 8.44 nm','fontsize',15)
xlabel('Wavelength (nm)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r')
ylabel('Spectral intensity (dBm)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r')
title('1560 nm谱宽连续变化','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r') 
xlim([1540 1580]);
ylim([-90 -20]);
colorbar   eastoutside
