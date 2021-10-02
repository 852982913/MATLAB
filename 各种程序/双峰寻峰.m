clear all
clc
%�������������ļ�����ӵ�Ԫ�����飬���ļ���������.csv�ļ��������ݴ�����
path = 'C:\Users\�����ſ��о��ר��\Desktop\1-369';           %��������ļ��о���·��,��������Ҫ��ͬһ������
list = dir([path,'\*.csv']); %��ȡpath·��������csv��ʽ�ļ�
fileNames={list.name};      %�������ļ�����ӵ�Ԫ������
disp(fileNames)             %��ʾ���� X ��ֵ��������ӡ��������
for i = 1:length(fileNames) %�������ݣ������������
    disp(fileNames{i})
    exist(fileNames{i}', 'file')
    data_in =csvread(fileNames{i},1); %�޸���ֵ�Ӳ�ͬ�п�ʼ��ȡ
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
tem=(size(D,1))/2;%�ֳ������Ӿ��󣬷ֱ�Ѱ��
D1=D(1:tem,:);
D2=D(tem:end,:);
hold on
a1=findpeaks(D1(:,2));%α��ֵ
b1=max(a1);
[raw1,col1]=find(D1==b1);%��ȡ��ֵ�������
heng1=D1(raw1,1);
heng1=heng1(1);% �����������ά�Ȳ�һ��
zong1=b1;
plot(heng1,zong1,'.','color','r','MarkerSize',20);%��ֵ���
a2=findpeaks(D2(:,2));
b2=max(a2);
[raw2,col2]=find(D2==b2);
heng2=D2(raw2,1);
zong2=b2;
plot(heng2,zong2,'.','color','r','MarkerSize',20);%��ֵ���
v1=heng1/1000000;
txt=[' f = ',num2str(v1),'MHz']%ͼ�ϱ�ע
text(heng1,zong1,txt)
v2=heng2/1000000;
txt=[' f = ',num2str(v2),'MHz']%ͼ�ϱ�ע
text(heng2,zong2,txt)
% ----------------��ֵ����-----------------
if (zong1-zong2)>0        %��һ����ֵ���ڵڶ�����ֵ
    line([heng1 heng1],[zong1 zong1-100-abs(zong1-zong2)],'Color','red','LineStyle','--');%����ֵ��������
    line([heng2 heng2],[zong2 zong2-100],'Color','red','LineStyle','--');%����ֵ��������
    line([heng1 heng2],[zong2-100 zong2-100],'Color','red','LineStyle','--')%��һ��������
    henga=(heng1+heng2)/2;
    str=heng2-heng1;
    txt=[num2str(str),'Hz']%ͼ�ϱ�ע
    text(henga,zong1-100-abs(zong1-zong2)+5,txt)
else
    line([heng1 heng1],[zong1 zong1-100],'Color','red','LineStyle','--');
    line([heng2 heng2],[zong2 zong2-100-abs(zong1-zong2)],'Color','red','LineStyle','--');
    line([heng1 heng2],[zong1-100 zong1-100],'Color','red','LineStyle','--')
end
 title(['Ƶ��'],'fontsize',18,'fontweight','bold','fontname','΢���ź�','Color','r');
xlabel('Frequency(Hz)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r'); 
 ylabel('Intensity(dBm)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r');
plot(W1,I1,'b','linewidth',1); 
hold off
fengzhi(i,1)=v1;
fengzhi(i,2)=v2;
fengzhi(i,3)=str;
 %������������������ͼ��������������������������������
 mkdir csv_image;           %�½�dat_image�ļ��У�����ڻᾯ�棬��Ӱ�����
 filepath=pwd;              %���浱ǰ����Ŀ¼
 cd('C:\Users\�����ſ��о��ר��\Desktop\1-369\8.19');    %�ѵ�ǰ����Ŀ¼�л���ָ���ļ���
 f = getframe(gcf);
imwrite(f.cdata,[fileNames{i} 'Ƶ��.png']);%��fileNames{i} ����д���ļ���
 cd(filepath); %���ع���Ŀ¼

end;%.csv�ļ�����forѭ��β
Mean=mean(fengzhi(:,3));% ��ֵ
std_cha=std(fengzhi(:,3));% ��׼��
% close; %�ر�����ͼ��



