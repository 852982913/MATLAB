close all; clear; clc
%———将数据文件名添加到元胞数组，对文件夹内所有.csv文件进行数据处理——
path = 'C:\Users\wc852\Desktop\2.17';           %添加数据文件夹绝对路径,工作区间要在同一个盘内
list = dir([path,'\*.csv']); %读取path路径下所有csv格式文件
fileNames={list.name};      %将数据文件名添加到元胞数组
disp(fileNames)    
for i = 1:length(fileNames) %加载数据，放入矩阵数组
    disp(fileNames{i})
    exist(fileNames{i}', 'file')
    data_in =csvread(fileNames{i},46); 
    D = data_in(:, [1,2]);
    hmax = length(D);
    W1 = D(:, 1); 
    I1 = D(:, 2); 
    plot(W1,I1,'k','linewidth',1); hold on;
    col_daikuan=find(data_in(:,2) > max(data_in(:,2))-3);
%     plot(data_in(col_daikuan,1),data_in(col_daikuan,2),'color','r','linewidth',1);
    temh=data_in(col_daikuan,1);
    temz=data_in(col_daikuan,2);
    line([temh(1) temh(1)],[temz(end) temz(end)-10],'Color','k','LineStyle','--','linewidth',1);%三条线
    line([temh(end) temh(end)],[temz(end) temz(end)-10],'Color','k','LineStyle','--','linewidth',1);
%     line([temh(1) temh(end)],[temz(end)-10 temz(end)-10],'Color','k','LineStyle','--','linewidth',1);
    x = [0.505 0.635];%双箭头 三行
    y = [0.642 0.641];
    annotation('doublearrow',x,y,'LineWidth',1)
    txt_3db=[num2str(temh(end) - temh(1)),' nm'];%图上标注
    temha=(temh(1) + temh(end))/2
    text(temha,temz(end)-12,txt_3db,'fontsize',16,'fontweight','bold','fontname','Times New Roman');%图上标注
%     text(temha-5,temz(end)-12,'Δλ = ','fontsize',16,'fontweight','bold','fontname','Times New Roman')%图上标注
%     title([fileNames{i} ],'fontsize',18,'fontweight','bold','fontname','Times New Roman','Color','k');
    zxbc_dbm=findpeaks(data_in(:,2));%伪峰值
    zxbc_dbm=sort(zxbc_dbm,'descend');%降序排列
    zxbc_dbm1=zxbc_dbm(1);
    [raw1,col1]=find(data_in==zxbc_dbm1);%获取峰值点的坐标
    zxbc_1=data_in(raw1,1);
    zxbc_1=zxbc_1(1)%出错时选择执行，直接执行也可以，但会降低程序效率
    txt=[num2str(zxbc_1),' nm'];%图上标注
    nameda = 'λ   ';
    text(zxbc_1,zxbc_dbm1+3,nameda,'fontsize',20,'fontweight','bold','fontname','Times New Roman');%符号λ
    xlim([1530 1580])
    ylim([-90 -30])%左侧y轴范围
    set(gca,'linewidth',1)%坐标轴加粗
    set(gca,'fontsize',14,'fontweight','bold','fontname','Times New Roman')
%     set(gca,'Tickdir','out');%坐标刻度外翻
    xlabel('Wavelength (nm)','fontname','Times New Roman','fontsize',22,'FontWeight','bold','Color','k'); 
    ylabel('Intensity (dBm)','fontname','Times New Roman','fontsize',22,'FontWeight','bold','Color','k');
end