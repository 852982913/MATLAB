%%

a=[1,2,3;5,8,0;4,7,3]   %�����ʾ

%%

e=zeros(10,5,3)
e(:,:,1)=rand(10,5)     %rand ���ɾ��ȷֲ���α��������ֲ��ڣ�0~1��֮��
e(:,:,2)=randi(5,10,5)  %randi ���ɾ��ȷֲ���α�������
e(:,:,3)=randn(10,5)    %randn ���ɱ�׼��̬�ֲ���α���������ֵΪ0������Ϊ1��

%%

%Ԫ������
 a=cell(1,6)
 a{2}=eye(3)
 a{5}=magic(5)      %�÷�
%magic������˼��ħ����ħ������˼����matlab����������n�׻÷���
%�������׻÷�����1-9�Ÿ����֣����һ��3*3�ľ���
%ʹ�øþ������ۺᡢ������б���������ϵ��������ĺ�������ͬ�ġ�

%%

%�ṹ��
books=struct('name',{{'Machine Learning','Data Mining'}},'price',[30 40])
books.name        %����
books.name(1)
books.name{1}

%%

%�������������
a=[1,2,3,5,8,5,4,6]
b=1:2:9             %��1��9   2Ϊ����
c=repmat(b,3,1)     %replicate matrix  ���ƺ�ƽ�̾��� 3��1��
d=ones(2,4)         %Ԫ��ȫΪ1�ľ���

%%

a=randi(3,3)
b=randi(3,3)
a.*b            %��ӦԪ����ˣ����м�  .  �Ķ��Ƕ�Ӧ�����㣩
a/b             %a��b�������
a./b            %��Ӧ�����

%%

%������±�
a=magic(5)
b=a(2,3)          %ȡ�ڶ��е����е�Ԫ��
c=a(3,:)          %ȡ������
d=a(:,4)          %ȡ������
[m,n]=find(a>20)  %�ҳ�a>20��Ԫ�أ�m��ʾ�У�n��ʾ��

%%

% forѭ���ṹ

% for ѭ������=��ֵ����������ֵ
%     ִ����� 1
%     .
%     .
%     .
%     ִ����� n
% end
% ���У�������Ĭ��ֵΪ1������ʡ��
% ��ֵ����������ֵ�����ɸ���С����������ѧ�߼�����

% ������1?+2?+3?+4?+5?

sum=0;       %����ļӷֺ�ʱ�����н��������ڲ���ʾ��
             %���ӷֺ�ʱ��������س�ʱ�����н���ͻ�������ʾ������
for i=1:1:5
    sum=sum+i^2;
end

% ������1!+2!+3!+4!+5!
sum=0;
    for i=1:5;
        p=1;
        for j=1:i
            p=p*j;
        end 
        sum=sum+p;
    end
    
%�žų˷���
for i=1:9;
    for j=1:9;
        a(i,j)=i*j
    end
end

% �� 1+2+��+10
sum=0;i=0;
while i<=10;
    sum=sum+i;
    i=i+1;
end

%%
%��άƽ���ͼ
x=0:0.01:2*pi;
y=sin(x);
figure              %����һ��Ļ��
plot(x,y)           %���Ƶ�ǰ��άƽ���ͼ
title('y=sin x')    %����
xlabel ('x')        %x�����
ylabel ('y=sin x')  %y�����
xlim([0 2*pi])      %�����ͼ������ʾ����xȡֵ��Χ

x=0:0.01:20;
y1=200*exp(-0.05*x).*sin(x);
y2=0.8*exp(-0.5*x).*sin(10*x);
figure
[AX,H1,H2]=plotyy(x,y1,x,y2,'plot');            %plotyy����Ϊ����һ��x����ϵ
set(get(AX(1),'Ylabel'),'String','Slow Decay')
set(get(AX(2),'Ylabel'),'String','Fast Decay')
xlabel('Time(\musee)')  
title('Multiple Decat Rates')    
set(H1,'Linestyle','--')
set(H2,'Linestyle',':')

%%
%��ά�����ͼ
t=0:pi/50:10*pi;
plot3(sin(t),cos(t),tan(t))
xlabel('sin(t)')
ylabel('cos(t)')
zlabel('t')
grid on      %������
axis square  %����ǰ����ϵͼ������Ϊ���Ρ����ἰ���������1��1
             %axis ����Ҫ�����Ƕ����������һ�������Ų�����
             %axis( [xmin xmax ymin ymax] ) 
             %���õ�ǰ������ x�� �� y������Ʒ�Χ

%%
% ͼ�εı����뵼��
% �༭--����ͼ��--ȥwordճ��
% �����ļ�--�������õ�����������

%%
[x,y,z]=peaks(30)%peaks ˫�庯��
mesh(x,y,z)
grid

ezsurf('u*sin(v)','u*cos(v)','4*v',[-2*pi,2*pi,-2*pi,2*pi]);

 subplot(1,2,1);
 [x,y]=meshgrid(0:0.25:4,-2:.25:2);
 z=sin(x).*cos(y);
 [nx,ny,nz]=surfnorm(x,y,z);%���㷨�߷���
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

