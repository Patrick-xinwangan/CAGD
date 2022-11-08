 function result = BaseFunction(i,k,u,NodeVector)
  % 计算基函数Ni,k(u),NodeVector为节点向量 
  if k == 0       % 0次B样条
      if (u >= NodeVector(i+1)) && (u < NodeVector(i+2))
          result = 1.0;
      else
          result = 0.0;
      end
 else
     Length1 = NodeVector(i+k+1) - NodeVector(i+1);
     Length2 = NodeVector(i+k+2) - NodeVector(i+2);      % 支撑区间的长度
     if Length1 == 0.0       % 规定0/0 = 0
         Length1 = 1.0;
     end
     if Length2 == 0.0
         Length2 = 1.0;
     end
     result = (u - NodeVector(i+1)) / Length1 * BaseFunction(i, k-1, u, NodeVector) ...
         + (NodeVector(i+k+2) - u) / Length2 * BaseFunction(i+1, k-1, u, NodeVector);
  end

%   clc
% clear
% xx=[6.852,5.934,5.317,4.617,3.924,3.232,2.525,1.882,0.999];
% yy=[1.399,1.399,1.226,0.859,0.212,0.339,-0.657,-0.892,-0.892];
% xx=[xx(1)-xx(2)+xx(1),xx,xx(end)-xx(end-1)+xx(end)];
% yy=[yy(1)-yy(2)+yy(1),yy,yy(end)-yy(end-1)+yy(end)];
% hg=[];
% for i=1:8
% t=(0:0.001:1);
% x0=xx(i);x1=xx(i+1);x2=xx(i+2);x3=xx(i+3);
% y0=yy(i);y1=yy(i+1);y2=yy(i+2);y3=yy(i+3);
% a0=(x0+4*x1+x2)/6;a1=-(x0-x2)/2;a2=(x0-2*x1+x2)/2;a3=-(x0-3*x1+3*x2-x3)/6;
% b0=(y0+4*y1+y2)/6;b1=-(y0-y2)/2;b2=(y0-2*y1+y2)/2;b3=-(y0-3*y1+3*y2-y3)/6;
% x=a0+a1*t+a2*t.^2+a3*t.^3;
% y=b0+b1*t+b2*t.^2+b3*t.^3;
% hg=[hg;a0,a1,a2,a3;b0,b1,b2,b3];%hg为x和y拟合的系数，16行，
% %第1，2行分别为第一段x，y的系数，3，4为第二段，类推
% plot(x,y)
% hold on
% plot([xx(i+1),xx(i+2)],[yy(i+1),yy(i+2)])
% hold on
% end
