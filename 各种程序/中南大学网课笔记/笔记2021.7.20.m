%%

%图形窗口的分割
% 子图：同一图形窗口中的不同坐标系下的图形
subplot(m,n,p) % 其中，m和n指定将图形窗口分成m×n个绘图区，p指定当前活动区

subplot(2,2,1);
x=linspace(0,2*pi,60);
y=sin(x);
plot(x,y);
title('sin(x)');
axis([0,2*pi,-1,1]);

x=linspace(0,2*pi,60);
subplot(2,2,1)
plot(x,sin(x)-1);
title('sin(x)-1');axis([0,2*pi,-2,0])
subplot(2,1,2)
plot(x,cos(x)+1);
title('cos(x)+1');axis([0,2*pi,0,2])
subplot(4,4,3)
plot(x,tan(x));
title('tan(x)');axis([0,2*pi,-40,40])
subplot(4,4,8)
plot(x,cot(x));
title('cot(x)');axis([0,2*pi,-35,35])

%%
% 对数坐标图(之前模电中有用过波特图)
semilogx(x1,y1,选项1,x2,y2,选项2,…) % x坐标为对数
semilogy(x1,y1,选项1,x2,y2,选项2,…) % y坐标为对数
loglog(x1,y1,选项1,x2,y2,选项2,…)   % 全部为对数

x=0:0.01:10;
y=1./x;
subplot(2,2,1);
plot(x,y);
title('plot(x,y)');
subplot(2,2,2);
semilogx(x,y);
title('semilogx(x,y)');grid on
subplot(2,2,3);
semilogy(x,y);
title('semilogy(x,y)');grid on
subplot(2,2,4);
loglog(x,y);
title('loglog(x,y)');grid on

% 极坐标图
polar(theta,rho,选项) % 其中，theta(θ)为极角，rho(ρ)为机径

t=0:pi/100:2*pi;
r=1-sin(t);
subplot(1,2,1)
polar(t,r)
subplot(1,2,2)
t1=t-pi/2;
r1=1-sin(t1);
polar(t,r1)

%%
% 条形图
bar(y,style) % 绘制垂直条形图
barh(y,style)% 绘制水平条形图
             % style包含“grouped”(簇状分组)“stacked”(堆积分组)

y=[1,2,3,4,5;1,2,1,2,1;5,4,3,2,1];
subplot(1,2,1)
bar(y)
title('Group')
subplot(1,2,2)
bar(y,'stacked')
title('Stack')

bar(x,y,style) % 其中x存储横坐标，y存储数据

x=[2015,2016,2017];
y=[68,80,115,98,102;75,88,102,99,110;81,86,125,105,115];
bar(x,y)
title('Group')

%直方图
hist(y)
hist(y,x)

y=randn(500,1);
subplot(2,1,1);
hist(y);
title('高斯分布直方图')
subplot(2,1,2);
x=-3:0.2:3;
hist(y,x);
title('指定区间中心点的直方图')

rose(theta,x)
% 其中，参数theta用于确定每一区间与远点的角度，选项x用于指定区间的划分方式

%极坐标直方图
y=randn(500,1);
theta=y*pi;
rose(theta)
title('在极坐标下的直方图')

%面积类图形
pie(x,explode) % 参数x存储待统计数据，选项explode控制图块的显示模式

score=[5,17,23,9,4];
ex=[0,0,0,0,1];
pie(score,ex)
legend('优秀','良好','中等','及格','不及格','location','eastoutside')

%散点图
scatter(x,y,选项,'filled') % 参数x,y用于定位数据点，选项用于指定先型、颜色、数据点标记

t=0:pi/50:2*pi;
x=16*sin(t).^3;
y=13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t);
scatter(x,y,'rp','filled')

%矢量类图形
compass % 罗盘图
feather % 羽毛图
quiver  % 箭头图
quiver(x,y,u,v) % (x,y)指定矢量起点，(u,v)指定矢量终点

a=[4,5];b=[-10,0];c=a+b;
hold on;
quiver(0,0,a(1),a(2));
quiver(0,0,b(1),b(2));
quiver(0,0,c(1),c(2));
text(a(1),a(2),'a');
text(b(1),b(2),'b');
text(c(1),c(2),'c');
axis([-12,6,-1,6])
grid on

%% 三维图形
plot3(x,y,z) 

%
x=[0.2,1.8,2.5];
y=[1.3,2.8,1.1];
z=[0.4,1.2,1.6];
plot3(x,y,z)
grid on
axis([0,3,1,3,0,2]);

%
t=linspace(0,10*pi,200);
x=sin(t)+t.*cos(t);
y=cos(t)-t.*sin(t);
z=t;
subplot(1,2,1)
plot3(x,y,z)
grid on
subplot(1,2,2)
plot3(x(1:4:200),y(1:4:200),z(1:4:200))
grid on

% 参数x,y,z是同型矩阵
% 参数x,y,z有向量也有矩阵

t=0:0.01:2*pi;
t=t';
x=[t,t,t,t,t];
y=[sin(t),sin(t)+1,sin(t)+2,sin(t)+3,sin(t)+4];
z=[t,t,t,t,t];
plot3(x,y,z)
grid


plot(x1,y1,z1,x2,y2,z2,…,xn,yn,zn) % 含有多个参数的plot3函数

t1=0:0.01:1.5*pi;
t2=0:0.01:2*pi;
t3=0:0.01:3*pi;
plot3(t1,sin(t1),t1,t2,sin(t2)+1,t2,t3,sin(t3)+2,t3)
grid

曲线
t=0:pi/50:6*pi;
x=cos(t);
y=sin(t);
z=2*t;
plot3(x,y,z,'p')
xlabel('X')
ylabel('Y')
zlabel('Z')
grid on

fplot3(funx,funy,funz,tlims)% 参数方程形式  funx，funy，funz代表定义曲线x、y、z的函数，通常采用函数句柄的方式
                            % tlims为参数函数的自变量的取值范围，用[tmin,tmax]描述

% 墨西哥帽顶曲线
xt=@(t)exp(-t/10).*sin(5*t);
yt=@(t)exp(-t/10).*cos(5*t);
zt=@(t)t;
fplot3(xt,yt,zt,[-12,12])



