%(1)--------------

n= 0:20;
N = length(n);
s=ones(1,N);
figure(1)
stem(n,s);
grid;
xlabel(' time index n');
ylabel('amplitude');
%(2)---------------

D=10;
us=[zeros(1,D) 1 zeros(1,N-D-1)];
figure(2)
stem(n,us);
grid;
xlabel('time index n');
ylabel('Amplitude');
title('Unit Impulse');

%(3)----------------

G=-3.6;
c=-0.5+(pi/4)*1i;
x=G*exp(c*n);
a=real(x);
b=imag(x);
figure(3)
subplot(2,1,1);
stem(n,a);
xlabel('time index n');
ylabel('Amplitude');
title('Real Part');
subplot(2,1,2);
stem(n,b);
xlabel('time index n');
ylabel('Amplitude');
title('Imaginary Part');

%(4)-------------------

x1=cos(0.2*pi*n);
x2=cos(0.5*pi*n);
x=x1+x2;
figure(4)
subplot(3,1,1);
stem(n,x1);
ylabel('Amplitude');
title('plot of 1st Signal');
subplot(3,1,2);
stem(n,x2);
ylabel('amplitude');
title('Plot of 2nd Signal');
subplot(3,1,3);
stem(n,x);
xlabel('time index n');
ylabel('Amplitude');
title('Plot of Resultant Signal');

%(5)-----------------


x1=(0.1).^n;
x2=(0.7).^n;
x3=(1.1).^n;
figure(5)
subplot(3,1,1);
stem(n,x1);
ylabel('Amplitude');
title('1st plot');
subplot(3,1,2);
stem(n,x2);
ylabel('amplitude');
title('2nd Signal');
subplot(3,1,3);
stem(n,x3);
xlabel('time index n');
ylabel('Amplitude');
title('3rd Signal');

%(6)--------------------

x1=10*square(0.2*pi*n);
figure(6)
subplot(2,1,1);
stem(n,x1);
xlabel('time index n');
ylabel('Amplitude');
title('polar form of Square Signal');
x2=5*(1+square(0.2*pi*n));
subplot(2,1,2);
stem(n,x2);
xlabel('time index n');
ylabel('Amplitude');
title('Unipolar form of Square Signal');

