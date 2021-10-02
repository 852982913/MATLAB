%% 三维曲面
%平面网格数据的生成
x=2:6;
y=(3:8)';
X=ones(size(y))*x;
Y=y*ones(size(x));

[X,Y]=meshgrid(x,y);% x、y为向量，存储网格点坐标的X、Y为矩阵

x=2:6;
y=(3:8)';
[X,Y]=meshgrid(x,y);
Z=randn(size(X));
plot3(X,Y,Z);
grid on;

%绘制三维曲面的函数
mesh(x,y,z,c) % 三维网格图
surf(x,y,z,c) % 三维曲面图
              % 其中，x、y是网格坐标矩阵，z是网格点上的高度矩阵
              % c用于指定在不同高度下的曲面颜色，省略时默认c=z

% 绘制三维曲面图
t=-2:0.2:2;
[X,Y]=meshgrid(t);
Z=X.*exp(-X.^2-Y.^2);
subplot(1,3,1)
mesh(X,Y,Z);
subplot(1,3,2)
surf(X,Y,Z);
subplot(1,3,3)
plot3(X,Y,Z)
grid on

mesh(z,c)
surf(z,c)  %当x、y省略时，z矩阵的第2维下标当作x轴坐标，z矩阵的第1维下标当作y轴坐标

t=1:5;
z=[0.5*t;2*t;3*t];
mesh(z);

%
% 用四种方式绘制函数的曲面图
[x,y]=meshgrid(0:0.1:2,1:0.1:3);
z=(x-1).^2+(y-2).^2-1;
subplot(2,2,1);
meshc(x,y,z);title('meshcx,y,z');
subplot(2,2,2);
meshz(x,y,z);title('meshcx,y,z');
subplot(2,2,3);
surfc(x,y,z);title('meshcx,y,z');
subplot(2,2,4);
surfl(x,y,z);title('meshcx,y,z');

subplot(1,3,1);
[x,y,z]=cylinder;
surf(x,y,z);
subplot(1,3,2);
t=linspace(0,2*pi,40);
[x,y,z]=cylinder(2+cos(t),30);
surf(x,y,z);
subplot(1,3,3);
[x,y,z]=cylinder(0:0.2:2,30);
surf(x,y,z);

[x,y,z]=cylinder(1,60);
z=[-1*z(2,:);z(2,:)];
surf(x,y,z);
hold on
surf(y,z,x);
axis equal












































































