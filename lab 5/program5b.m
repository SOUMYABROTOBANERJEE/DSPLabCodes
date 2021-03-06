B=0.15* [1 0 -1];
A= [1 -0.5 0.75];
w=[0:0.01:2*pi];
H=freqz(B,A,w);
magH=abs(H);
phaH=angle(H)*180/pi;
figure(1)
subplot(2,1,1);
plot(w/(2*pi),magH, 'b');
xlabel('w/(2*pi)');
ylabel('magnituide');
title('freq response of the system');
subplot(2,1,2);
plot(w/(2*pi), phaH, 'r');
xlabel('w/(2*pi)');
ylabel('phase degree');
title('phase response of the system');


phi=phasedelay(B,A,w);
GD=grpdelay(B,A,w);
figure(2)
subplot(2,1,1);
plot(w/(2*pi),GD, 'b');
xlabel('w/(2*pi)');
ylabel('Group delay');
title('Group delay introduced due to different sinusoidal frequencies');
subplot(2,1,2);
plot(w/(2*pi),phi, 'r');
xlabel('w/(2*pi)');
ylabel('phase delay');
title('Phase delay introduced due to different sinusoidal frequencies');


