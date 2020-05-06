Fs=8000
Fpass=800
Fstop=1000
rp=0.5
rs=30
wp=2*pi*Fpass/Fs
ws=2*pi*Fstop/Fs
wp
ws
[N,wn]=ellipord(wp,ws,rp,rs)
[num,den]=ellip(N,rp,rs,.2)
N=512;
[H,W]=freqz(num,den,N);
figure(1)
plot(W/pi,20*log10(abs(H)))

xlabel('w/pi');
ylabel('Gain in dB');
title('IIR Digital Filter design using analog electrical filter');
% 
% figure(2)
% plot(Fs*(W/pi),20*log10(abs(H)))
% xlabel('Fs*(W/pi)');
% ylabel('Gain in dB');
% title('IIR Digital Filter design using analog elliptical filter');
 figure(3)
 subplot(2,1,1)
 plot(W/pi,20*log10(abs(H)))
 axis([0,1,-90,0])
 xlabel('w/pi');
 ylabel('Gain in dB');
 [GdH,w2]=grpdelay(num,den,512);
 subplot(2,1,2)
 plot(w2/pi, GdH)
 xlabel('w2/pi');
 ylabel('Group delay');
 title('Group Delay in Passband');