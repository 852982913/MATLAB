shijian=csvread('C:\Users\酒仙桥科研巨擘专用\Desktop\123.csv');
% 首先对csv中的数据进行处理。对应的时间按照公式取差值，乘84600转换为‘秒’的格式
% 然后将单元格格式设置为数值，保留小数点后的最大精度(大概是10的负14次方)，得出的一组数据放入shijian矩阵中。
% 根据fengzhi矩阵中的不同数据类型位置确定对应关系作图，以此类推。下同。
plot(shijian(2:end,1),fengzhi(2:end,1));% 时间-峰值1 
%从第二行的时间数据开始执行。由于第一行的数据是开始采集的时间点，无时间差概念，即时间差为0。下同。
xlabel('时间推移(s)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r'); 
ylabel('峰值频率1(MHz)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r'); 
hold on % 画分析图时执行这行代码，下同。
plot(shijian(:,1),fengzhi(:,2));% 时间-峰值2
xlabel('时间推移(s)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r'); 
ylabel('峰值频率2(MHz)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r'); 
legend('峰值1','峰值2')% 画分析图的时候执行此行代码，下同。
plot(shijian(:,1),fengzhi(:,3));% 时间-频率差值
xlabel('时间推移(s)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r'); 
ylabel('频率差值(Hz)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r'); 


shijian=csvread('C:\Users\酒仙桥科研巨擘专用\Desktop\1231.csv');
scatter(shijian(:,1),fengzhi(:,1));%时间-峰值1
xlabel('时间差(s)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r'); 
ylabel('峰值频率1(MHz)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r'); 
hold on;
scatter(shijian(:,1),fengzhi(:,2));%时间-峰值2
xlabel('时间差(s)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r'); 
ylabel('峰值频率2(MHz)','fontname','微软雅黑','fontsize',14,'FontWeight','bold','Color','r'); 






