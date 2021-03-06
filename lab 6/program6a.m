N1=64;
n1=0:N1-1;
xn1=cos(0.25*pi*n1);
wn1=exp(-1i*2*pi/N1)*ones(N1,1);
m=1;
for k=1:N1;
    xk1(m,1)= xn1*(wn1.^(n1'*k));
    m=m+1;
end;
x1=abs(xk1);
figure(1)
subplot(2,1,1);
plot(n1/(N1), x1/max(x1));
xlabel('normalized freq');
ylabel('amplitude');
legend('N=64');
title('DFT');
%%%%%%%%%


N2=512;
n2=0:N2-1;
xn2=cos(0.25*pi*n2);
wn2=exp(-1i*2*pi/N2)*ones(N2,1);
m2=1;
for k=1:N2;
    xk2(m2,1)= xn2*(wn2.^(n2'*k));
    m2=m2+1;
end;
x2=abs(xk2);
subplot(2,1,2);
plot(n2/(N2), x2/max(x2));
xlabel('normalized freq');
ylabel('amplitude');
legend('N=512');
title('DFT');

xk3= fft(xn1,N1);
x3=abs(xk3);
figure(2)
subplot(2,1,1);
plot(n1/N1,x3/max(x3));
xlabel('Normalized freq.');
ylabel('amplitude');
legend('N=64');
title('FFT');

xk4= fft(xn2,N2);
x4=abs(xk4);
subplot(2,1,2);
plot(n2/N2,x4/max(x4));
xlabel('Normalized freq.');
ylabel('amplitude');
legend('N=512');
title('FFT');

xn3=ifft(xk4);
N3=length(xn3);
n3=0:N3-1;
figure(3)
subplot(2,1,1);
stem(n3(1:60),xn3(1:60));
xlabel('time index');
ylabel('amplitude');
title('Signal obtained after IFFT');
subplot(2,1,2);
stem(n1(1:60),xn1(1:60));
xlabel('time index');
ylabel('amplitude');
title('input');