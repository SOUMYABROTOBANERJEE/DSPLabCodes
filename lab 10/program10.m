wp=2*pi*1000
ws=2*pi*1500
rp=1
rs=40
[N1,wc1]=buttord(wp,ws,rp,rs,'s')
[B1,A1]=butter(N1,wc1,'s')
w=[0:50:5000*pi]
h=freqs(B1,A1,w)
figure(1)
plot(w/(2*pi), 20*log10(abs(h)))
xlabel('Freq in Hz');
ylabel('Amplitude');
title('Gain frequency response of Butterworth filter');
N1
fc1=wc1/(2*pi)

%------------------------------------------
  
[N2,wn1] = cheb1ord(wp,ws,rp,rs,'s');
[B2,A2]=cheby1(N2,rp,wn1,'s');
N2
h2=freqs(B2,A2,w)
[N3,wn2]=cheb2ord(wp,ws,rp,rs,'s');
[B3,A3]=cheby2(N3,rs,wn2,'s');
h3=freqs(B3,A3,w)
figure(2)
plot(w/(2*pi), 20*log10(abs(h2)),'b-', w/(2*pi), 20*log10(abs(h3)),'r-')
xlabel('Freq wn in Hz');
ylabel('Amplitude');
legend('Cheby type 1','Cheby type 2');
title('Gain frequency response of Chebychev filter');
N2
N3
[N4,wn3] = ellipord(wp,ws,rp,rs,'s');
[B4,A4]=ellip(N4,rp,rs,wn3,'s');
h4=freqs(B4,A4,w)
figure(3)
plot(w/(2*pi), 20*log10(abs(h4)))
xlabel('Freq wn in Hz');
ylabel('Amplitude');
title('Gain frequency response of Elliptical filter');


