function drawrose
grid on
[x,t]=meshgrid((0:24)./24,(0:0.5:575)./575.*20.*pi+4*pi);
p=(pi/2)*exp(-t./(8*pi));
change=sin(15*t)/150;
u=1-(1-mod(3.6*t,2*pi)./pi).^4./2+change;
y=2*(x.^2-x).^2.*sin(p);

r=u.*(x.*sin(p)+y.*cos(p));
h=u.*(x.*cos(p)-y.*sin(p));

map=[0.9176    0.9412    1.0000
    0.9094    0.9341    0.9992
    0.9011    0.9271    0.9984
    0.8929    0.9200    0.9977
    0.8847    0.9130    0.9969
    0.8764    0.9059    0.9961
    0.8682    0.8988    0.9953
    0.8600    0.8918    0.9945
    0.8518    0.8847    0.9938
    0.8435    0.8777    0.9930
    0.8353    0.8706    0.9922
    0.8337    0.8698    0.9910
    0.8322    0.8690    0.9898
    0.8306    0.8682    0.9887
    0.8290    0.8674    0.9875
    0.8275    0.8667    0.9863
    0.8259    0.8659    0.9851
    0.8243    0.8651    0.9839
    0.8227    0.8643    0.9828
    0.8212    0.8635    0.9816
    0.8196    0.8627    0.9804
    0.8078    0.8521    0.9765
    0.7961    0.8415    0.9726
    0.7843    0.8310    0.9686
    0.7726    0.8204    0.9647
    0.7608    0.8098    0.9608
    0.7490    0.7992    0.9569
    0.7373    0.7886    0.9530
    0.7255    0.7781    0.9490
    0.7138    0.7675    0.9451
    0.7020    0.7569    0.9412
    0.6836    0.7400    0.9396
    0.6651    0.7232    0.9381
    0.6467    0.7063    0.9365
    0.6282    0.6894    0.9349
    0.6098    0.6725    0.9334
    0.5914    0.6557    0.9318
    0.5729    0.6388    0.9302
    0.5545    0.6219    0.9286
    0.5360    0.6051    0.9271
    0.5176    0.5882    0.9255
    0.5027    0.5776    0.9271
    0.4878    0.5670    0.9286
    0.4729    0.5565    0.9302
    0.4580    0.5459    0.9318
    0.4431    0.5353    0.9334
    0.4282    0.5247    0.9349
    0.4133    0.5141    0.9365
    0.3984    0.5036    0.9381
    0.3835    0.4930    0.9396
    0.3686    0.4824    0.9412
    0.3623    0.4742    0.9404
    0.3561    0.4659    0.9396
    0.3498    0.4577    0.9388
    0.3435    0.4494    0.9380
    0.3372    0.4412    0.9373
    0.3310    0.4330    0.9365
    0.3247    0.4247    0.9357
    0.3184    0.4165    0.9349
    0.3122    0.4082    0.9341
    0.3059    0.4000    0.9333
    0.2981    0.3918    0.9235
    0.2902    0.3835    0.9137
    0.2824    0.3753    0.9039
    0.2745    0.3670    0.8941
    0.2667    0.3588    0.8843
    0.2589    0.3506    0.8745
    0.2510    0.3423    0.8647
    0.2432    0.3341    0.8549
    0.2353    0.3258    0.8451
    0.2275    0.3176    0.8353
    0.2169    0.3086    0.8165
    0.2063    0.2996    0.7977
    0.1957    0.2906    0.7788
    0.1851    0.2816    0.7600
    0.1746    0.2726    0.7412
    0.1640    0.2635    0.7224
    0.1534    0.2545    0.7036
    0.1428    0.2455    0.6847
    0.1322    0.2365    0.6659
    0.1216    0.2275    0.6471];
set(gca,'CameraPosition',[2 2 2])
hold on
surface(r.*cos(t),r.*sin(t),h,'EdgeAlpha',0.1,...
    'EdgeColor',[0 0 0],'FaceColor','interp')
colormap(map)

end
