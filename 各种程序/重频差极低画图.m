% --------------------改进画图-------------------------
clc
% fengzhi(:,2)=fengzhi(:,2)*2; %只需执行一次
shijian=csvread('C:\Users\酒仙桥科研巨擘专用\Desktop\123.csv');
scatter(shijian(:,1),fengzhi(:,1),50,[0 0 0.9],'filled');%重频1  
xlabel('Time(min)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','k'); 
% ylabel('频率峰值(MHz)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r'); 
hold on;

[ax,h1,h2] = plotyy(shijian(:,1),fengzhi(:,2),shijian(:,1),fengzhi(:,3),'scatter');%最后一个参数设置scatter或plot
set(get(ax(1),'ylabel'),'String','Repetition rate(MHz)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','k') 
set(get(ax(2),'ylabel'),'String','Repetition rate difference(Hz)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','k') 


h1.Marker='o';  %圆点
h1.MarkerEdgeColor= 'none';%边缘颜色
h1.MarkerFaceColor= [1 0.5 0]; % 重频2的颜色,蓝色
h1.SizeData=50 %重频2的圆点大小
h2.Marker='o';  %圆点
h2.MarkerEdgeColor= 'none';%边缘颜色
h2.MarkerFaceColor=[0.5 0.5 0.5]  % 重频差的颜色,灰色
h2.SizeData=50  %重频2的圆点大小


txt1=[' Mean = ',num2str(Mean),' Hz'];%图上标注相关信息
txt2=[' σ = ',num2str(std_cha),' Hz'];
text(3,41.5727,txt1,'fontsize',15,'fontweight','bold','fontname','微软雅黑','Color','k')
text(3,41.5726,txt2,'fontsize',15,'fontweight','bold','fontname','微软雅黑','Color','k')
set(ax(2),'Ylim',[1054,1074]) %设置右侧y轴范围
set(ax(2),'yTick',[1054:10:1074])%设置右侧y轴刻度

% xlim([0 10])%x轴范围
% set(ax(2),'xlim',[0,10])%x轴范围
% set(gca,'YTick',[38:1:40]);%设置要显示坐标刻度
% ylim([39.22 39.3])%y轴范围
set(gca,'YTick',[41.5725,41.5735]);%设置要显示坐标刻度
set(gca,'YTick',[41.5725:0.001:41.5735]);
hold off;






