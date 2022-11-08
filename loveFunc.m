%%心形线
function loveFunc
% @author:slandarer
LoveFunchdl=@(x,a)(x.^2).^(1/3)+0.9.*((3.3-x.^2).^(1/2)).*sin(a.*pi.*x);
hold on
grid on
axis([-3 3,-2 4])
x=-1.8:0.01:1.8;
text(0,3.3,'$f(x)=x^{\frac{2}{3}}+0.9(3.3-x^2)^{\frac{1}{2}}\sin(\alpha\pi x)$',...
    'FontSize',13,'HorizontalAlignment','center','Interpreter','latex');
txt2=text(-0.35,2.9,'','FontSize',13,'HorizontalAlignment','left','Interpreter','latex','tag','alphadata');
hdl=plot(x,LoveFunchdl(x,1),'color',[0.2118 0.4667 0.9961],'LineWidth',1.5);

for a=1:0.01:20
    AlphaString=['$\alpha=',num2str(a),'$'];
    Color=([1.0000 0.4902 0.6627]-[0.2118 0.4667 0.9961]).*(a/20)+[0.2118 0.4667 0.9961];
    set(txt2,'string',AlphaString)
    hdl.YData=LoveFunchdl(x,a);
    hdl.Color=Color;
    drawnow
end
end
%%有理曲线
% [x,y]=meshgrid(-10:.01:10,-10:.01:10);
% cm=cos(cos(min(sin(x)+y,x+sin(y))))-cos(sin(max(sin(y)+x,y+sin(x))))>0;
% imshow(cm)

%%蝴蝶曲线
% x=linspace(0,2*pi,1000);
% hdl=polarplot(x,sin(x)+sin(3.5.*x).^3,'LineWidth',1.5);
% ax=gca;
% ax.RTick=[];

%%有趣曲线1
% 鱼形曲线
% hold on
% axis equal
% grid on
% X=0:1:1023;
% Y=0:1:1023;
% [gridX,gridY]=meshgrid(X,Y);
% FishPatternFcn=@(x,y)mod(abs(x.*sin(sqrt(x))+y.*sin(sqrt(y))).*pi./1024,1);
% contour(gridX,gridY,FishPatternFcn(gridX,gridY),[0.7,0.7])

%%有趣曲线2
% % 生成一个40x40 DFT矩阵
% % 并在复平面将点连接起来
% plot(fft(eye(40)));
% axis equal