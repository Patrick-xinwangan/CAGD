function   medium(x,y,k)
%% 数据定义
P=[x;
   y];
% 从0开始算 6个控制点 n=5
n=size(P,2)-1;
% K阶 也就是K-1次B样条
path=[];
Bik=zeros(n+1,1);
flag=2;
%% 准均匀B样条
if flag==2
    NodeVector=unEven(n,k-1);
    for u=0:0.005:1-0.005
        for i=0:1:n
           Bik(i+1,1)=BaseFunction(i,k-1,u,NodeVector);
        end
        p_u=P*Bik;
        path=[path;[p_u(1,1),p_u(2,1)]];
    end  
elseif flag==1
    %% 均匀B样条
    NodeVector=linspace(0,1,n+k+1);
    for u=(k-1)/(n+k+1):0.001:(n+2)/(n+k+1)
        for i=0:1:n
            Bik(i+1,1)=BaseFunction(i,k-1,u,NodeVector);
        end
        p_u=P*Bik;
        path=[path;[p_u(1,1),p_u(2,1)]];
    end
end
plot(P(1,:),P(2,:),'r');
hold on 
scatter(path(:,1),path(:,2),'.b');