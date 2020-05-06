% lab----(2a)
%(a)----------

N=20;
n=0:N-1;
s= 2*n.*(0.9.^n);
d=5*(rand(1,N)-0.5);
x1=s+d;
figure(1)
subplot(2,1,1);
stem(n,s);
xlabel('Time index n');
ylabel('Amplitude');
title('Signal');
subplot(2,1,2);
stem(n,d);
xlabel('Time index n');
ylabel('Noise Amplitude');
title('Noise');
figure(2)
subplot(3,1,1);
stem(n,x1);
xlabel('Time index n');
ylabel('Amplitude');
title('Noise Corrupted Signal');

%(b)---------------------

M=50;
for k=1:M;
    d=5*(rand(1,N)-0.5);
    x=s+d;
    x1=x1+x;
end;
x1=x1/M;
subplot(3,1,2);
stem(n,x1);
xlabel('Time index n');
ylabel('Amplitude');
title('Ensemble Average for M=50');

%-----------------------------------


M=10;
for k=1:M;
    d=5*(rand(1,N)-0.5);
    x=s+d;
    x1=x1+x;
end;
x1=x1/M;
subplot(3,1,3);
stem(n,x1);
xlabel('Time index n');
ylabel('Amplitude');
title('Ensemble Average for M=10');


