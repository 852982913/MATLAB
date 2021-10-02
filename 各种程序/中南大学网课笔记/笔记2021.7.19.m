%%
% �����ĵݹ����

% function f=fact(n)
% ...
% fact (n-1)
% ...

%ֱ�ӵݹ�  f��������f����
%Ƕ�׵���  f1����f2������f2��������f1����

%���ú����ĵݹ���ã���n!

% ����fact.m����
function f=fact(n)
if n<=1
    f=1;
else
    f=fact (n-1)*n;
end
%�ڽű��ļ�a.m�е��ú����ļ�fact.m,��n!
n=input('Please input n=');
s=fact(n);
disp(s)

%쳲�����������֤
% ���Ƚ��������ļ�ffib.m
function f=ffib(n)
if n>2
    f=ffib(n-1)+ffib(n-2);
else
    f=1;
end

% �����ű��ļ�test.m
F=[];
for k=1:20
    F=[F,ffib(k)*ffib(k)];
end
sum(F)
ffib(20)*ffib(21)

%���������������������

% nargin  ����ʵ�εĸ���
% nargout ���ʵ�εĸ���

% ���������ļ�test.m
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
% �ֲ�������������ֻ���ض����̻����п��Է��ʵı���
% ȫ�ֱ�����������������matlab�����ռ䣬Ҳ����ȫ����Ч��
%           ���еĺ��������Զ������д�ȡ���޸�

% ȫ�ֱ��������ʽ
% global ������
% ���������ļ�wad.m
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
% ͼ�λ���

% ����һ������
plot(x,y) %x,y�ֱ����ڴ���x�����y��������
x=[2.5,3.5,4,5];
y=[1.5,2.0,1,1.5];
plot(x,y)

%��򵥵�plot�������ø�ʽ
x=[2.5,3.5,4,5];
plot(x)%����������Ϊ1��2��3��4��
       %����������Ϊx��Ԫ��ֵ
       
x=[2.5,3.5,4,5];
y=[1.5,2,1,1.5];
cx=x+y*i;
plot(cx)%��x�Ǹ�����ʱ����ֱ��Ը�����Ԫ��ʵ�����鲿Ϊ�ᡢ��������Ƴ�һ������

% ��x��������y�Ǿ���ʱ

% ��y����������x�ĳ��ȣ���������xΪ�����꣬��y��ÿ��������Ϊ�������������
% ���ߵ���������y������

% ��y����������x�ĳ��ȣ���������xΪ�����꣬��y��ÿ��������Ϊ�������������
% ���ߵ���������y������

x=linspace(0,2*pi,1000); % linspace(x,y,N)����x,y֮���N������
y=[sin(x);sin(2*x);sin(0.5*x)];
plot(x,y)

% x��y��ͬ�;���ʱ����x��y��Ӧ��Ԫ��Ϊ��������ֱ�������ߣ������������ھ��������

t=0:0.01:2*pi;
t1=t';
x=[t1,t1,t1];
y=[sin(t1),sin(2*t1),sin(0.5*t1)];
plot(x,y)

% ���������plot
plot(x1,y1,x2,y2,��,xn,yn)

t1=linspace(0,2*pi,10);
t2=linspace(0,2*pi,20);
t3=linspace(0,2*pi,100);
plot(t1,sin(t1),t2,sin(t2)+1,t3,sin(t3)+2)

% ��ѡ���plot����
plot(x,y,ѡ��)

x=(0:pi/50:2*pi)';
y1=2*exp(-0.5*x)*[1,-1];
y2=2*exp(-0.5*x).*sin(2*pi*x);
x1=0:0.5:6;
y3=2*exp(-0.5*x1).*sin(2*pi*x1);
plot(x,y1,'k:',x,y2,'b--',x1,y3,'rp')

fplot(f,lims,ѡ��) % ��Щ������ĳЩ����仯�ϴ�fplot�����ú���Ĳ������
                   % fΪ������limsΪ������ȡֵ��Χ����[xmin, xmax]������Ĭ��ֵΪ[-5,5]
fplot(@(x)sin(1./x),[0,0.2],'r') % @Ϊ�������������
fplot(funx,funy,tlims,ѡ��) % ����������ʽ  funx��funy��������ͨ�����ú�������ķ�ʽ
                            % tlimsΪ�����������Ա�����ȡֵ��Χ����[tmin,tmax]����

fplot(@(t)t.*sin(t),@(t)t.*cos(t),[0,10*pi],'r')

%%
%����ͼ�θ�������
title(ͼ�α���)
xlabel(x��˵��)
ylabel(y��˵��)
text(x,y,ͼ��˵��)
legend(ͼ��1��ͼ��2)

title({'MATLAB','y=sin(x)'}) % ���仰������ʾ
title({'y=sin{\omega}x'})    %ϣ����ĸ��
title({'X_{1}{\geq}X_{2}'})  %�Լ����п���(����leqtext)
title('{\bf123}')% \bf �Ӵ�
                 % \it б��
                 % \rm ����

title('123','color','r')  % ������ɫ
title('123','fontsize',25)% �����ֺ�

text(x,y,˵��)
gtext(˵��)

text(-2*pi,0,'-2{\pi}')
text(3,0.28,'\leftarrow sin(x)')

legend(ͼ��1��ͼ��2����)

x=linspace(0,2*pi,100);
plot(x,[sin(x);sin(2*x);sin(3*x)])
legend('sin(x)','sin(2x)','sin(3x)')

axis([xmin,xmax,ymin,ymax,zmin,zmax]) %�����᷶Χ
axis equal  % �ݺ���������õȳ��̶�
axis square % ��������������ϵ(Ĭ��Ϊ����)
axis auto   % ʹ���������Ĭ������
axis off    % ȡ��������
axis on     % ��ʾ������

x=[0,1,1,0,0];
y=[0,0,1,1,0];
plot(x,y)
axis([-0.1,1.1,-0.1,1.1])
axis equal

% ��������
grid on
grid off
grid 

%����ϵ�ӱ߿�
box on
box off
box

x=linspace(0,2*pi,100);
y=[sin(x);sin(2*x);sin(0.5*x)];
plot(x,y)
axis([0,7,-1.2,1.2])
title('��ͬƵ�����Һ�������','fontsize',3)
xlabel('Variable X');
ylabel('Variable Y');
text(2.5,sin(2.5),'sin(x)');
text(1.5,sin(2*1.5),'sin(2x)');
text(5.5,sin(0.5*5.5),'sin(0.5x)');
legend('sin(x)','sin(2x)','sin(0.5x)');
grid on

%ͼ�α���
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