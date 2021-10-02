%%

a=[1,2,3;5,8,0;4,7,3]   %矩阵表示

%%

e=zeros(10,5,3)
e(:,:,1)=rand(10,5)     %rand 生成均匀分布的伪随机数。分布在（0~1）之间
e(:,:,2)=randi(5,10,5)  %randi 生成均匀分布的伪随机整数
e(:,:,3)=randn(10,5)    %randn 生成标准正态分布的伪随机数（均值为0，方差为1）

%%

%元胞数组
 a=cell(1,6)
 a{2}=eye(3)
 a{5}=magic(5)      %幻方
%magic字面意思是魔方，魔术的意思。在matlab中用来生成n阶幻方。
%比如三阶幻方就是1-9九个数字，组成一个3*3的矩阵，
%使得该矩阵无论横、竖还是斜三个方向上的三个数的和总是相同的。

%%

%结构体
books=struct('name',{{'Machine Learning','Data Mining'}},'price',[30 40])
books.name        %属性
books.name(1)
books.name{1}

%%

%矩阵的四则运算
a=[1,2,3,5,8,5,4,6]
b=1:2:9             %从1到9   2为步长
c=repmat(b,3,1)     %replicate matrix  复制和平铺矩阵 3行1列
d=ones(2,4)         %元素全为1的矩阵

%%

a=randi(3,3)
b=randi(3,3)
a.*b            %对应元素相乘（所有加  .  的都是对应项运算）
a/b             %a乘b的逆矩阵
a./b            %对应项相除

%%

%矩阵的下标
a=magic(5)
b=a(2,3)          %取第二行第三列的元素
c=a(3,:)          %取第三行
d=a(:,4)          %取第四列
[m,n]=find(a>20)  %找出a>20的元素，m表示行，n表示列

%%

% for循环结构

% for 循环变量=初值：步长：终值
%     执行语句 1
%     .
%     .
%     .
%     执行语句 n
% end
% 其中，步长的默认值为1，可以省略
% 初值、步长、终值可正可负可小数，符合数学逻辑即可

% 例：求1?+2?+3?+4?+5?

sum=0;       %后面的加分号时，运行结果在命令窗口不显示。
             %不加分号时，当点击回车时，运行结果就会立即显示出来。
for i=1:1:5
    sum=sum+i^2;
end

% 例：求1!+2!+3!+4!+5!
sum=0;
    for i=1:5;
        p=1;
        for j=1:i
            p=p*j;
        end 
        sum=sum+p;
    end
    
%九九乘法表
for i=1:9;
    for j=1:9;
        a(i,j)=i*j
    end
end

% 求 1+2+…+10
sum=0;i=0;
while i<=10;
    sum=sum+i;
    i=i+1;
end

%%
%二维平面绘图
x=0:0.01:2*pi;
y=sin(x);
figure              %建立一个幕布
plot(x,y)           %绘制当前二维平面的图
title('y=sin x')    %标题
xlabel ('x')        %x轴标题
ylabel ('y=sin x')  %y轴标题
xlim([0 2*pi])      %绘出的图像中显示出的x取值范围

x=0:0.01:20;
y1=200*exp(-0.05*x).*sin(x);
y2=0.8*exp(-0.5*x).*sin(10*x);
figure
[AX,H1,H2]=plotyy(x,y1,x,y2,'plot');            %plotyy作用为共用一个x坐标系
set(get(AX(1),'Ylabel'),'String','Slow Decay')
set(get(AX(2),'Ylabel'),'String','Fast Decay')
xlabel('Time(\musee)')  
title('Multiple Decat Rates')    
set(H1,'Linestyle','--')
set(H2,'Linestyle',':')

%%
%三维立体绘图
t=0:pi/50:10*pi;
plot3(sin(t),cos(t),tan(t))
xlabel('sin(t)')
ylabel('cos(t)')
zlabel('t')
grid on      %网格开启
axis square  %将当前坐标系图形设置为方形。横轴及纵轴比例是1：1
             %axis 的主要功能是对坐标轴进行一定的缩放操作。
             %axis( [xmin xmax ymin ymax] ) 
             %设置当前坐标轴 x轴 和 y轴的限制范围

%%
% 图形的保存与导出
% 编辑--复制图形--去word粘贴
% 可在文件--导出设置调整各个参数

%%
[x,y,z]=peaks(30)%peaks 双峰函数
mesh(x,y,z)
grid

ezsurf('u*sin(v)','u*cos(v)','4*v',[-2*pi,2*pi,-2*pi,2*pi]);

 subplot(1,2,1);
 [x,y]=meshgrid(0:0.25:4,-2:.25:2);
 z=sin(x).*cos(y);
 [nx,ny,nz]=surfnorm(x,y,z);%计算法线方向
 surf(x,y,z);
 hold on;
 quiver3(x,y,z,nx,ny,nz,0.5);
 axis(0 4 -2 2 -1 1);
 axis([0 4 -2 2 -1 1]);

 subplot(1,2,2);
 t=linspace(-2,2,20);
 [x,y,z]=meshgrid(t);
 [x,y,z]=meshgrid(t,t,t);
 v=x.*exp(-x.^2-y.^2-z.^2);
 xslice=2;
 yslice=2;
 xslice=[-1.2,.8,2];
 zslice=[-2,0];
 slice(x,y,z,v,xslice,yslice,zslice);

