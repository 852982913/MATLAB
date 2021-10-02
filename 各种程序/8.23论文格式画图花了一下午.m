% --------------------�Ľ���ͼ-------------------------
clc
% fengzhi(:,2)=fengzhi(:,2)*2; %ֻ��ִ��һ��
shijian=csvread('C:\Users\�����ſ��о��ר��\Desktop\123.csv');
scatter(shijian(:,1),fengzhi(:,1),900,[1 0.5 0],'filled');%��Ƶ1  
xlabel('Time (s)','fontname','Times New Roman','fontsize',30,'FontWeight','bold','Color','k'); 
hold on;
grid on;
[ax,h1,h2] = plotyy(shijian(:,1),fengzhi(:,2),shijian(:,1),fengzhi(:,3),'scatter');%���һ����������scatter��plot
set(get(ax(1),'ylabel'),'String','Repetition rate (MHz)','fontname','Times New Roman','fontsize',30,'FontWeight','bold','Color','k') 
set(get(ax(2),'ylabel'),'String','Repetition rate difference (Hz)','fontname','Times New Roman','fontsize',30,'FontWeight','bold','Color','k') 

txt1=[' Mean = 1191.33 Hz'];%ͼ�ϱ�ע�����Ϣ
txt2=[' �� = 0.74 Hz'];
text(80,41.5733,txt1,'fontsize',20,'fontweight','bold','fontname','Times New Roman','Color','k')
text(80,41.5734,txt2,'fontsize',20,'fontweight','bold','fontname','Times New Roman','Color','k')

h1.Marker='o';  %Բ��
h1.MarkerEdgeColor= 'none';%��Ե��ɫ
h1.MarkerFaceColor= [0 0 0.9]; % ��Ƶ2����ɫ,��ɫ
h1.SizeData=900 %��Ƶ2��Բ���С
h2.Marker='o';  %Բ��
h2.MarkerEdgeColor= 'none';%��Ե��ɫ
h2.MarkerFaceColor=[0.5 0.5 0.5]  % ��Ƶ�����ɫ,��ɫ
h2.SizeData=900  %��Ƶ2��Բ���С


set(ax(2),'Ylim',[1160,1220]) %�����Ҳ�y�᷶Χ
set(ax(2),'yTick',[1160:15:1220])%�����Ҳ�y��̶�
xlim([0 220])
set(ax(2),'xlim',[0,220])
ylim([41.5725 41.5745])%���y�᷶Χ
set(gca,'YTick',[41.5725:0.0005:41.5745]);%���y�� ����Ҫ��ʾ����̶�
set(gca,'linewidth',2)%������Ӵ�
set(gca,'fontsize',19,'fontweight','bold','fontname','Times New Roman')
set(ax(2),'fontsize',19,'fontweight','bold','fontname','Times New Roman')
set(gca,'Tickdir','out');%����̶��ⷭ
set(ax(2),'Tickdir','out');
% set(gca,'xtick')
% set(ax(2),'fontname','bold')


hold off;






