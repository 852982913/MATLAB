%%
% 稀疏矩阵  零元素的个数远远对于非零元素的个数
% 稀疏存储方式只存储有值的行号与列号，可大大节省空间
s=[1,0,0,0;0,5,0,0;2,0,0,7]
a=sparse(s)     % 将矩阵s转换为稀疏存储方式的矩阵a
s=full(a)       % 将矩阵a转化为完全存储方式的矩阵s

%直接建立稀疏存储矩阵
sparse(m,n) % 生成一个m×n的所有元素都是零的稀疏矩阵
sparse(u,v,S) % 三个参数是3个等长向量。
              % S是要建立的稀疏存储矩阵的非零元素
              % u,v分别是S的行下标与列下标
a=sparse([1,2,2],[2,1,4],[4,5,-7])
b=full(a)

[b,d]=spdiags(a)   % 从带状稀疏矩阵a中提取全部非零对角线元素赋给矩阵b及这些非零对角线的位置向量d
                   % 带状稀疏矩阵：所有非零元素集中在对角线上的矩阵
a=spdiags(b,d,m,n) % 产生带状稀疏矩阵的稀疏存储矩阵a
                   % 其中m、n为原带状稀疏矩阵的行数与列数
                   % 矩阵b的第i列即为原带状稀疏矩阵的第i条非零对角线
                   % 向量d为原带状稀疏矩阵所有非零对角线的位置

a=[11,0,0,12,0,0;0,21,0,0,22,0;0,0,31,0,0,32;41,0,0,42,0,0;0,51,0,0,52,0]
[b,d]=spdiags(a)

a=spdiags(b,d,5,6)

speye(m,n) % 返回一个m×n的稀疏存储单位矩阵

%稀疏矩阵应用举例,解线性方程组
kf1=[1;1;2;1;0];
k0=[2;4;6;6;1];
k1=[0;3;1;4;2];
b=[kf1,k0,k1];
d=[-1;0;1];
a=spdiags(b,d,5,5);
f=[0;3;2;1;5];
x=a\f

%%
% matlab程序流程控制
% 数据的输入
a=input('请输入变量a的值'); % 括号内为提示信息
%数据的输出
s=('hello,world')    % disp(输出项)
disp(s)
pause()   % 延迟秒数

%%
% 选择结构
% 当条件是一个矩阵时，若矩阵非空且不包含零元素，则条件成立，否则不成立

a=input('输入');
c=rem(a,2);
if  (c==0)
    a*a*a
else
    a*a
end

%%
%多分支if语句
c=input('输入','s');
if c>='A'&&c<='Z'
    disp(lower(c))
elseif c>='a'&&c<='z'
    disp(upper(c))
elseif c>='0'&&c<='9'
    disp(str2double(c)^2)
else
    disp(c)
end
    
%%
switch case otherwise end

%%
% 循环结构
%while相对用于循环次数不确定的情况。for语句在循环次数确定的情况下更加方便
for end

for k=[1,2,3,4]% 循环四次(一行四列)

for k=[1;2;3;4]% 循环一次(四行一列)
% for语句中，循环变量可以是列向量

% %while 条件
%     循环体语句
% end

% 从键盘输入若干个数，当输入0时结束输入，求这些数的平均值和它们之和
msum=0;
n=0;
x=input('Enter a number(end in 0):');
while x~=0
    msum=msum+x;
    n=n+1;
    x=input('Enter a number(end in 0):');
end
if n>0
    msum
    mean=msum/n
end

% break 程序跳出循环
% continue 结束本次循环
% 求[100,200]之间第一个能被21整除的数
for x=100:200;
    c=rem(x,21);
    if c==0
        x
        break
    else
        continue
    end
end

%%
% 函数文件的定义与调用
function 输出形参表=函数名(输入形参表)
注释说明部分
函数体语句
% 当输出形参多于一个时，应该用方括号括起来，构成一个输出矩阵
% return语句表示结束函数的执行
% 编写函数文件，求半径为r的圆的面积和周长
function[s,p]=fcircle(r) % 有多个形参时，形参之间用逗号分隔，组成形参表。
s=pi*r*r;
p=2*pi*r;
%调用格式  [输出实参表]=函数名(输入实参表)
[s,p]=fcircle(3)
%匿名函数
% 函数句柄变量=@(匿名函数输入参数)匿名函数表达式
f=@(x,y)x^2+y^2
f(3,4)

%函数句柄变量=@函数名
h=@sin
h(pi/2)

%脚本文件
f=@(n)n+10*log(n*n+5);
y=@(x,y,z)x/(y+z);
y(f(40),f(30),f(20))

% 第二问的函数文件
function f=f2(n)
f=0;
for k=1:n
    f=f+k*(k+1);
end





