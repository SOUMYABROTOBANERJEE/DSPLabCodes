x=[1 2 0 1]
h=[2 2 1 1]
l1=length(x)
l2=length(h)
yc=zeros(1,l1)
h_toprow=[h(1) h(l2:-1:2)]
temp=0;
for k=1:l1
    h_shift=circshift(h_toprow',k-1)';
    temp=x.*h_shift;
    yc(k)=sum(temp);
end

   figure(1)
   n=0:l1-1;
   stem(n,yc);
   xlabel('time index');
   ylabel('amplitude');
   title('Circular convolution');
   
xe=[1 2 0 1 0 0 0]
he=[2 2 1 1 0 0 0]
l3=length(xe)
l4=length(he)
yce=zeros(1,l3)
he_toprow=[he(1) he(l4:-1:2)]
temp=0;
for k=1:l3
    h_shift=circshift(he_toprow',k-1)';
    temp=xe.*h_shift;
    yce(k)=sum(temp);
end

   figure(2)
   n1=0:l3-1;
   stem(n1,yce);
   xlabel('tim e index');
   ylabel('amplitude');
   title('Circular convolution');
   
   %--------------------------------------------------------------
   
   y_linear=conv(x,h);
figure(3)
l5=l1+l2-1;
x2=0:l5-1;
subplot(2,1,1);
stem(x2,y_linear);
xlabel('time index');
ylabel('amplitude');
title('lin conv');
subplot(2,1,2);
stem(n1,yce);
xlabel('time index');
ylabel('amplitude');
title('Circular conv for extended length sequence');

%-------------------------------------------------------------------------

l6=length(xe)+ length(he)-1;
xE=fft(xe,l6);
HE=fft(he,l6);
y1=ifft(xE.*HE);
n=0:l6-1
figure(4)
stem(n,y1);
xlabel('time index');
ylabel('amplitude');
title('DFT based linear convolution');

   