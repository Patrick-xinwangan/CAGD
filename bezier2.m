function [X,Y]=bezier2(x,y)
%�÷���
%bezier(x,y)
% ����n-1�α���������,����x��y��n���������
%h=bezier(x,y)
% ����n-1�α��������߲��������߾��
%[X,Y]=bezier(x,y)
% ����n-1�α��������ߵ�����
%���ӣ�
%bezier([5,6,10,12],[0 5 -5 -2])
n=length(x);
t=linspace(0,1);
xx=0;yy=0;
for k=0:n-1
tmp=nchoosek(n-1,k)*t.^k.*(1-t).^(n-1-k);
xx=xx+tmp*x(k+1);
yy=yy+tmp*y(k+1);
end
h=plot(xx,yy);
if nargout==2
X=xx;Y=yy;
end
if nargout==1
X=h;
end 

% for i=1:11                          
%     x0(i)=cos(-pi/2+(i-1)*2*pi/10);
%     y0(i)=sin(-pi/2+(i-1)*2*pi/10)*cos(-pi/2+(i-1)*2*pi/10);
% end
% n=length(x0);
% plot(x0,y0,'k-*')
% hold on;
% bezier2(x0,y0);
