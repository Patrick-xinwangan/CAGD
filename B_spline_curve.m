function B_spline_curve
%% ����B��������
clc;
clear;
close all;
 
%% ���ݶ���
road_width=3.5;
% 6�����Ƶ� 
P=[0 10 25 25 40 50;
    -road_width/2 -road_width/2 -road_width/2+0.5 road_width/2-0.5 road_width/2 road_width/2];
% ��0��ʼ�� 6�����Ƶ� n=5
n=size(P,2)-1;
% K�� Ҳ����K-1��B����
k=4;
path=[];
Bik=zeros(n+1,1);
flag=2;
%% ׼����B����
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
    %% ����B����
    NodeVector=linspace(0,1,n+k+1);
    for u=(k-1)/(n+k+1):0.001:(n+2)/(n+k+1)
        for i=0:1:n
            Bik(i+1,1)=BaseFunction(i,k-1,u,NodeVector);
        end
        p_u=P*Bik;
        path=[path;[p_u(1,1),p_u(2,1)]];
    end
end
%% ��ͼ
% ���� ���� ·��
car_width=1.8;
car_length=4.5;
road_length=50;
%��ɫ·���������� ��� ����λ�����
Road_zone=[-5 -road_width-0.5;
           -5 road_width+0.5;
           road_length road_width+0.5;
           road_length -road_width-0.5];
fill(Road_zone(:,1),Road_zone(:,2),[0.5 0.5 0.5]);
hold on
fill([0 0 -car_length -car_length],...
[-road_width/2-car_width/2 -road_width/2+car_width/2 ...
-road_width/2+car_width/2 -road_width/2-car_width/2],'b')
 
% ���Ƶ�·�м����� ����ʵ��
plot([-5 road_length],[0 0],'w--','linewidth',2);
plot([-5 road_length],[road_width,road_width],'w','linewidth',2);
plot([-5 road_length],[-road_width,-road_width],'w','linewidth',2);
 
% �������곤������
axis equal
set(gca,'XLim',[-5,road_length]);
set(gca,'YLim',[-road_width-0.5,road_width+0.5]);
 
scatter(path(:,1),path(:,2),'.b');%����·��ɢ��
scatter(P(1,:),P(2,:),'g');
plot(P(1,:),P(2,:),'r');