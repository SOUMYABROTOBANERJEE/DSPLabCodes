x=[-4,5,1,-2,-3,0,2];
y=[6,-3,-1,0,8,7,-2];
w=[3,2,2,-1,0,-2,5];
r1=conv(x,fliplr(x));
r2=conv(x,fliplr(y));
r3=conv(x,fliplr(w));
figure(1)
subplot(3,1,1);
stem(r1);
subplot(3,1,2);
stem(r2);
subplot(3,1,3);
stem(r3);


 n= -20:20;

x=inline('-4*(n==-3)+5*(n==-2)+1*(n==-1)-2*(n==0)-3*(n==1)+2*(n==3)');
y=inline('6*(n==-1)-3*(n==0)-1*(n==1)-0*(n==2)+8*(n==3)+7*(n==4)-2*(n==5)');
w=inline('3*(n==2)+2*(n==3)+2*(n==4)-1*(n==5)-2*(n==7)+5*(n==8)');
z1=convn(x(n),x(n));
figure(2)
subplot(3,1,1);
stem(z1);
title('Auto con');
z2=convn(x(n),y(n));
subplot(3,1,2);
stem(z2);
title('Cross con');
z3=convn(x(n),w(n));
subplot(3,1,3);
stem(z3);
title('Cross con');



