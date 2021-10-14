% --------------------改进画图-------------------------
clc
% fengzhi(:,2)=fengzhi(:,2)*2; %只需执行一次
shijian=csvread('C:\Users\酒仙桥科研巨擘专用\Desktop\123.csv');
scatter(shijian(:,1),fengzhi(:,1),900,[1 0.5 0],'filled');%重频1  
xlabel('Time (s)','fontname','Times New Roman','fontsize',30,'FontWeight','bold','Color','k'); 
hold on;
grid on;
[ax,h1,h2] = plotyy(shijian(:,1),fengzhi(:,2),shijian(:,1),fengzhi(:,3),'scatter');%最后一个参数设置scatter或plot
set(get(ax(1),'ylabel'),'String','Repetition rate (MHz)','fontname','Times New Roman','fontsize',30,'FontWeight','bold','Color','k') 
set(get(ax(2),'ylabel'),'String','Repetition rate difference (Hz)','fontname','Times New Roman','fontsize',30,'FontWeight','bold','Color','k') 

txt1=[' Mean = 1191.33 Hz'];%图上标注相关信息
txt2=[' σ = 0.74 Hz'];
text(80,41.5733,txt1,'fontsize',20,'fontweight','bold','fontname','Times New Roman','Color','k')
text(80,41.5734,txt2,'fontsize',20,'fontweight','bold','fontname','Times New Roman','Color','k')

h1.Marker='o';  %圆点
h1.MarkerEdgeColor= 'none';%边缘颜色
h1.MarkerFaceColor= [0 0 0.9]; % 重频2的颜色,橙色
h1.SizeData=900 %重频2的圆点大小
h2.Marker='o';  %圆点
h2.MarkerEdgeColor= 'none';%边缘颜色
h2.MarkerFaceColor=[0.5 0.5 0.5]  % 重频差的颜色,灰色
h2.SizeData=900  %重频2的圆点大小


set(ax(2),'Ylim',[1160,1220]) %设置右侧y轴范围
set(ax(2),'yTick',[1160:15:1220])%设置右侧y轴刻度
xlim([0 220])
set(ax(2),'xlim',[0,220])
ylim([41.5725 41.5745])%左侧y轴范围
set(gca,'YTick',[41.5725:0.0005:41.5745]);%左侧y轴 设置要显示坐标刻度
set(gca,'linewidth',2)%坐标轴加粗
set(gca,'fontsize',19,'fontweight','bold','fontname','Times New Roman')
set(ax(2),'fontsize',19,'fontweight','bold','fontname','Times New Roman')
set(gca,'Tickdir','out');%坐标刻度外翻
set(ax(2),'Tickdir','out');
% set(gca,'xtick')
% set(ax(2),'fontname','bold')


hold off;






