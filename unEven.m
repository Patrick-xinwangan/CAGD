function NodeVector = unEven(n,k)
%% 准均匀B样条曲线节点向量计算。传入的n从0开始，所以共n+1个控制顶点。k阶曲线为k-1次。节点向量个数为n+1+k+1=n+k+2
NodeVector=zeros(1,n+k+2);
piecewise=n-k+1;     %曲线段数
if piecewise == 1    %只有一条曲线时 n=k
    for i=k+2 : n+k+2
        NodeVector(1,i)=1;
    end
else   %不止一条曲线
    flag=1;
    while flag ~= piecewise
        NodeVector(1,k+flag+1) = NodeVector(1,k+flag) + 1 /piecewise;
        flag=flag+1;
    end
    NodeVector(1,n+2:n+k+2)=1;       %节点向量前面和后面各有k+1个重复值 前面是K个0 后面是K个1
 
end
 