clear all
clc

x=-10:0.01:10;
y= ones(size(x));
for i=1:5
    z(i,:)=i*sin(i*x);
end
hold on;


for i =1:5
    plot3(x,i*y,z(i,:))
end
% plot3(x,y,z1);hold on;
% plot3(x,y,z2);
% plot3(x,y,z3);
% plot3(x,y,z4);
xlabel('x');
ylabel('y');
zlabel('z');




