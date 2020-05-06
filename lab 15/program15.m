fp=1500;
fs=2000;
delta_f=500;
Fs=8000;
n_pbf=(2*pi*fp)/Fs;
n_sbf=(2*pi*fs)/Fs;
n_delta_w=(2*pi*delta_f)/Fs;
w_c=(n_pbf+n_sbf)/2;


M=round((3.32*pi)/n_delta_w);
N=2*M+1;
for n=1:2*M+1
    if n==M+1
        h(n)=w_c/pi
    else 
        h(n)=sin(w_c*(n-1-M))/(pi*(n-1-M))
    end
end

for n=1:2*M+1
    w(n)=0.54-.46*cos((2*pi*(n-1))/(2*M))
end
figure(1)
subplot(2,1,1)
n=0:2*M
stem(n,w)
xlabel('x')
ylabel('Hamming Window w(n)');

for m=1:2*M+1
    h_t(m)=h(m).*w(m)
end
subplot(2,1,2)
m=1:2*M+1
stem(m,h_t)
axis([0,50,-.5,max(h_t)])
xlabel('n')
ylabel('Causal filter impulse h(n)');


figure(2)
[H,F] = freqz(h_t,1,256,Fs);
magH=abs(H)/max(abs(H));
L=20*log10(magH)
plot(F,L)
xlabel('Freq in Hz');
ylabel('Gain in dB');
title('Gain-freq response H(w) of LPF');


[GdH,w2]=grpdelay(h_t,1,512);
figure(3);
plot(w2*Fs/(pi*2),GdH);
xlabel('w/pi');
ylabel('Group delay, Samples');

