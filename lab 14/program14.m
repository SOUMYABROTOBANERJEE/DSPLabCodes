Fs=8000
Fpass=800
Fstop=1000
rp=0.5
rs=30
wp=2*pi*Fpass/Fs
ws=2*pi*Fstop/Fs
wp
ws
omega_p_hat=tan(wp/2)
omega_s_hat=tan(ws/2)
omega_p=1
omega_s=(omega_s_hat/omega_p_hat)
[N,wn]=ellipord(omega_p,omega_s,rp,rs,'s');
[b1,a1]=ellip(N,rp,rs,0.2,'s');


[num,den]=bilinear(b1,a1,.29)
N=512
[H,w]=freqz(num,den,N);
figure(1)
plot(w/pi,20*log10(abs(H)))
xlabel('w/pi');
ylabel('Gain in dB');
title('IIR Filter design using analog elliptical Filter Function')
figure(2)
plot(w*Fs/(2*pi), 20*log10(abs(H)))
xlabel('w*Fs/(2*pi)');
ylabel('Gain in dB');
title('IIR Filter design using analog elliptical Filter Function')

