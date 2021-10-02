clear
Data=xlsread('3.csv');
x=Data(:,1);
y=Data(:,2);
plot(x,y)
xlabel(' Wavelength (nm) ');
ylabel(' Intensity (dBm) ');
[y1max,I]=max(y(1:400)); 
hold on
plot(x(I),y(I),'.','MarkerSize',15)
text(1532,-26.85,' ¦Ë = 1532 nm ','fontsize',11)
[y2max,I]=max(y(1:800)); 
hold on
plot(x(I),y(I),'.','MarkerSize',15)
text(1557,-13.05,'¦Ë = 1557 nm ','fontsize',11)



