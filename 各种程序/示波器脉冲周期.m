clear
Data=xlsread('123.csv');
x=Data(:,1);
y=Data(:,2);
plot(x,y)
xlabel(' Relative time  ');
ylabel(' Intensity (mV) ');
hold on
plot([-0.0002432,-0.0002345],[0.8099,0.8138])
text(-0.0002416,0.8450,' 0.869¦Ìs','fontsize',8)




