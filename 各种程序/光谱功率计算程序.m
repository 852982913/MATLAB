
A=load('W0045.csv');
res=0.5;
B=10.^(A(:,2)./10);
s_y1=cumtrapz(A(:,1),B);
power_whole=s_y1(end)/res;
power_whole=10^(12.14/10)*power_whole

