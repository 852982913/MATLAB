clear;close all;clc
%———将数据文件名添加到元胞数组，对文件夹内所有.csv文件进行数据处理——
path = 'C:\Users\wc852\Desktop\新建文件夹';           %添加数据文件夹绝对路径,工作区间要在同一个盘内
list = dir([path,'\*.csv']); %读取path路径下所有csv格式文件
fileNames={list.name};      %将数据文件名添加到元胞数组
disp(fileNames)             %显示变量 X 的值，而不打印变量名称
for i = 1:length(fileNames) %加载数据，放入矩阵数组
    disp(fileNames{i})
    exist(fileNames{i}', 'file')
    data_in =csvread(fileNames{i},46); %修改数值从不同行开始读取
end
scatter(data_in(:,1),data_in(:,2),'r');hold on;
scatter(data_in(:,1),data_in(:,3),'black');
scatter(data_in(:,1),data_in(:,4),'blue');hold off;

