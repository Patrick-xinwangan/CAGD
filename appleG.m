%%Æ»¹û»æÖÆ
function appleG

[u,v]=meshgrid(linspace(-pi,pi,100));

XMesh=(1+cos(v)).*cos(u)+0.085.*cos(5.*u)+(0.994.*v./pi).^100;
YMesh=(1+cos(v)).*sin(u);
ZMesh=(6.*sin(v)+2.*cos(v)-2.9.*log(1-v./pi))./4.2;

ax=gca;
ax.DataAspectRatio=[1 1 1];
hold on;grid on
surf(XMesh,YMesh,ZMesh,'FaceColor',[140,192,30]./255,'EdgeColor','none')
view(45,25)

h=light;
h.Color=[1 1 1];
h.Style='infinite';
end