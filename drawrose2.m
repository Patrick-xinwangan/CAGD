function drawrose2
grid on
[x,t]=meshgrid((0:24)./24,(0:0.5:575)./575.*20.*pi-4*pi);
p=(pi/2)*exp(-t./(8*pi));
change=sin(20*t)/150;
u=1-(1-mod(3.3*t,2*pi)./pi).^4./2+change;
y=2*(x.^2-x).^2.*sin(p);

r=u.*(x.*sin(p)+y.*cos(p)).*1.5;
h=u.*(x.*cos(p)-y.*sin(p));

map=[0.9176    0.7490    0.3765
    0.9188    0.7513    0.3879
    0.9200    0.7537    0.3992
    0.9211    0.7560    0.4106
    0.9223    0.7584    0.4220
    0.9235    0.7608    0.4334
    0.9247    0.7631    0.4447
    0.9259    0.7654    0.4561
    0.9270    0.7678    0.4675
    0.9282    0.7702    0.4788
    0.9294    0.7725    0.4902
    0.9298    0.7698    0.5008
    0.9302    0.7670    0.5114
    0.9306    0.7643    0.5220
    0.9310    0.7615    0.5326
    0.9314    0.7588    0.5432
    0.9317    0.7561    0.5537
    0.9321    0.7533    0.5643
    0.9325    0.7506    0.5749
    0.9329    0.7478    0.5855
    0.9333    0.7451    0.5961
    0.9290    0.7404    0.5894
    0.9247    0.7357    0.5828
    0.9204    0.7310    0.5761
    0.9161    0.7263    0.5694
    0.9118    0.7215    0.5627
    0.9074    0.7168    0.5561
    0.9031    0.7121    0.5494
    0.8988    0.7074    0.5427
    0.8945    0.7027    0.5361
    0.8902    0.6980    0.5294
    0.8890    0.6976    0.5388
    0.8878    0.6972    0.5482
    0.8867    0.6968    0.5576
    0.8855    0.6964    0.5670
    0.8843    0.6961    0.5765
    0.8831    0.6957    0.5859
    0.8819    0.6953    0.5953
    0.8808    0.6949    0.6047
    0.8796    0.6945    0.6141
    0.8784    0.6941    0.6235
    0.8827    0.6988    0.6364
    0.8870    0.7035    0.6494
    0.8914    0.7082    0.6623
    0.8957    0.7129    0.6753
    0.9000    0.7177    0.6882
    0.9043    0.7224    0.7011
    0.9086    0.7271    0.7141
    0.9130    0.7318    0.7270
    0.9173    0.7365    0.7400
    0.9216    0.7412    0.7529
    0.9153    0.7275    0.7545
    0.9090    0.7137    0.7560
    0.9028    0.7000    0.7576
    0.8965    0.6863    0.7592
    0.8902    0.6725    0.7608
    0.8839    0.6588    0.7623
    0.8776    0.6451    0.7639
    0.8714    0.6314    0.7655
    0.8651    0.6176    0.7670
    0.8588    0.6039    0.7686
    0.8580    0.5906    0.7557
    0.8572    0.5772    0.7427
    0.8565    0.5639    0.7298
    0.8557    0.5506    0.7168
    0.8549    0.5373    0.7039
    0.8541    0.5239    0.6910
    0.8533    0.5106    0.6780
    0.8526    0.4973    0.6651
    0.8518    0.4839    0.6521
    0.8510    0.4706    0.6392
    0.8420    0.4447    0.6110
    0.8330    0.4188    0.5827
    0.8239    0.3930    0.5545
    0.8149    0.3671    0.5263
    0.8059    0.3412    0.4980
    0.7969    0.3153    0.4698
    0.7879    0.2894    0.4416
    0.7788    0.2636    0.4134
    0.7698    0.2377    0.3851
    0.7608    0.2118    0.3569];
set(gca,'CameraPosition',[2 2 2])
hold on
Xset=r.*cos(t);Yset=r.*sin(t);
sf=surface(Xset,Yset,h,'EdgeAlpha',0.1,...
    'EdgeColor',[0.5 0.5 0.5],'FaceColor','interp');
colormap(map)


theta=0;
while 1
    theta=theta+0.02;
    set(sf,'XData',Xset.*cos(theta)-Yset.*sin(theta),...
        'YData',Xset.*sin(theta)+Yset.*cos(theta))
    pause(0.01)
end


end
