close all
clear all
clc
%�������������ļ�����ӵ�Ԫ�����飬���ļ���������.csv�ļ��������ݴ�����
path = 'C:\Users\�����ſ��о��ר��\Desktop\ʾ����\';           %��������ļ��о���·��,��������Ҫ��ͬһ������
list = dir([path,'*.csv']); %��ȡpath·��������csv��ʽ�ļ�
fileNames={list.name};      %�������ļ�����ӵ�Ԫ������
disp(fileNames)             %��ʾ���� X ��ֵ��������ӡ��������
for i = 1:length(fileNames) %�������ݣ������������
    disp(fileNames{i})
    exist(fileNames{i}', 'file')
    data_in =csvread(fileNames{i},46); %�޸���ֵ�Ӳ�ͬ�п�ʼ��ȡ
% %�������ж�ǰk�������������ݡ���������������������
%     reference = data_in(:, 1); %���ص�2�����ݣ�Ѱ�ұ�־λ����¼��־λ����k
%     for k = 1:length(reference)
%         x(k) = reference(k);
%         if x(k) ~= 1510
%             break;
%         end
%     end
%     k = k-2;
%     disp(k);
 %�������������������ݴ���������������������������������������������
D = data_in(:, [1,2]); %��1��2�����ݰ�˳��������D
% D(1:k,:) = []; %ȥ��ǰk����Ч����
hmax = length(D);

W1 = D(:, 1); %����
I1 = D(:, 2); %ǿ��
%������������������ͼ����������������������������������
plot(W1,I1,'b','linewidth',1); 
title([fileNames{i} 'Ƶ��'],'fontsize',18,'fontweight','bold','fontname','΢���ź�','Color','r');
xlabel('Frequency (nm)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r'); 
ylabel('Intensity (dBm)','fontname','΢���ź�','fontsize',14,'FontWeight','bold','Color','r');
 %������������������ͼ��������������������������������
 mkdir csv_image;           %�½�dat_image�ļ��У�����ڻᾯ�棬��Ӱ�����
 filepath=pwd;              %���浱ǰ����Ŀ¼
 cd('C:\Users\�����ſ��о��ר��\Desktop\ʾ����\csv_image');    %�ѵ�ǰ����Ŀ¼�л���ָ���ļ���
 f = getframe(gcf);
imwrite(f.cdata,[fileNames{i} 'Ƶ��.png']);%��fileNames{i} ����д���ļ���
 cd(filepath); %���ع���Ŀ¼

end;%.csv�ļ�����forѭ��β
% close; %�ر�����ͼ��

