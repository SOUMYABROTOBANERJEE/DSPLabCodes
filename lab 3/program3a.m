F=100;
t=0.0001:0.001:0.1;
s=5*cos(2*pi*F*t);
figure(1)
subplot(2,1,1);
plot(t,s);
xlabel('t axis');
ylabel('Amplitude');
title('Analog Signal');
n=0:100;
N=length(n);
FS= 1000; %Sampling Freq
f=F/FS;
s=5*cos(2*pi*f*n);
subplot(2,1,2);
stem(n,s);
xlabel('time index n');
ylabel('amplitude');
title('sampled signal');


x1=5*cos(2*pi*1.1*n);
x2=5*cos(2*pi*2.1*n);
x3=5*cos(2*pi*3.1*n);
figure(2)
subplot(4,1,1);
plot(n,s);
subplot(4,1,2);
plot(n,x1);
subplot(4,1,3);
plot(n,x2);
subplot(4,1,4);
plot(n,x3);


