x=0.1:1/22:1;
c1=1.73367;
sigma1=0.18;
c2=0.11;
sigma2=0.18;
w0=rand(1);
w1=rand(1);
w2=rand(1);

d=(1+0.6*sin(2*pi*x/0.7))+(0.3*sin(2*pi*x))/2;

n=0.75;
for j=1:100000
for i=1:20

    F1=exp(-(x(i)-c1)^2/(2*sigma1^2));
    F2=exp(-(x(i)-c2)^2/(2*sigma2^2));
    
    y=F1*w1+F2*w2+w0;
    e = d(i)-y;

    w0 = w0+n*e;
    w1 = w1+n*e*F1;
    w2 = w2+n*e*F2;

     y=F1*w1+F2*w2+w0;
     Y(i)=y;
end
end

plot(x,d,'ro',x,Y,'g.')