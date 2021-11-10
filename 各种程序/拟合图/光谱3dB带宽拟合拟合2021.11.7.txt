close all
clear all
clc
format long;
%———将数据文件名添加到元胞数组，对文件夹内所有.csv文件进行数据处理——
path = 'C:\Users\wc852\Desktop\新建文件夹';           %添加数据文件夹绝对路径,工作区间要在同一个盘内
list = dir([path,'\*.csv']); %读取path路径下所有csv格式文件
fileNames={list.name};      %将数据文件名添加到元胞数组
disp(fileNames)             %显示变量 X 的值，而不打印变量名称
for i = 1:length(fileNames) %加载数据，放入矩阵数组
    disp(fileNames{i})
    exist(fileNames{i}', 'file')
    trace =csvread(fileNames{i},46); %修改数值从不同行开始读取
% ----------------- 拟合画图 --------------------
    plot(trace(:,1),trace(:,2));hold on;
    plot(trace(:,1),max(trace(:,2))-3,'.','color','r','MarkerSize',5);%峰值红点
    col_daikuan=find(trace(:,2) > max(trace(:,2))-3);
    plot(trace(col_daikuan,1),trace(col_daikuan,2),'color','g');
    temh=trace(col_daikuan,1);
    temz=trace(col_daikuan,2);
    line([temh(1) temh(1)],[temz(end) temz(end)-10],'Color','red','LineStyle','--');
    line([temh(end) temh(end)],[temz(end) temz(end)-10],'Color','red','LineStyle','--');
    line([temh(1) temh(end)],[temz(end)-10 temz(end)-10],'Color','red','LineStyle','--');
    txt_3db=[num2str(temh(end) - temh(1)),' nm'];%图上标注
    temha=(temh(1) + temh(end))/2
    text(temha,temz(end)-12,txt_3db,'fontsize',10);
% --------------- 调整图更美观 ------------------
    xlabel('Wavelength (nm)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r')
    ylabel('Spectral intensity (dBm)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r')
    title([fileNames{i} '光谱拟合'],'fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r') 
% ------------------------存图------------------------
     mkdir csv_image;           %新建dat_image文件夹，如存在会警告，不影响程序
     filepath=pwd;              %保存当前工作目录
     cd('C:\Users\wc852\Desktop\新建文件夹\csv_image');    %把当前工作目录切换到指定文件夹
     f = getframe(gcf);
    imwrite(f.cdata,[fileNames{i} '光谱拟合.png']);%将fileNames{i} 变量写入文件名
     cd(filepath); %返回工作目录
     hold off;
end


