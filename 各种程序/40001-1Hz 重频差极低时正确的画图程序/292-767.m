clear
clear all
clc
%———将数据文件名添加到元胞数组，对文件夹内所有.csv文件进行数据处理——
path = 'C:\Users\酒仙桥科研巨擘专用\Desktop\40001-1Hz\292-767';           %添加数据文件夹绝对路径,工作区间要在同一个盘内
list = dir([path,'\*.csv']); %读取path路径下所有csv格式文件
fileNames={list.name};      %将数据文件名添加到元胞数组
disp(fileNames)             %显示变量 X 的值，而不打印变量名称
for i = 1:length(fileNames) %加载数据，放入矩阵数组
    disp(fileNames{i})
    exist(fileNames{i}', 'file')
    data_in =csvread(fileNames{i},2); %修改数值从不同行开始读取
 %———判断前k行属于无用数据———————————
%      reference = data_in(:, 1); %加载第2列数据，寻找标志位，记录标志位行数k
%      for k = 1:length(reference)
%          x(k) = reference(k);
%          if x(k) ~= 1510
%              break;
%          end
%      end
%      k = k-2;
%      disp(k);
 %————————数据处理——————————————————————
D = data_in(:, [1,2]); %将1，2列数据按顺序存入矩阵D
%  D(1:k,:) = []; %去除前k行无效数据
hmax = length(D);

W1 = D(:, 1); %波长
I1 = D(:, 2); %强度
%————————出图—————————————————
plot(W1,I1,'b','linewidth',1); 
hold on
a_tem=findpeaks(D(:,2));%伪峰值
a_tem=sort(a_tem,'descend');
b1=a_tem(1);%峰值1
switch i
    case 37
        b2=a_tem(9);
    case 50
        b2=a_tem(8);
    case 335        %轨迹捕获344，中间删除了10个数据  还有一个+1
        b2=a_tem(3);
    otherwise
        b2=a_tem(2);%峰值2
end
[raw1,col1]=find(D==b1);%获取峰值点的坐标
heng1=D(raw1,1);
heng1=heng1(1)%出错时选择执行，直接执行也可以，但会降低程序效率，下同
zong1=b1;

plot(heng1,zong1,'.','color','r','MarkerSize',20);%峰值红点
[raw2,col2]=find(D==b2);
heng2=D(raw2,1);
heng2=heng2(1)%出错时选择执行
zong2=b2;
plot(heng2,zong2,'.','color','r','MarkerSize',20);%峰值红点
v1=heng1/1000000;
v1=v1(1)%出错时选择执行
txt=[' f = ',num2str(v1),'MHz']%图上标注
text(heng1,zong1,txt)
v2=heng2/1000000;
v2=v2(1)%出错时选择执行
txt=[' f = ',num2str(v1),'MHz']%图上标注
text(heng2,zong2,txt)
% ----------------峰值点标记-----------------
if (zong1-zong2)>0        %第一个峰值高于第二个峰值
    line([heng1 heng1],[zong1 zong1-100-abs(zong1-zong2)],'Color','red','LineStyle','--');%过峰值点作垂线
    line([heng2 heng2],[zong2 zong2-100],'Color','red','LineStyle','--');%过峰值点作垂线
    line([heng1 heng2],[zong2-100 zong2-100],'Color','red','LineStyle','--')%作一条横虚线
    henga=(heng1+heng2)/2;
    str=abs(heng1-heng2);
    txt=[num2str(str),'Hz']%图上标注
    text(henga,zong1-100-abs(zong1-zong2)+5,txt)
else
    line([heng1 heng1],[zong1 zong1-100],'Color','red','LineStyle','--');
    line([heng2 heng2],[zong2 zong2-100-abs(zong1-zong2)],'Color','red','LineStyle','--');
    line([heng1 heng2],[zong1-100 zong1-100],'Color','red','LineStyle','--')
    henga=(heng1+heng2)/2;
    str=abs(heng1-heng2);
    txt=[num2str(str),' Hz']%图上标注
    text(henga,zong1-100-abs(zong1-zong2)+5,txt)
end
title([fileNames{i} '频谱'],'fontsize',18,'fontweight','bold','fontname','微软雅黑','Color','r');
xlabel('Frequency(Hz)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r'); 
ylabel('Intensity(dBm)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r');
hold off
fengzhi(i,1)=v1;
fengzhi(i,2)=v2;
fengzhi(i,3)=str;
 %————————存图————————————————
%  mkdir csv_image;           %新建dat_image文件夹，如存在会警告，不影响程序
%  filepath=pwd;              %保存当前工作目录
%  cd('C:\Users\酒仙桥科研巨擘专用\Desktop\292-767\csv_image');    %把当前工作目录切换到指定文件夹
%  f = getframe(gcf);
% imwrite(f.cdata,[fileNames{i} '频谱.png']);%将fileNames{i} 变量写入文件名
%  cd(filepath); %返回工作目录
end;%.csv文件处理for循环尾 
Mean=mean(fengzhi(:,3));% 均值
std_cha=std(fengzhi(:,3));% 标准差
% close; %关闭所有图表
