shijian=csvread('C:\Users\�����ſ��о��ר��\Desktop\123.csv');
% ���ȶ�csv�е����ݽ��д�����Ӧ��ʱ�䰴�չ�ʽȡ��ֵ����84600ת��Ϊ���롯�ĸ�ʽ
% Ȼ�󽫵�Ԫ���ʽ����Ϊ��ֵ������С��������󾫶�(�����10�ĸ�14�η�)���ó���һ�����ݷ���shijian�����С�
% ����fengzhi�����еĲ�ͬ��������λ��ȷ����Ӧ��ϵ��ͼ���Դ����ơ���ͬ��
plot(shijian(2:end,1),fengzhi(2:end,1));% ʱ��-��ֵ1 
%�ӵڶ��е�ʱ�����ݿ�ʼִ�С����ڵ�һ�е������ǿ�ʼ�ɼ���ʱ��㣬��ʱ�������ʱ���Ϊ0����ͬ��
xlabel('ʱ������(s)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r'); 
ylabel('��ֵƵ��1(MHz)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r'); 
hold on % ������ͼʱִ�����д��룬��ͬ��
plot(shijian(:,1),fengzhi(:,2));% ʱ��-��ֵ2
xlabel('ʱ������(s)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r'); 
ylabel('��ֵƵ��2(MHz)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r'); 
legend('��ֵ1','��ֵ2')% ������ͼ��ʱ��ִ�д��д��룬��ͬ��
plot(shijian(:,1),fengzhi(:,3));% ʱ��-Ƶ�ʲ�ֵ
xlabel('ʱ������(s)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r'); 
ylabel('Ƶ�ʲ�ֵ(Hz)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r'); 


shijian=csvread('C:\Users\�����ſ��о��ר��\Desktop\1231.csv');
scatter(shijian(:,1),fengzhi(:,1));%ʱ��-��ֵ1
xlabel('ʱ���(s)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r'); 
ylabel('��ֵƵ��1(MHz)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r'); 
hold on;
scatter(shijian(:,1),fengzhi(:,2));%ʱ��-��ֵ2
xlabel('ʱ���(s)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r'); 
ylabel('��ֵƵ��2(MHz)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r'); 






