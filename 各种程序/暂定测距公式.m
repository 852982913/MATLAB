clear all;close all;clc
hom=1;
num=200000;
for j=0:5
    RF=load(['20211009-1_000',num2str(j),'.csv']);
    [v pos]=max(RF(1:(end+1)/2,2));
    freq(j+1,1)=RF(pos,1);
    [v pos]=max(RF((end+1)/2:end,2));
    freq(j+1,2)=RF(pos+(end+1)/2-1,1);
end
c=3e8;
for i=0:5
    n=num2str(i);
    filename=strcat('C1Trace0000',n,'.csv');%文件名
    range=['B',num2str(1),'..','B',num2str(num)];%数据文件中所需数据的范围
    original_signal=load(filename,'\t',range); %处理前数据
    rangeTime=['A','1','..','A',num2str(num)];
    t=load(filename,'\t',rangeTime);
    V_original=original_signal-mean(original_signal(1:500));%纵轴
    [peakV peak]=max(V_original(1:0.5*num));
    t=t-t(peak);
    [peakV peak2]=max(abs(V_original(0.5*num:num)));
    plot(t,V_original);hold on;
    dt(i+1)=t(peak2+0.4*num-1);
    plot(t(peak2+0.4*num-1),V_original(peak2+0.4*num-1),'r*');
end

j=5;
deltf=(freq(1:j+1,2)-freq(1:j+1,1))/hom;
f_laser=mean(freq')/hom;
f_laser=f_laser';
D_distance=dt.*deltf(1:i+1)./f_laser(1:i+1)*c*1e3; %单位为毫米
deltf1=0.5*((freq(1:j,2)-freq(1:j,1))/hom+(freq(2:j+1,2)-freq(2:j+1,1))/hom);
D_distance2=dt.*deltf1(1:j)./f_laser(1:j)*c*1e3; %单位为毫米
mean(D_distance)
std(D_distance)
mean(D_distance2)
std(D_distance2)
rms(D_distance2)


