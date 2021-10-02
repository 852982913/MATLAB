close all
clear all
clc

shijianxian=csvread('C:\Users\酒仙桥科研巨擘专用\Desktop\时间线画图用.csv');
chongpincha=csvread('C:\Users\酒仙桥科研巨擘专用\Desktop\重频差画图用.csv');
scatter(shijianxian(:,1),chongpincha(:,1),50,[0 0 0.9],'filled')
a=std(chongpincha(:,1));% 标准差
Mean=mean(chongpincha(:,1));
xlabel('Time(min)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','k'); 
ylabel('Frequency(Hz)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','k'); 
txt1=[' Mean = ',num2str(Mean),' Hz'];%图上标注相关信息
txt2=[' σ = ',num2str(a),' Hz'];
text(5,45,txt1,'fontsize',15,'fontweight','bold','fontname','微软雅黑','Color','k')
text(5,50,txt2,'fontsize',15,'fontweight','bold','fontname','微软雅黑','Color','k')
