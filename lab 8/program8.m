num=[3 -4]
den=[1 -3.5 1.5]
[r,p,k]=residuez(num,den)
r'
p'
k'
figure(1)
zplane(num,den)
title('pole zero plot of the T.F.');
N=100;
[h,T]=impz(num,den,N);
h'
T'
figure(2)
subplot(2,1,1);
stem(T,h);
xlabel('time index');
ylabel('amplitude');
title('non-converging impulse response');

%----------------------------------------------------------------------


num1 = [1 -4/3];
den1 = [-1 2.5/3 -0.5/3];
[h1,T] = impz(num1, den1, N);
subplot(2,1,2);
stem(T,h1);
xlabel('time index');
ylabel('amplitude');
title('convergent impulse response for a stable system');
figure(3)
zplane(num1,den1);
title(' pole zero plot of  the stable system');


w=[0:0.01:2*pi];
H=freqz(num,den,w);
magH=abs(H);
H1=freqz(num1,den1,w);
magH1=abs(H1);
figure(4)
subplot(2,1,1);
plot(w/(2*pi), magH, 'b-');
title('magnitude response');

subplot(2,1,2);
plot(w/(2*pi), magH1,'r-');
title('magnitude response');


imH1=imag(H1);
imH=imag(H);
figure(5)
subplot(2,1,1);
plot(w/(2*pi), imH, 'b-');
title('phase response');

subplot(2,1,2);
plot(w/(2*pi), imH1,'r-');
title('phase response');

