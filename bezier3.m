function [X,Y,Z]=bezier3(x,y,z)
n=length(x);
t=linspace(0,1);
xx=0;yy=0;zz=0;
for k=0:n-1
tmp=nchoosek(n-1,k)*t.^k.*(1-t).^(n-1-k);
xx=xx+tmp*x(k+1);
yy=yy+tmp*y(k+1);
zz=zz+tmp*z(k+1);
end
h=plot3(xx,yy,zz,'r');
if nargout==2
X=xx;Y=yy;Z=zz;
end
if nargout==1
X=h;
end 
% for i=1:19                          
%     x0(i)=5*cos((i-1)*pi/3);
%     y0(i)=5*sin((i-1)*pi/3);
%     z0(i)=(i-1)*pi/3;
% end
% n=length(x0);
% plot3(x0,y0,z0,'b-o')
% hold on;
% bezier3(x0,y0,z0);