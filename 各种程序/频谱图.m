clear all
clc
Data=xlsread('2.csv');
x=Data(:,1);
y=Data(:,2);

plot(x,y)
xlabel(' Frequency ');
ylabel(' Intensity (dBm) ');
[ymax,I]=max(y); %��ȡ���ֵ��
hold on
plot(x(I),y(I),'.','MarkerSize',15)% �������ֵ�㣬��ʽΪ��ɫ�㣬��СΪ15

text('String',['   f = ',num2str(x(I)),' Hz'],'position',[x(I),y(I)],'fontsize',15)

findpeaks