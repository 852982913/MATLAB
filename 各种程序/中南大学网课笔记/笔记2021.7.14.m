%% 
sin(pi/2)
sind(90)    %sin为弧度制,sind为角度值

abs(-4)
abs(3+4i)
abs('a')     %abs函数可以求实数的绝对值、复数的模、字符串的ASCII码值

%%  几种取值函数
round(3.36)   %四舍五入
ceil(3.36)    %向上取整，取大于等于这个数的第一个整数
floor(3.6)    %向下取整，取大小于等于这个数的第一个整数
fix(-3.8)     %舍去小数取整

%% 求一个数的个位、十位、百位
m=345;
m1=rem(m,10)            %rem(X,Y)  X除以Y取余
m2=rem(fix(m/10),10)    
m3=fix(m/10)            

%% 求[1,100]区间的所有素数
x=1:100
k=isprime(x); %insprime(n)判断n是否是一个素数，是返回1，不是返回0。 
k1=find(k);   
p=x(k1)

xlabel('x')
ylabel('y')









