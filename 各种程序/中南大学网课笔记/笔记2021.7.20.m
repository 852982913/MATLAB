%%

%ͼ�δ��ڵķָ�
% ��ͼ��ͬһͼ�δ����еĲ�ͬ����ϵ�µ�ͼ��
subplot(m,n,p) % ���У�m��nָ����ͼ�δ��ڷֳ�m��n����ͼ����pָ����ǰ���

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
% ��������ͼ(֮ǰģ�������ù�����ͼ)
semilogx(x1,y1,ѡ��1,x2,y2,ѡ��2,��) % x����Ϊ����
semilogy(x1,y1,ѡ��1,x2,y2,ѡ��2,��) % y����Ϊ����
loglog(x1,y1,ѡ��1,x2,y2,ѡ��2,��)   % ȫ��Ϊ����

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

% ������ͼ
polar(theta,rho,ѡ��) % ���У�theta(��)Ϊ���ǣ�rho(��)Ϊ����

t=0:pi/100:2*pi;
r=1-sin(t);
subplot(1,2,1)
polar(t,r)
subplot(1,2,2)
t1=t-pi/2;
r1=1-sin(t1);
polar(t,r1)

%%
% ����ͼ
bar(y,style) % ���ƴ�ֱ����ͼ
barh(y,style)% ����ˮƽ����ͼ
             % style������grouped��(��״����)��stacked��(�ѻ�����)

y=[1,2,3,4,5;1,2,1,2,1;5,4,3,2,1];
subplot(1,2,1)
bar(y)
title('Group')
subplot(1,2,2)
bar(y,'stacked')
title('Stack')

bar(x,y,style) % ����x�洢�����꣬y�洢����

x=[2015,2016,2017];
y=[68,80,115,98,102;75,88,102,99,110;81,86,125,105,115];
bar(x,y)
title('Group')

%ֱ��ͼ
hist(y)
hist(y,x)

y=randn(500,1);
subplot(2,1,1);
hist(y);
title('��˹�ֲ�ֱ��ͼ')
subplot(2,1,2);
x=-3:0.2:3;
hist(y,x);
title('ָ���������ĵ��ֱ��ͼ')

rose(theta,x)
% ���У�����theta����ȷ��ÿһ������Զ��ĽǶȣ�ѡ��x����ָ������Ļ��ַ�ʽ

%������ֱ��ͼ
y=randn(500,1);
theta=y*pi;
rose(theta)
title('�ڼ������µ�ֱ��ͼ')

%�����ͼ��
pie(x,explode) % ����x�洢��ͳ�����ݣ�ѡ��explode����ͼ�����ʾģʽ

score=[5,17,23,9,4];
ex=[0,0,0,0,1];
pie(score,ex)
legend('����','����','�е�','����','������','location','eastoutside')

%ɢ��ͼ
scatter(x,y,ѡ��,'filled') % ����x,y���ڶ�λ���ݵ㣬ѡ������ָ�����͡���ɫ�����ݵ���

t=0:pi/50:2*pi;
x=16*sin(t).^3;
y=13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t);
scatter(x,y,'rp','filled')

%ʸ����ͼ��
compass % ����ͼ
feather % ��ëͼ
quiver  % ��ͷͼ
quiver(x,y,u,v) % (x,y)ָ��ʸ����㣬(u,v)ָ��ʸ���յ�

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

%% ��άͼ��
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

% ����x,y,z��ͬ�;���
% ����x,y,z������Ҳ�о���

t=0:0.01:2*pi;
t=t';
x=[t,t,t,t,t];
y=[sin(t),sin(t)+1,sin(t)+2,sin(t)+3,sin(t)+4];
z=[t,t,t,t,t];
plot3(x,y,z)
grid


plot(x1,y1,z1,x2,y2,z2,��,xn,yn,zn) % ���ж��������plot3����

t1=0:0.01:1.5*pi;
t2=0:0.01:2*pi;
t3=0:0.01:3*pi;
plot3(t1,sin(t1),t1,t2,sin(t2)+1,t2,t3,sin(t3)+2,t3)
grid

����
t=0:pi/50:6*pi;
x=cos(t);
y=sin(t);
z=2*t;
plot3(x,y,z,'p')
xlabel('X')
ylabel('Y')
zlabel('Z')
grid on

fplot3(funx,funy,funz,tlims)% ����������ʽ  funx��funy��funz����������x��y��z�ĺ�����ͨ�����ú�������ķ�ʽ
                            % tlimsΪ�����������Ա�����ȡֵ��Χ����[tmin,tmax]����

% ī����ñ������
xt=@(t)exp(-t/10).*sin(5*t);
yt=@(t)exp(-t/10).*cos(5*t);
zt=@(t)t;
fplot3(xt,yt,zt,[-12,12])



