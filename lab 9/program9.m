N= 100;
num=[1];
den=[1 -1.8456 0.849585];
[h,T]=impz(num,den,N);
figure(1)
subplot(2,1,1);
stem(T,h);
xlabel('time index n');
ylabel('Amplitude');
title('convergent impulse response for a stable system');

%------------------------------------------------------------------


den1=[1 -1.85 -0.84];
[h1, T]= impz(num,den1, N);
subplot(2,1,2);
stem(T,h1);
xlabel('time index n');
ylabel('Amplitude');
title('divergent impulse response for a stable system');
figure(2)
subplot(2,1,1);
zplane(num,den);
title('pole zero plot for 1st stable system');

subplot(2,1,2);
zplane(num,den1);
title('pole zero plot for 2nd unstable system');
