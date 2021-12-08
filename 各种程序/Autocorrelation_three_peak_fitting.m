function [fitresult, gof] = createFit(x, y)
clear;close all;clc
data_in=csvread('ACF_2021_Sep_06_04_27_35PM.csv');%设置文件名，后续改成循环
x=data_in(:,1);
y=data_in(:,2);
%% Fit 图1
[xData, yData] = prepareCurveData( x, y );

ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.Normalize = 'on';
opts.SmoothingParam = 0.999299359378264;%数值越小越光滑，越大越接近原始数据，不超过1
[fitresult, gof] = fit( xData, yData, ft, opts );
figure( 'Name', 'tu1' );
h = plot( fitresult, xData, yData );
legend( h, 'exp.data', 'fit curve', 'Location', 'NorthEast', 'Interpreter', 'none' );
xlabel( 'x', 'Interpreter', 'none' );
ylabel( 'y', 'Interpreter', 'none' );
grid on

%%最后再加一段保存图的代码


