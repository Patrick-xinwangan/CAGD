%一堆三角形绘制
function tritritri
% @author:slandarer
hold on,axis equal
axis([-10,10,-10,10])
set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w')
set(gca,'color','w')

for N=1:5
    drawTri([0,0],[cos(pi/2+2*N*pi/5),sin(pi/2+2*N*pi/5)].*5,...
        [cos(pi/2+pi/5+2*N*pi/5),sin(pi/2+pi/5+2*N*pi/5)].*5,10)
    drawTri([0,0],[cos(pi/2+2*N*pi/5),sin(pi/2+2*N*pi/5)].*5,...
        [cos(pi/2-pi/5+2*N*pi/5),sin(pi/2-pi/5+2*N*pi/5)].*5,10)
end
L5=5/sin(pi/2-pi/10)*sin(pi/5);
L5s=(5+L5)/sin(3*pi/10)*sin(3*pi/5);
for N=1:5
    drawPent([cos(pi/2+2*N*pi/5),sin(pi/2+2*N*pi/5)].*5,...
        [cos(pi/2+2*N*pi/5),sin(pi/2+2*N*pi/5)].*(5+L5),...
        [cos(pi/2+pi/10+2*N*pi/5),sin(pi/2+pi/10+2*N*pi/5)].*L5s,...
        [cos(pi/2+pi/5+2*N*pi/5),sin(pi/2+pi/5+2*N*pi/5)].*(5+L5),...
        [cos(pi/2+pi/5+2*N*pi/5),sin(pi/2+pi/5+2*N*pi/5)].*5,15)
    drawPent([cos(pi/2+2*N*pi/5),sin(pi/2+2*N*pi/5)].*5,...
        [cos(pi/2+2*N*pi/5),sin(pi/2+2*N*pi/5)].*(5+L5),...
        [cos(pi/2-pi/10+2*N*pi/5),sin(pi/2-pi/10+2*N*pi/5)].*L5s,...
        [cos(pi/2-pi/5+2*N*pi/5),sin(pi/2-pi/5+2*N*pi/5)].*(5+L5),...
        [cos(pi/2-pi/5+2*N*pi/5),sin(pi/2-pi/5+2*N*pi/5)].*5,15)
end

% 功能函数=================================================================
    function drawTri(A,B,C,times)
        LW=1.2;
        COLOR=[0 0 0];
        k=1/6;
        k2=0.8;
        plot([A(1);B(1)],[A(2);B(2)],'color',COLOR,'Linewidth',LW)
        plot([B(1);C(1)],[B(2);C(2)],'color',COLOR,'Linewidth',LW)
        plot([C(1);A(1)],[C(2);A(2)],'color',COLOR,'Linewidth',LW)
        for i=1:times
            b=k*(C-B)+B;plot([A(1);b(1)],[A(2);b(2)],'color',COLOR,'Linewidth',LW);B=b;
            pause(0.01)
            c=k*(A-C)+C;plot([B(1);c(1)],[B(2);c(2)],'color',COLOR,'Linewidth',LW);C=c;
            pause(0.01)
            a=k*(B-A)+A;plot([C(1);a(1)],[C(2);a(2)],'color',COLOR,'Linewidth',LW);A=a;
            pause(0.01)
            LW=LW*k2;
        end
    end
    function drawPent(A,B,C,D,E,times)
        LW=1.2;
        COLOR=[0 0 0];
        k=1/4;
        k2=0.9;
        plot([A(1);B(1)],[A(2);B(2)],'color',COLOR,'Linewidth',LW)
        plot([B(1);C(1)],[B(2);C(2)],'color',COLOR,'Linewidth',LW)
        plot([C(1);D(1)],[C(2);D(2)],'color',COLOR,'Linewidth',LW)
        plot([D(1);E(1)],[D(2);E(2)],'color',COLOR,'Linewidth',LW)
        plot([E(1);A(1)],[E(2);A(2)],'color',COLOR,'Linewidth',LW)
        for i=1:times
            b=k*(C-B)+B;plot([A(1);b(1)],[A(2);b(2)],'color',COLOR,'Linewidth',LW);B=b;
            pause(0.01)
            c=k*(D-C)+C;plot([B(1);c(1)],[B(2);c(2)],'color',COLOR,'Linewidth',LW);C=c;
            pause(0.01)
            d=k*(E-D)+D;plot([C(1);d(1)],[C(2);d(2)],'color',COLOR,'Linewidth',LW);D=d;
            pause(0.01)
            e=k*(A-E)+E;plot([D(1);e(1)],[D(2);e(2)],'color',COLOR,'Linewidth',LW);E=e;
            pause(0.01)
            a=k*(B-A)+A;plot([E(1);a(1)],[E(2);a(2)],'color',COLOR,'Linewidth',LW);A=a;
            pause(0.01)
            LW=LW*k2;
        end
    end
end