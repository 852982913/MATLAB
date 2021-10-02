%%
% 函数的递归调用

% function f=fact(n)
% ...
% fact (n-1)
% ...

%直接递归  f函数调用f函数
%嵌套调用  f1调用f2函数，f2函数调用f1函数

%利用函数的递归调用，求n!

% 函数fact.m如下
function f=fact(n)
if n<=1
    f=1;
else
    f=fact (n-1)*n;
end
%在脚本文件a.m中调用函数文件fact.m,求n!
n=input('Please input n=');
s=fact(n);
disp(s)

%斐波那契数列验证
% 首先建立函数文件ffib.m
function f=ffib(n)
if n>2
    f=ffib(n-1)+ffib(n-2);
else
    f=1;
end

% 建立脚本文件test.m
F=[];
for k=1:20
    F=[F,ffib(k)*ffib(k)];
end
sum(F)
ffib(20)*ffib(21)

%函数参数与变量的作用域

% nargin  输入实参的个数
% nargout 输出实参的个数

% 建立函数文件test.m
function fout=test(a,b,c)
if nargin==1
    fout=a;
elseif nargin==2
    fout=a+b;
elseif nargin==3
    fout=(a*b*c)/2;
end

% >> fout=test(2)
% four =
%       2
% >> fout=test(2,3,2)
% fout =
%       6

%%
% 局部变量：程序中只在特定过程或函数中可以访问的变量
% 全局变量：作用域是整个matlab工作空间，也就是全程有效。
%           所有的函数都可以对它进行存取和修改

% 全局变量定义格式
% global 变量名
% 建立函数文件wad.m
function f=wad(x,y)
global ALPHA BETA
f=ALPHA*x+BETA*y;

>> gloabal ALPHA BETA
>> ALPHA=1;
>> BETA=2;
>> s=wad(1,2)
s=
    5

%%
% 图形绘制

% 绘制一条折线
plot(x,y) %x,y分别用于储存x坐标和y坐标数据
x=[2.5,3.5,4,5];
y=[1.5,2.0,1,1.5];
plot(x,y)

%最简单的plot函数调用格式
x=[2.5,3.5,4,5];
plot(x)%横坐标依次为1，2，3，4…
       %纵坐标依次为x的元素值
       
x=[2.5,3.5,4,5];
y=[1.5,2,1,1.5];
cx=x+y*i;
plot(cx)%当x是复向量时，则分别以该向量元素实部和虚部为横、纵坐标绘制出一条曲线

% 当x是向量，y是矩阵时

% 若y的列数等于x的长度，则以向量x为横坐标，以y的每个行向量为纵坐标绘制曲线
% 曲线的条数等于y的行数

% 若y的行数等于x的长度，则以向量x为横坐标，以y的每个列向量为纵坐标绘制曲线
% 曲线的条数等于y的列数

x=linspace(0,2*pi,1000); % linspace(x,y,N)产生x,y之间的N点向量
y=[sin(x);sin(2*x);sin(0.5*x)];
plot(x,y)

% x、y是同型矩阵时，以x、y对应列元素为横纵坐标分别绘制曲线，曲线条数等于矩阵的列数

t=0:0.01:2*pi;
t1=t';
x=[t1,t1,t1];
y=[sin(t1),sin(2*t1),sin(0.5*t1)];
plot(x,y)

% 多个参数的plot
plot(x1,y1,x2,y2,…,xn,yn)

t1=linspace(0,2*pi,10);
t2=linspace(0,2*pi,20);
t3=linspace(0,2*pi,100);
plot(t1,sin(t1),t2,sin(t2)+1,t3,sin(t3)+2)

% 含选项的plot函数
plot(x,y,选项)

x=(0:pi/50:2*pi)';
y1=2*exp(-0.5*x)*[1,-1];
y2=2*exp(-0.5*x).*sin(2*pi*x);
x1=0:0.5:6;
y3=2*exp(-0.5*x1).*sin(2*pi*x1);
plot(x,y1,'k:',x,y2,'b--',x1,y3,'rp')

fplot(f,lims,选项) % 有些函数在某些区间变化较大，fplot可设置合理的采样间隔
                   % f为函数，lims为函数的取值范围，用[xmin, xmax]描述。默认值为[-5,5]
fplot(@(x)sin(1./x),[0,0.2],'r') % @为定义距离的运算符
fplot(funx,funy,tlims,选项) % 参数方程形式  funx，funy代表函数，通常采用函数句柄的方式
                            % tlims为参数函数的自变量的取值范围，用[tmin,tmax]描述

fplot(@(t)t.*sin(t),@(t)t.*cos(t),[0,10*pi],'r')

%%
%绘制图形辅助操作
title(图形标题)
xlabel(x轴说明)
ylabel(y轴说明)
text(x,y,图形说明)
legend(图例1，图例2)

title({'MATLAB','y=sin(x)'}) % 两句话换行显示
title({'y=sin{\omega}x'})    %希腊字母ω
title({'X_{1}{\geq}X_{2}'})  %自己运行看吧(还有leqtext)
title('{\bf123}')% \bf 加粗
                 % \it 斜体
                 % \rm 正体

title('123','color','r')  % 设置颜色
title('123','fontsize',25)% 设置字号

text(x,y,说明)
gtext(说明)

text(-2*pi,0,'-2{\pi}')
text(3,0.28,'\leftarrow sin(x)')

legend(图例1，图例2，…)

x=linspace(0,2*pi,100);
plot(x,[sin(x);sin(2*x);sin(3*x)])
legend('sin(x)','sin(2x)','sin(3x)')

axis([xmin,xmax,ymin,ymax,zmin,zmax]) %坐标轴范围
axis equal  % 纵横坐标轴采用等长刻度
axis square % 产生正方形坐标系(默认为矩形)
axis auto   % 使用坐标轴的默认设置
axis off    % 取消坐标轴
axis on     % 显示坐标轴

x=[0,1,1,0,0];
y=[0,0,1,1,0];
plot(x,y)
axis([-0.1,1.1,-0.1,1.1])
axis equal

% 网格命令
grid on
grid off
grid 

%坐标系加边框
box on
box off
box

x=linspace(0,2*pi,100);
y=[sin(x);sin(2*x);sin(0.5*x)];
plot(x,y)
axis([0,7,-1.2,1.2])
title('不同频率正弦函数曲线','fontsize',3)
xlabel('Variable X');
ylabel('Variable Y');
text(2.5,sin(2.5),'sin(x)');
text(1.5,sin(2*1.5),'sin(2x)');
text(5.5,sin(0.5*5.5),'sin(0.5x)');
legend('sin(x)','sin(2x)','sin(0.5x)');
grid on

%图形保持
hold on
hold off
hold

t=linspace(0,2*pi,100)
x=sin(t);
y=cos(t);
plot(x,y,'b')
hold on
plot(2*x,2*y,'r--')
grid on
axis([-2.2,2.2,-2.2,2.2])
axis equal