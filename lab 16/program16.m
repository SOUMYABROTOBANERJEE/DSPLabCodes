fp=1500;
fs=2000;
delta_f=500;
Fs=8000;
n_pbf=(2*pi*fp)/Fs;
n_sbf=(2*pi*fs)/Fs;
n_delta_w=(2*pi*delta_f)/Fs;
w_c=(n_pbf+n_sbf)/2;
% With rectangular window
M1=round(.92*pi/n_delta_w)
N1=2*M1+1;
for n=1:2*M1+1
    if n==M1+1
        h1(n)=w_c/pi
    else
        h1(n)=sin(w_c*(n-1-M1))/(pi*(n-1-M1))
    end
end
for n=1:2*M1+1
    w1(n)= 1;
end
for m = 1:2*M1+1
    h_t1(m)=h1(m).*w1(m);
end

%With Hamming window
M2=round((3.32*pi)/n_delta_w);
N2=2*M2+1;
for n=1:2*M2+1
    if n==M2+1
        h2(n)=w_c/pi;
    else 
        h2(n)=sin(w_c*(n-1-M2))/(pi*(n-1-M2));
    end
end

for n=1:2*M2+1
    w2(n)=0.54-.46*cos((2*pi*(n-1))/(2*M2))
end
for m=1:2*M2+1
    h_t2(m) = h2(m).*w2(m)
end

%With Blackmann window

M3=round(5.56*pi/n_delta_w)
N3=2*M3+1;
for n=1:2*M3+1
    if n==M3+1
        h3(n)=w_c/pi;
    else 
        h3(n)=sin(w_c*(n-1-M3))/(pi*(n-1-M3));
    end
end

for n=1:2*M3+1
    w3(n)=0.42-.5*cos((2*pi*(n-1))/(2*M3))+0.08*cos((4*pi*(n-1))/(2*M3)
end
for m=1:2*M3+1
    h_t3(m) = h3(m).*w3(m)
end

figure(1)
subplot(2,1,1)
n1=0:2*M1;
n2=0:2*M2;
n3=0:2*M3;
plot(n1,w1,'r',n2,w2,'b',n3,w3,'k');
xlabel('n');
ylabel('w(n)');
title('Plot of window function')
legend('Rect','Hamm','Black')
subplot(2,1,2)
m1=1:2*M1+1;
m2=1:2*M2+1;
m3=1:2*M3+1;
plot(m1,h_t1,'r',m2,h_t2,'b',m3,h_t3,'k');
xlabel('n');
ylabel('h(n)');
title('Plot of Impulse Response')
legend('Rect','Hamm','Black')

figure(2)
[H1,F]=freqz(h_t1,1,256,Fs)
[H2,F]=freqz(h_t2,1,256,Fs)
[H3,F]=freqz(h_t3,1,256,Fs)
magH1=abs(H1)/max(abs(H1))

magH2=abs(H2)/max(abs(H2))

magH3=abs(H3)/max(abs(H3))

L1=20*log10(magH1)
L2=20*log10(magH2)
L3=20*log10(magH3)

plot(F,L1,'r',F,L2,'b',F,L3,'k')
xlabel('Freq in Hz')
ylabel('Gain in dB')
title('Gain-freq response H(w) of the LPF in different windows')
legend('Rect','Hamm','Black')