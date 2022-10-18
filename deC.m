%%德卡斯特里奥算法列子
%t取特定值时
function deC
% px=[0,1,2,3];
% py=[0,4,1,5];                             %控制顶点(0,0),(1,4),(2,1),(3,5)
% M=100;                                     %将[0,1]区间M等分
px=[1 10 10 1];
py=[1 4 7 10];
M=100;
hx = 1/M;                                  %每个小区间长度
n=length(px)-1;
xx=[];yy=[];
for x = 0:hx:1
    xx1 = px';
    yy1 = py';
    for i = 1:n
        M(i,i) = 1-x;
        M(i,i+1) = x;                             %生成迭代矩阵
    end
    for i = 1:n
        M = M(1:n+1-i,1:n+2-i);
        xx1 = M*xx1;
        yy1 = M*yy1;
    end
     xx(end+1)=xx1(1);                     %xx存储曲线的横坐标
     yy(end+1)=yy1(1);                     %yy存储曲线的纵坐标
end
plot(xx,yy,px,py,px,py,'b*');
hold on;
%以下是当x = 0.3时的具体实现
xx1 = px';
yy1 = py';
x = 1/3;
for i = 1:n
    M(i,i) = 1-x;
    M(i,i+1) = x;
end
for i = 1:n
    M = M(1:n+1-i,1:n+2-i);
    xx1 = M*xx1
    yy1 = M*yy1
    plot(xx1,yy1,xx1,yy1,'o');hold on  %将每一步得到的结果画出来
end
