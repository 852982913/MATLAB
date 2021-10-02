clear
Data=xlsread('2.csv');
x=Data(:,1);
y=Data(:,2);

plot(x,y)
xlabel('Time');
ylabel('Amplitude');
legend('Amp')
[zmax,I]=max(y);              %获取最大值点
hold on ；               
plot(x(I),y(I),'.','MarkerSize',20)     % 绘制最大值点，样式为红色点，大小为10
str = ['(' num2str(x(I)) ',' num2str(y(I)) ')'];
str