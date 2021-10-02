x = 0:0.1:20;
y1 = 200*exp(-0.05*x).*sin(x);
y2 = 0.8*exp(-0.5*x).*sin(10*x);
y3 = 8*exp(-0.5*x).*sin(10*x);
[ax h1 h2 h3]=plotyy(x,y1,x,y2,x,y3,'scatter');
set(get(ax(1),'Ylabel'),'String','Slow Decay') 
set(get(ax(2),'Ylabel'),'String','Fast Decay') 
h1.Marker='o';
h1.MarkerEdgeColor= 'none';
h1.MarkerFaceColor= [0 1 0];
h2.Marker='d';
h2.MarkerEdgeColor= 'none';
h2.MarkerFaceColor=[1 0 0]
