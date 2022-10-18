function BQR
% b=ginput(8);b=b';
b=[0 1 2 3 4 5;
   0 4 4 2 5 0];
% b=fliplr(b);
b=flipud(b);
n=size(b,2)-1;
t=linspace(0,1,100);
P=b*T(n,t);
% plot(b(1,:),b(2,:),'s-b','LineWidth',2)
plot(b(1,:),b(2,:),'o-k','LineWidth',2)
hold on
% plot(P(1,:),P(2,:),'og','LineWidth',1)
plot(P(1,:),P(2,:),'-r','LineWidth',2)
% hold off 

function y=T(n,t)
y=zeros(n+1,length(t));
for i=0:n
    y(i+1,:)=nchoosek(n,i)*(1-t).^(n-i).*t.^i;
end