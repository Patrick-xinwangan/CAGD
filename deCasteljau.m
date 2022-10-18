%德卡斯特里奥算法
function deCasteljau(P,Q)
%P is 1*n matrix for X
%Q is 1*n matrix for Y
m=size(P);
n=m(2);
x=zeros(1,101);
y=zeros(1,101);
p=zeros(n);
q=zeros(n);
plot(P,Q,'r');
hold on
for i=1:n
p(i,1)=P(i);
q(i,1)=Q(i);
end
k=1;
for t=0:0.01:1
for j=2:n
for i=j:n
p(i,j)=t*p(i,j-1)+(1-t)*p(i-1,j-1);
q(i,j)=t*q(i,j-1)+(1-t)*q(i-1,j-1);
end
end
x(k)=p(n,n);
y(k)=q(n,n);
k=k+1;
end
plot(x,y,'b-');

% 下面是测试数据
% x=[1,2,3];
% y=[3,1,6];
% deCasteljau(x,y)
% x=[1 10 10 1];
% y=[1 4 7 10];