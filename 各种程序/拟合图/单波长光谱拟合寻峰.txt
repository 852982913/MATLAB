close all
clear all
clc
%———将数据文件名添加到元胞数组，对文件夹内所有.csv文件进行数据处理——
path = 'C:\Users\wc852\Desktop\新建文件夹';           %添加数据文件夹绝对路径,工作区间要在同一个盘内
list = dir([path,'\*.csv']); %读取path路径下所有csv格式文件
fileNames={list.name};      %将数据文件名添加到元胞数组
disp(fileNames)             %显示变量 X 的值，而不打印变量名称
for i = 1:length(fileNames) %加载数据，放入矩阵数组
    disp(fileNames{i})
    exist(fileNames{i}', 'file')
    trace =csvread(fileNames{i},46); %修改数值从不同行开始读取
    xin=trace(:,1);
    yin=10.^(trace(:,2)/10);
    figure(1)
    
% --------------- 寻峰（中心波长1） ----------------

    zxbc_dbm=findpeaks(trace(:,2));%伪峰值
    zxbc_dbm=sort(zxbc_dbm,'descend');%降序排列
    zxbc_dbm1=zxbc_dbm(1);%峰值，即中心波长,改这个改这个改这个改这个改这个改这个改这个
    % 改这个改这个改这个改这个改这个改这个改这个改这个改这个改这个改这个改这个改这个
    % 改这个改这个改这个改这个改这个改这个改这个改这个
    [raw1,col1]=find(trace==zxbc_dbm1);%获取峰值点的坐标
    zxbc_1=trace(raw1,1);
    zxbc_1=zxbc_1(1)%出错时选择执行，直接执行也可以，但会降低程序效率
    plot(zxbc_1,zxbc_dbm1,'.','color','r','MarkerSize',20);hold on;%峰值红点
    txt=[num2str(zxbc_1),' nm'];%图上标注
    nameda = 'λ =   ';
    text(zxbc_1+5,zxbc_dbm1,txt,'fontsize',20);
    text(zxbc_1,zxbc_dbm1,nameda,'fontsize',20);%符号λ
    
% -------------------拟合--------------------

    fx =inline('a(1)*(sech((xin-a(2))/a(3))).^2+a(4)*(sech((xin-a(5))/a(6))).^2','a','xin');%拟合
    a=nlinfit(xin,yin,fx,[1 zxbc_1 1 1 zxbc_1 1]);%a(2)a(5)是中心波长
    x=trace(:,1);
    y1=a(1)*(sech((xin-a(2))/a(3))).^2;
    y2=a(4)*(sech((xin-a(5))/a(6))).^2;
    FWHM=1.763*a([3 6])
% ----------------- 画图 --------------------

    plot(xin,10*log10(yin),'k-');% 原图
    plot(x,10*log10(y1)+3,'b--');% 第一个拟合
%     plot(x,10*log10(y2),'r--');% 第二个拟合
    % plot(x,10*log10(y1),'g-.');% 总拟合

% --------------- 调整图更美观 ------------------

%     xlim([1500,1600])
%     ylim([-220,0])
    xlabel('Wavelength (nm)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r')
    ylabel('Spectral intensity (dB)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r')
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


