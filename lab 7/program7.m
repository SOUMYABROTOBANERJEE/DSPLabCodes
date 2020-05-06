N=128;
w=rand(1,N)-0.5;
n=0:N-1;
s=2*n.*(0.9.^n);
x=s+w;
M=3;
h=ones(1,M)/M;
L=4;
y=fftfilt(h,x,4);
figure(1)
subplot(2,1,1);
plot(n,s,'r-',n,y,'b-');
xlabel('time index');
ylabel('amplitude');
legend('clean signal s', 'filtered signal y');
title('MA filtering by overlap add method');
subplot(2,1,2);
stem(n(1:3),h);
grid on;
xlabel('time index');
ylabel('amplitude');
axis([-1 3 0 1]);
title('impulse response of moving average filter');
%--------------------------------------------------------------------

h1=[h,zeros(1,N-M)];
for k=1,
    x1(k)=y(k)/h(k);
end
for k=2:128,
    x1(k)=(y(k)-h1(2:k)*(x1(k-1:-1:1))')/h1(1);
end
k=0:1:N-1;
figure(2)
subplot(2,1,1);
plot(k,x);
xlabel('time index');
ylabel('amplitude');
title('I/P noise corrupted signal');
subplot(2,1,2);
plot(k,x1,'r');
xlabel('time index');
ylabel('amplitude');
title('Deconvoluted o/p');