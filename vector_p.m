% % // An highlighted block
function [p v k]=vector_p(c,f) %反求控制点
n=length(c);%n为路径点个数，c为【时间点,路点】的数组
k=5;%k为次数，因为我写的B样条曲线是5次B样条曲线
v=linspace(0,1,n+2*k);%为节点向量
%%这里为节点向量的公式
for i=1:k+1
   v(i)=0;
end
for i=n+k:n+2*k
   v(i)=f;%f为终止时间
end
for j=k+1:n+k-1
   v(j+1)=v(j)+f/(n-1);
end
%%
u=linspace(0.00000001,f-0.00000001,n);
for i=1:n+k-1
   for j=1:n
   	s(i,j)=BaseFunction(i-1, k , u(j), v);%基函数（de boor-cox递归公式）
    end
end
%速度、加速度边界条件
c(n+1,2)=1;
c(n+1,1)=0;
c(n+2,1)=c(n,1);
c(n+2,2)=cos(c(n,1));
c(n+3,2)=0;
c(n+3,1)=0;
c(n+4,1)=c(n,1);
c(n+4,2)=-sin(c(n,1));
s=s';
s(n+1,1)=-5/(v(7)-v(2));
s(n+1,2)=5/(v(7)-v(2)); 
s(n+2,n+3)=-5/(v(n+9)-v(n+4));
s(n+2,n+4)=5/(v(n+9)-v(n+4));
s(n+3,1)=20/((v(7)-v(3))*(v(7)-v(2)));
s(n+3,2)=-20*(1/((v(7)-v(3))*(v(7)-v(2)))+1/((v(7)-v(3))*(v(8)-v(3))));
s(n+3,3)=20/((v(7)-v(3))*(v(8)-v(3)));
s(n+4,n+2)=20/((v(n+8)-v(n+4))*(v(n+8)-v(n+3)));
s(n+4,n+3)=-20*(1/((v(n+8)-v(n+4))*(v(n+9)-v(n+4)))+1/((v(n+8)-v(n+4))*(v(n+8)-v(n+3))));
s(n+4,n+4)=20/((v(n+8)-v(n+4))*(v(n+9)-v(n+4)));
% f=inv(s);
p=s\c;%控制顶点
end
