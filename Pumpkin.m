% 构造网格
[t,p]=meshgrid(linspace(0,2*pi,200),linspace(0,pi-.05,200));
% 二元分段函数
foutline=@(t,p)(p<=.14).*90.*cos(7.*p)+(p>.14).*(cos(20.*t)+70).*(p.*(pi-p+.1)).^.2;

% 球面坐标转化为X,Y,Z
h=cos(p).*foutline(t,p);
R=sin(p).*foutline(t,p);
R=R;
X=cos(t).*R;
Y=sin(t).*R;

% 颜色矩阵构造
CMap=ones([size(t),3]);
tMap=ones(size(t));
c1=[253,158,3]./255;
c2=[76,103,86]./255;
for i=1:3
    tMap(:,:)=c1(i);
    tMap(p<=.14)=c2(i);
    CMap(:,:,i)=tMap;
end

figure()
surf(X,Y,h,'CData',CMap,'EdgeColor',[0,0,0],'EdgeAlpha',.2)