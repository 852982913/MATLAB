clear all
clc
Data=xlsread('Trace_0027.csv');
x=Data(:,1);
y=Data(:,2);
plot(x,y)