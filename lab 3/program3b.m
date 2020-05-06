% pre filter frequency= Fs/2=500HZ
n=0:400;
N=length(n);
x1=cos(0.2*pi*n);
x2=cos(0.02*pi*n);
x=x1.*x2;
figure(1)
subplot(3,1,1);
plot(n,x1);
ylabel('Amplitude');
title('1st signal');
subplot(3,1,2);
plot(n,x2);
ylabel('Amplitude');
title('2nd signal');
subplot(3,1,3);
plot(n,x);
ylabel('Amplitude');
xlabel('time axis');
title('Product Signal');

