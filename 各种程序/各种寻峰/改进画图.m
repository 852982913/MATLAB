% --------------------�Ľ���ͼ-------------------------
shijian=csvread('C:\Users\�����ſ��о��ר��\Desktop\123.CSV');
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

Mean=mean(fengzhi(:,3));% ��ֵ
std_cha=std(fengzhi(:,3));% ��Ƶ��ı�׼��
txt1=[' Mean = ',num2str(Mean),' Hz'];%ͼ�ϱ�ע�����Ϣ
txt2=[' �� = ',num2str(std_cha),' Hz'];
text(2,41.5735,txt1,'fontsize',15,'fontweight','bold','fontname','΢���ź�','Color','k')
text(2,41.5734,txt2,'fontsize',15,'fontweight','bold','fontname','΢���ź�','Color','k')
set(ax(2),'Ylim',[1000,1100]) %���÷�Χ
set(ax(2),'yTick',[1000:50:1100])%���ÿ̶�

% xlim([0 12])%x�᷶Χ
% set(ax(2),'xlim',[0,12])%x�᷶Χ
% ylim([41.57289 41.57459])%y�᷶Χ
% set(gca,'YTick',[41.57289:0.1:41.57459]);%����Ҫ��ʾ����̶�
hold off;






