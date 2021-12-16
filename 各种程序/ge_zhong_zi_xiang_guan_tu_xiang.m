ch=@(x)((exp(x)+exp(-x))/2);
sh=@(x)((exp(x)-exp(-x))/2);


x=-5*pi:0.01:5*pi;
y1=exp(-x.^2/2);
y2=3*(x.*ch(x)-sh(x))./(sh(x).*sh(x).*sh(x));
y3=1./((ch(8/15*x)).*(ch(8/15*x)).*(ch(8/15*x)));
y4=(3.*sh(4.*x)-8.*x)./(4*sh(4/3*x).^3);
figure(1)
plot(x,y1);
figure(2)
plot(x,y2);
figure(3)
plot(x,y3);
figure(4)
plot(x,y4);










