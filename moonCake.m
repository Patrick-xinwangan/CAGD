%ÔÂ±ýµÄ»æÖÆ
function moonCake
% @author:slandarer
ax=gca;
hold(ax,'on');
axis equal
ax.XLim=[-15,15];
ax.YLim=[-15,15];
CSet=[0.92 0.51 0.11;1 0.7 0.09;0.87 0.41 0.05];
% CSet1=[0.92 0.51 0.11;1 0.7 0.09;0.87 0.41 0.05];
% CSet2=[0.43 0.68 0.44;0.62 0.8 0.44;0.28 0.47 0.28];
% CSet3=[0.44 0.25 0.38;0.54 0.37 0.51;0.23 0.16 0.21];
% CSet4=[0.94 0.83 0.55;0.98 0.89 0.68;0.83 0.67 0.4];
% CSet5=[0.79 0.46 0.44;0.9 0.61 0.58;0.73 0.38 0.38];
% CSet6=[0.89 0.7 0.23;0.97 0.85 0.37;0.91 0.68 0.2];
% CSet7=[0.54 0.38 0.27;0.64 0.42 0.27;0.25 0.1 0.03];
% CSet8=[ 0.62 0.53 0.6;0.7 0.7 0.81;0.44 0.39 0.45];
% CSet9=[0.73 0.78 0.65;0.75 0.84 0.77;0.59 0.58 0.48];

for i=[1:7,9,8]
    if i==1
        tt=linspace(0,-pi/16,100);
    elseif i==9
        tt=linspace(-pi+pi/16,-pi,100);
    else
        tt=linspace(-pi/16-(i-2)*pi/8,-pi/16-(i-1)*pi/8,100);
    end
    xSet=cos(tt).*(10+abs(cos(tt.*8)));
    xMin=find(xSet==min(xSet));tt(xMin)
    xMax=find(xSet==max(xSet));
    t1=min([xMin(1),xMax(1)]);
    t2=max([xMin(1),xMax(1)]);
    xSet=cos(tt(t1:t2)).*(10+abs(cos(tt(t1:t2).*8)));
    ySet=sin(tt(t1:t2)).*(10+abs(cos(tt(t1:t2).*8)))-3;
    fill([xSet(1),xSet,xSet(end)],[ySet(1)+3,ySet,ySet(end)+3],CSet(mod(i,2)+1,:),'EdgeColor','none')
    
    
end
t=linspace(0,2*pi,640);
fill(cos(t).*(10+abs(cos(t.*8))),sin(t).*(10+abs(cos(t.*8))),CSet(1,:),'EdgeColor','none')
plot(cos(t).*(9+abs(cos(t.*8))),sin(t).*(9+abs(cos(t.*8)))-0.3,'Color',CSet(3,:),'LineWidth',6)
plot(cos(t).*8.7,sin(t).*8.7-0.3,'Color',CSet(3,:),'LineWidth',4)
plot(cos(t).*(9+abs(cos(t.*8))),sin(t).*(9+abs(cos(t.*8))),'Color',CSet(2,:),'LineWidth',6)
plot(cos(t).*8.7,sin(t).*8.7,'Color',CSet(2,:),'LineWidth',4)

plot([0 0],[-7 7]-0.3,'Color',CSet(3,:),'LineWidth',4)
plot([-7 7],[0 0]-0.3,'Color',CSet(3,:),'LineWidth',4)
plot([0 0],[-7 7],'Color',CSet(2,:),'LineWidth',4)
plot([-7 7],[0 0],'Color',CSet(2,:),'LineWidth',4)

t4=linspace(0,pi/2,100);
xSet4=[cos(t4).*6+1,1,6,cos(t4(1:end-12)).*5+1,2,4.8,cos(t4(17:end-40)).*3.9+1];
ySet4=[sin(t4).*6+1,1,1,sin(t4(1:end-12)).*5+1,2,2,sin(t4(17:end-40)).*3.9+1];

plot(xSet4,ySet4-0.3,'Color',CSet(3,:),'LineWidth',4)
plot(-xSet4,ySet4-0.3,'Color',CSet(3,:),'LineWidth',4)
plot(xSet4,-ySet4-0.3,'Color',CSet(3,:),'LineWidth',4)
plot(-xSet4,-ySet4-0.3,'Color',CSet(3,:),'LineWidth',4)
plot(xSet4,ySet4,'Color',CSet(2,:),'LineWidth',4)
plot(-xSet4,ySet4,'Color',CSet(2,:),'LineWidth',4)
plot(xSet4,-ySet4,'Color',CSet(2,:),'LineWidth',4)
plot(-xSet4,-ySet4,'Color',CSet(2,:),'LineWidth',4)
end