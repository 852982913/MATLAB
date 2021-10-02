clear
clear all
clc
%�������������ļ�����ӵ�Ԫ�����飬���ļ���������.csv�ļ��������ݴ�����
path = 'C:\Users\�����ſ��о��ר��\Desktop\40001-1Hz\292-767';           %��������ļ��о���·��,��������Ҫ��ͬһ������
list = dir([path,'\*.csv']); %��ȡpath·��������csv��ʽ�ļ�
fileNames={list.name};      %�������ļ�����ӵ�Ԫ������
disp(fileNames)             %��ʾ���� X ��ֵ��������ӡ��������
for i = 1:length(fileNames) %�������ݣ������������
    disp(fileNames{i})
    exist(fileNames{i}', 'file')
    data_in =csvread(fileNames{i},2); %�޸���ֵ�Ӳ�ͬ�п�ʼ��ȡ
 %�������ж�ǰk�������������ݡ���������������������
%      reference = data_in(:, 1); %���ص�2�����ݣ�Ѱ�ұ�־λ����¼��־λ����k
%      for k = 1:length(reference)
%          x(k) = reference(k);
%          if x(k) ~= 1510
%              break;
%          end
%      end
%      k = k-2;
%      disp(k);
 %�������������������ݴ���������������������������������������������
D = data_in(:, [1,2]); %��1��2�����ݰ�˳��������D
%  D(1:k,:) = []; %ȥ��ǰk����Ч����
hmax = length(D);

W1 = D(:, 1); %����
I1 = D(:, 2); %ǿ��
%������������������ͼ����������������������������������
plot(W1,I1,'b','linewidth',1); 
hold on
a_tem=findpeaks(D(:,2));%α��ֵ
a_tem=sort(a_tem,'descend');
b1=a_tem(1);%��ֵ1
switch i
    case 37
        b2=a_tem(9);
    case 50
        b2=a_tem(8);
    case 335        %�켣����344���м�ɾ����10������  ����һ��+1
        b2=a_tem(3);
    otherwise
        b2=a_tem(2);%��ֵ2
end
[raw1,col1]=find(D==b1);%��ȡ��ֵ�������
heng1=D(raw1,1);
heng1=heng1(1)%����ʱѡ��ִ�У�ֱ��ִ��Ҳ���ԣ����ή�ͳ���Ч�ʣ���ͬ
zong1=b1;

plot(heng1,zong1,'.','color','r','MarkerSize',20);%��ֵ���
[raw2,col2]=find(D==b2);
heng2=D(raw2,1);
heng2=heng2(1)%����ʱѡ��ִ��
zong2=b2;
plot(heng2,zong2,'.','color','r','MarkerSize',20);%��ֵ���
v1=heng1/1000000;
v1=v1(1)%����ʱѡ��ִ��
txt=[' f = ',num2str(v1),'MHz']%ͼ�ϱ�ע
text(heng1,zong1,txt)
v2=heng2/1000000;
v2=v2(1)%����ʱѡ��ִ��
txt=[' f = ',num2str(v1),'MHz']%ͼ�ϱ�ע
text(heng2,zong2,txt)
% ----------------��ֵ����-----------------
if (zong1-zong2)>0        %��һ����ֵ���ڵڶ�����ֵ
    line([heng1 heng1],[zong1 zong1-100-abs(zong1-zong2)],'Color','red','LineStyle','--');%����ֵ��������
    line([heng2 heng2],[zong2 zong2-100],'Color','red','LineStyle','--');%����ֵ��������
    line([heng1 heng2],[zong2-100 zong2-100],'Color','red','LineStyle','--')%��һ��������
    henga=(heng1+heng2)/2;
    str=abs(heng1-heng2);
    txt=[num2str(str),'Hz']%ͼ�ϱ�ע
    text(henga,zong1-100-abs(zong1-zong2)+5,txt)
else
    line([heng1 heng1],[zong1 zong1-100],'Color','red','LineStyle','--');
    line([heng2 heng2],[zong2 zong2-100-abs(zong1-zong2)],'Color','red','LineStyle','--');
    line([heng1 heng2],[zong1-100 zong1-100],'Color','red','LineStyle','--')
    henga=(heng1+heng2)/2;
    str=abs(heng1-heng2);
    txt=[num2str(str),' Hz']%ͼ�ϱ�ע
    text(henga,zong1-100-abs(zong1-zong2)+5,txt)
end
title([fileNames{i} 'Ƶ��'],'fontsize',18,'fontweight','bold','fontname','΢���ź�','Color','r');
xlabel('Frequency(Hz)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r'); 
ylabel('Intensity(dBm)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r');
hold off
fengzhi(i,1)=v1;
fengzhi(i,2)=v2;
fengzhi(i,3)=str;
 %������������������ͼ��������������������������������
%  mkdir csv_image;           %�½�dat_image�ļ��У�����ڻᾯ�棬��Ӱ�����
%  filepath=pwd;              %���浱ǰ����Ŀ¼
%  cd('C:\Users\�����ſ��о��ר��\Desktop\292-767\csv_image');    %�ѵ�ǰ����Ŀ¼�л���ָ���ļ���
%  f = getframe(gcf);
% imwrite(f.cdata,[fileNames{i} 'Ƶ��.png']);%��fileNames{i} ����д���ļ���
%  cd(filepath); %���ع���Ŀ¼
end;%.csv�ļ�����forѭ��β 
Mean=mean(fengzhi(:,3));% ��ֵ
std_cha=std(fengzhi(:,3));% ��׼��
% close; %�ر�����ͼ��
