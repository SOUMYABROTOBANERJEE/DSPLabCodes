M=5;
B=ones(1,M)/M;
A=1;
w=(0:0.01:2*pi);
H=freqz(B,A,w);
magH=abs(H);
phaH=angle(H)*180/pi;



M1=15;
B1=ones(1,M1)/M1;
A1=1;
w=(0:0.01:2*pi);
H1=freqz(B1,A1,w);
magH1=abs(H1);
phaH1=angle(H1)*180/pi;

figure(1)
subplot(2,1,1);
plot(w/(2*pi), magH,'r',w/(2*pi), magH1,'b');
grid on;

xlabel('Nor. Freq.');
ylabel('Magnitude');
title('Freq Response of the system');
Legend('M=5','M=15');

subplot(2,1,2);
plot(w/(2*pi), phaH,'r', w/(2*pi), phaH1, 'b');
grid on;

xlabel('Nor. Freq.');
ylabel('Phase in degree');
title('Phase Response of the system');
Legend('M=5','M=15');
