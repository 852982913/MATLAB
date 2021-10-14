close all
clear all
clc
%———将数据文件名添加到元胞数组，对文件夹内所有.csv文件进行数据处理——
path = 'C:\Users\酒仙桥科研巨擘专用\Desktop\示波器';           %添加数据文件夹绝对路径,工作区间要在同一个盘内
list = dir([path,'\*.csv']); %读取path路径下所有csv格式文件
fileNames={list.name};      %将数据文件名添加到元胞数组
disp(fileNames)             %显示变量 X 的值，而不打印变量名称
for i = 1:length(fileNames) %加载数据，放入矩阵数组
    disp(fileNames{i})
    exist(fileNames{i}', 'file')
    data_in =csvread(fileNames{i},46); %修改数值从不同行开始读取
% %———判断前k行属于无用数据———————————
%     reference = data_in(:, 1); %加载第2列数据，寻找标志位，记录标志位行数k
%     for k = 1:length(reference)
%         x(k) = reference(k);
%         if x(k) ~= 1510
%             break;
%         end
%     end
%     k = k-2;
%     disp(k);
 %————————数据处理——————————————————————
D = data_in(:, [1,2]); %将1，2列数据按顺序存入矩阵D
% D(1:k,:) = []; %去除前k行无效数据
hmax = length(D);

W1 = D(:, 1); %波长
I1 = D(:, 2); %强度
%————————出图—————————————————
plot(W1,I1,'b','linewidth',1); 
title([fileNames{i} '频谱'],'fontsize',18,'fontweight','bold','fontname','微软雅黑','Color','r');
xlabel('Frequency (nm)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r'); 
ylabel('Intensity (dBm)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r');
 %————————存图————————————————
 mkdir csv_image;           %新建dat_image文件夹，如存在会警告，不影响程序
 filepath=pwd;              %保存当前工作目录
 cd('C:\Users\酒仙桥科研巨擘专用\Desktop\示波器\csv_image');    %把当前工作目录切换到指定文件夹
 f = getframe(gcf);
imwrite(f.cdata,[fileNames{i} '频谱.png']);%将fileNames{i} 变量写入文件名
 cd(filepath); %返回工作目录

end;%.csv文件处理for循环尾
% close; %关闭所有图表

