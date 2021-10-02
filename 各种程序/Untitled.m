 A=load('W0035.csv');
res=0.1 ;                               %分辨率 0.1
B=10.^(A(:,2)./10);
s_y1=cumtrapz(A(:,1),B);
power_whole=s_y1(end)/res;              %除以分辨率
power_whole=10^(12.14/10)*power_whole   %积分后，面积和积分是一个线性关系
plot(A(:,1),A(:,2))