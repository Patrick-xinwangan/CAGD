%%�¿�˹������㷨����
%tȡ�ض�ֵʱ
function deC
% px=[0,1,2,3];
% py=[0,4,1,5];                             %���ƶ���(0,0),(1,4),(2,1),(3,5)
% M=100;                                     %��[0,1]����M�ȷ�
px=[1 10 10 1];
py=[1 4 7 10];
M=100;
hx = 1/M;                                  %ÿ��С���䳤��
n=length(px)-1;
xx=[];yy=[];
for x = 0:hx:1
    xx1 = px';
    yy1 = py';
    for i = 1:n
        M(i,i) = 1-x;
        M(i,i+1) = x;                             %���ɵ�������
    end
    for i = 1:n
        M = M(1:n+1-i,1:n+2-i);
        xx1 = M*xx1;
        yy1 = M*yy1;
    end
     xx(end+1)=xx1(1);                     %xx�洢���ߵĺ�����
     yy(end+1)=yy1(1);                     %yy�洢���ߵ�������
end
plot(xx,yy,px,py,px,py,'b*');
hold on;
%�����ǵ�x = 0.3ʱ�ľ���ʵ��
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
    plot(xx1,yy1,xx1,yy1,'o');hold on  %��ÿһ���õ��Ľ��������
end
