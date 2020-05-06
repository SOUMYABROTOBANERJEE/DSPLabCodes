clear all;
clc;

N=100;
n=0:N-1;
s=cos(0.25*pi*n);
w=rand(1,N)-0.5;
y=s+w;
ryy=conv(y,fliplr(y));
rww=conv(w,fliplr(w));
rsw=conv(s,fliplr(w));
ryw=conv(y,fliplr(w));
k=-30:30;
figure(1)
subplot(5,1,1);
stem(n(1:61),s(1:61));
xlabel(' Discreet time axis');
ylabel('Amplitude');
Legend('S(n)');

subplot(5,1,2);
stem(k,ryy(70:130));
xlabel(' Discreet time axis');
ylabel('Amplitude');
Legend('r-y-y[k]');

subplot(5,1,3);
stem(k,rsw(70:130));
xlabel(' Discreet time axis');
ylabel('Amplitude');
Legend('r-s-w[k]');

subplot(5,1,4);
stem(k,rww(70:130));
xlabel(' Discreet time axis');
ylabel('Amplitude');
Legend('r-w-w[k]');

subplot(5,1,5);
stem(k,ryw(70:130));
xlabel(' Discreet time axis');
ylabel('Amplitude');
Legend('r-y-w[k]');