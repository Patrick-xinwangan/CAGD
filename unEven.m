function NodeVector = unEven(n,k)
%% ׼����B�������߽ڵ��������㡣�����n��0��ʼ�����Թ�n+1�����ƶ��㡣k������Ϊk-1�Ρ��ڵ���������Ϊn+1+k+1=n+k+2
NodeVector=zeros(1,n+k+2);
piecewise=n-k+1;     %���߶���
if piecewise == 1    %ֻ��һ������ʱ n=k
    for i=k+2 : n+k+2
        NodeVector(1,i)=1;
    end
else   %��ֹһ������
    flag=1;
    while flag ~= piecewise
        NodeVector(1,k+flag+1) = NodeVector(1,k+flag) + 1 /piecewise;
        flag=flag+1;
    end
    NodeVector(1,n+2:n+k+2)=1;       %�ڵ�����ǰ��ͺ������k+1���ظ�ֵ ǰ����K��0 ������K��1
 
end
 