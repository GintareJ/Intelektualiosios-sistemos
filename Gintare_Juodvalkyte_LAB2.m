clear all
x = 0.1:1/22:1;
d = (1+0.6*sin(2*pi*x/0.7)+0.3*sin(2*pi*x))/2;
figure, plot(x,d,'kx');
w_11 = rand(1)*0.1;
w_12 = rand(1)*0.1;
w_13 = rand(1)*0.1;
w_14 = rand(1)*0.1;
w_15 = rand(1)*0.1;
b_11 = rand(1)*0.1;
b_12 = rand(1)*0.1;
b_13 = rand(1)*0.1;
b_14 = rand(1)*0.1;
b_15 = rand(1)*0.1;
w_21 = rand(1)*0.1;
w_22 = rand(1)*0.1;
w_23 = rand(1)*0.1;
w_24 = rand(1)*0.1;
w_25 = rand(1)*0.1;
b_21 = rand(1)*0.1;

for i=1:20
    y_1 = 1/(1+exp(-x(i)*w_11 - b_11));
    y_2 = 1/(1+exp(-x(i)*w_12 - b_12));
    y_3 = 1/(1+exp(-x(i)*w_13 - b_13));
    y_4 = 1/(1+exp(-x(i)*w_14 - b_14));
    y_5 = 1/(1+exp(-x(i)*w_15 - b_15));
    y(i) = y_1*w_21+y_2*w_22+y_3*w_23+y_4*w_24+y_5*w_25+b_21;
    e(i) = d(i) - y(i);
end


n=0.04;

while (max(abs(e)) > 0.25)
for i=1:20
    v1=x(i)*w_11 + b_11;
    v2=x(i)*w_12 + b_12;
    v3=x(i)*w_13 + b_13;
    v4=x(i)*w_14 + b_14;
    v5=x(i)*w_15 + b_15;
    delta1 = (1/(1+exp(-v1)))*(1-1/(1+exp(-v1)))*e(i)*w_21;
    w_11 = w_11+n*delta1*x(i);
    delta2 = (1/(1+exp(-v2)))*(1-1/(1+exp(-v2)))*e(i)*w_22;
    w_12 = w_12+n*delta2*x(i);
    delta3 = (1/(1+exp(-v3)))*(1-1/(1+exp(-v3)))*e(i)*w_23;
    w_13 = w_13+n*delta3*x(i);
    delta4 = (1/(1+exp(-v4)))*(1-1/(1+exp(-v4)))*e(i)*w_24;
    w_14 = w_14+n*delta4*x(i);
    delta5 = (1/(1+exp(-v5)))*(1-1/(1+exp(-v5)))*e(i)*w_25;
    w_15 = w_15+n*delta5*x(i);

    
    w_21 = w_21 + n*e(i)*y_1;
    w_22 = w_22 + n*e(i)*y_2;
    w_23 = w_23 + n*e(i)*y_3;
    w_24 = w_24 + n*e(i)*y_4;
    w_25 = w_25 + n*e(i)*y_5;
    b_21 = b_21 + n*e(i);

    b_11 = b_11 + n*delta1;
    b_12 = b_12 + n*delta2;
    b_13 = b_13 + n*delta3;
    b_14 = b_14 + n*delta4;
    b_15 = b_15 + n*delta5;

    y_1 = 1/(1+exp(-x(i)*w_11 - b_11));
    y_2 = 1/(1+exp(-x(i)*w_12 - b_12));
    y_3 = 1/(1+exp(-x(i)*w_13 - b_13));
    y_4 = 1/(1+exp(-x(i)*w_14 - b_14));
    y_5 = 1/(1+exp(-x(i)*w_15 - b_15));
    y(i) = y_1*w_21+y_2*w_22+y_3*w_23+y_4*w_24+y_5*w_25+b_21;
    e(i) = d(i) - y(i);
    disp(e(i))
end
end

for i=1:20
     y_1 = 1/(1+exp(-x(i)*w_11 - b_11));
    y_2 = 1/(1+exp(-x(i)*w_12 - b_12));
    y_3 = 1/(1+exp(-x(i)*w_13 - b_13));
    y_4 = 1/(1+exp(-x(i)*w_14 - b_14));
    y_5 = 1/(1+exp(-x(i)*w_15 - b_15));
    y(i) = y_1*w_21+y_2*w_22+y_3*w_23+y_4*w_24+y_5*w_25+b_21;
end

figure
plot(x,d,'kx',x,y,'rx');