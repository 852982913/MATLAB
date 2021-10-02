%% 基本字符串处理
t=pi;
a='[t,sin(t),cos(t)]';
b=eval(a) %eval(a),将a中的字符串当作命令来执行

abs('a')
double('a') %  abs 和 double 函数都可以获取字符串矩阵中的ASCII数值矩阵

a=[97,98,99;100,101,102;103,104,105];
char(a)%char 函数可以把ASCII码矩阵转换为字符串矩阵

s1='MATLAB';
a=abs(s1)
char(a+32)


%% 字符串的比较
% 可利用关系运算符或字符串比较函数
% 关系运算符比较：两个字符串里的字符依次按照ASCII码比较，结果是一个数值向量
% 其结果要么是 1 ，要么是 0 
 
'www0'>'W123'

% 字符串比较函数用于判断字符串是否相等
strcmp(s1,s2)  % 比较字符串s1和s2是否相等，相等返回1，不相等返回0
strcmp(s1,s2,n) % 比较前n个字符是否相等，相等返回1，不相等返回0
strcmpi(s1,s2) % 忽略字母大小写的前提下比较字符串是否相等，相等返回1.不相等返回0
strcmpi(s1,s2,n) % 忽略字母大小写的前提下比较字符串前n个字符是否相等,相等返回1，不相等返回0

% 字符串的查找与替换
findstr(s1,s2) % 返回短字符串在长字符串中的开始位置
strrep(s1,s2,s3)% 将字符串s1中的所有子字符串s2替换为字符串s3

p=findstr('This is a test!','is')
p=findstr('is','This is a test!')
result=strrep('This is a test!','test','class')



%% 函数文件的定义与调用