close all
clear all
clc

shijianxian=csvread('C:\Users\�����ſ��о��ר��\Desktop\ʱ���߻�ͼ��.csv');
chongpincha=csvread('C:\Users\�����ſ��о��ר��\Desktop\��Ƶ�ͼ��.csv');
scatter(shijianxian(:,1),chongpincha(:,1),50,[0 0 0.9],'filled')
a=std(chongpincha(:,1));% ��׼��
Mean=mean(chongpincha(:,1));
xlabel('Time(min)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','k'); 
ylabel('Frequency(Hz)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','k'); 
txt1=[' Mean = ',num2str(Mean),' Hz'];%ͼ�ϱ�ע�����Ϣ
txt2=[' �� = ',num2str(a),' Hz'];
text(5,45,txt1,'fontsize',15,'fontweight','bold','fontname','΢���ź�','Color','k')
text(5,50,txt2,'fontsize',15,'fontweight','bold','fontname','΢���ź�','Color','k')
