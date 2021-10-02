% --------------------�Ľ���ͼ-------------------------
clc
% fengzhi(:,2)=fengzhi(:,2)*2; %ֻ��ִ��һ��
shijian=csvread('C:\Users\�����ſ��о��ר��\Desktop\123.csv');
scatter(shijian(:,1),fengzhi(:,1),50,[0 0 0.9],'filled');%��Ƶ1  
xlabel('Time(min)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','k'); 
% ylabel('Ƶ�ʷ�ֵ(MHz)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r'); 
hold on;

[ax,h1,h2] = plotyy(shijian(:,1),fengzhi(:,2),shijian(:,1),fengzhi(:,3),'scatter');%���һ����������scatter��plot
set(get(ax(1),'ylabel'),'String','Repetition rate(MHz)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','k') 
set(get(ax(2),'ylabel'),'String','Repetition rate difference(Hz)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','k') 


h1.Marker='o';  %Բ��
h1.MarkerEdgeColor= 'none';%��Ե��ɫ
h1.MarkerFaceColor= [1 0.5 0]; % ��Ƶ2����ɫ,��ɫ
h1.SizeData=50 %��Ƶ2��Բ���С
h2.Marker='o';  %Բ��
h2.MarkerEdgeColor= 'none';%��Ե��ɫ
h2.MarkerFaceColor=[0.5 0.5 0.5]  % ��Ƶ�����ɫ,��ɫ
h2.SizeData=50  %��Ƶ2��Բ���С


txt1=[' Mean = ',num2str(Mean),' Hz'];%ͼ�ϱ�ע�����Ϣ
txt2=[' �� = ',num2str(std_cha),' Hz'];
text(3,41.5727,txt1,'fontsize',15,'fontweight','bold','fontname','΢���ź�','Color','k')
text(3,41.5726,txt2,'fontsize',15,'fontweight','bold','fontname','΢���ź�','Color','k')
set(ax(2),'Ylim',[1054,1074]) %�����Ҳ�y�᷶Χ
set(ax(2),'yTick',[1054:10:1074])%�����Ҳ�y��̶�

% xlim([0 10])%x�᷶Χ
% set(ax(2),'xlim',[0,10])%x�᷶Χ
% set(gca,'YTick',[38:1:40]);%����Ҫ��ʾ����̶�
% ylim([39.22 39.3])%y�᷶Χ
set(gca,'YTick',[41.5725,41.5735]);%����Ҫ��ʾ����̶�
set(gca,'YTick',[41.5725:0.001:41.5735]);
hold off;






