 A=load('W0035.csv');
res=0.1 ;                               %�ֱ��� 0.1
B=10.^(A(:,2)./10);
s_y1=cumtrapz(A(:,1),B);
power_whole=s_y1(end)/res;              %���Էֱ���
power_whole=10^(12.14/10)*power_whole   %���ֺ�����ͻ�����һ�����Թ�ϵ
plot(A(:,1),A(:,2))