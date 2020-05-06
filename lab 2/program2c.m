N=40;
n=0:N-1;
s= 2*n.*(0.9.^n);
d=5*(rand(1,N)-0.5);
x=s+d;
figure(1)
plot(n,d,'b',n,s,'r',n,x,'k');
xlabel('Time index n');
ylabel('Signal Amplitude');
title('Comparison of clean signal s, random noise d, noisy signal x');
M=3;
b=ones(1,M)/M;
y=filter(b,1,x);
figure(2)
plot(n,s,'r-',n,y,'k:');
xlabel('Time index n');
ylabel('Signal Amplitude');
title('Comparison of MA filter (M=3) output(y) & uncorrupted signal');

M=10;
b=ones(1,M)/M;
y=filter(b,1,x);
figure(3)
plot(n,s,'r-',n,y,'k:');
xlabel('Time index n');
ylabel('Signal Amplitude');
title('Comparison of MA filter (M=10) output(y) & uncorrupted signal');
