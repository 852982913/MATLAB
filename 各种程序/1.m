clear
Data=xlsread('2.csv');
x=Data(:,1);
y=Data(:,2);

plot(x,y)
xlabel('Time');
ylabel('Amplitude');
legend('Amp')
[zmax,I]=max(y);              %��ȡ���ֵ��
hold on ��               
plot(x(I),y(I),'.','MarkerSize',20)     % �������ֵ�㣬��ʽΪ��ɫ�㣬��СΪ10
str = ['(' num2str(x(I)) ',' num2str(y(I)) ')'];
str