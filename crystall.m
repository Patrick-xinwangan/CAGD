function crystall

hold on
for i=1:50
    len=rand(1)*8+5;
    tempV=rand(1,3)-0.5;
    tempV(3)=abs(tempV(3));
    tempV=tempV./norm(tempV).*len;
    tempEpnt=tempV;
    drawCrystal([0 0 0],tempEpnt,pi/6,0.8,0.1,rand(1).*0.2+0.2)
%     disp(i)

end

ax=gca;
ax.XLim=[-15,15];
ax.YLim=[-15,15];
ax.ZLim=[-2,15];
grid on
ax.GridLineStyle='--';
ax.LineWidth=1.2;
ax.XColor=[1,1,1].*0.4;
ax.YColor=[1,1,1].*0.4;
ax.ZColor=[1,1,1].*0.4;
ax.DataAspectRatio=[1,1,1];
ax.DataAspectRatioMode='manual';
ax.CameraPosition=[-67.6287 -204.5276   82.7879];

    function drawCrystal(Spnt,Epnt,theta,cl,w,alpha)
       %plot3([Spnt(1),Epnt(1)],[Spnt(2),Epnt(2)],[Spnt(3),Epnt(3)])
       mainV=Epnt-Spnt;
       cutPnt=cl.*(mainV)+Spnt;
       cutV=[mainV(3),mainV(3),-mainV(1)-mainV(2)];
       cutV=cutV./norm(cutV).*w.*norm(mainV);
       cornerPnt=cutPnt+cutV;
       cornerPnt=rotateAxis(Spnt,Epnt,cornerPnt,theta);
       cornerPntSet(1,:)=cornerPnt';
       for ii=1:3
           cornerPnt=rotateAxis(Spnt,Epnt,cornerPnt,pi/2);
           cornerPntSet(ii+1,:)=cornerPnt';
       end
       F = [1,3,4;1,4,5;1,5,6;1,6,3;...
           2,3,4;2,4,5;2,5,6;2,6,3];
       V = [Spnt;Epnt;cornerPntSet];
       patch('Faces',F,'Vertices',V,'FaceColor',[0 71 177]./255,...
           'FaceAlpha',alpha,'EdgeColor',[0 71 177]./255.*0.8,...
           'EdgeAlpha',0.6,'LineWidth',0.5,'EdgeLighting',...
           'gouraud','SpecularStrength',0.3)
    end

    function newPnt=rotateAxis(Spnt,Epnt,cornerPnt,theta)
        V=Epnt-Spnt;V=V./norm(V);
        u=V(1);v=V(2);w=V(3);
        a=Spnt(1);b=Spnt(2);c=Spnt(3);
        cornerPnt=[cornerPnt(:);1];
        
        rotateMat=[u^2+(v^2+w^2)*cos(theta)       ,  u*v*(1-cos(theta))-w*sin(theta),  u*w*(1-cos(theta))+v*sin(theta),  (a*(v^2+w^2)-u*(b*v+c*w))*(1-cos(theta))+(b*w-c*v)*sin(theta);
                   u*v*(1-cos(theta))+w*sin(theta),  v^2+(u^2+w^2)*cos(theta)       ,  v*w*(1-cos(theta))-u*sin(theta),  (b*(u^2+w^2)-v*(a*u+c*w))*(1-cos(theta))+(c*u-a*w)*sin(theta);
                   u*w*(1-cos(theta))-v*sin(theta),  v*w*(1-cos(theta))+u*sin(theta),  w^2+(u^2+v^2)*cos(theta)       ,  (c*(u^2+v^2)-w*(a*u+b*v))*(1-cos(theta))+(a*v-b*u)*sin(theta);
                   0                              ,  0                              ,  0                              ,  1];
        
        newPnt=rotateMat*cornerPnt;
        newPnt(4)=[];
    end

end