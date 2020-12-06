%scr72 - for Lab6
clear all
t1 = 0;
t2 = 2;
% ts = t1+ (t2-t1)/2
ts = t1+ (t2-t1)/2
lam = 1;
N=100;
del=(t2-t1)*lam;
kr=del*3
pr(1:kr)=0;
pr(1)=exp(-del);
for k=2:kr
pr(k)=pr(k-1)*del/(k-1);

end
eps=1-sum(pr)
% генерируем выборку
ns(1:N)=0;
ns1(1:N)=0;
ns2(1:N)=0;
for n=1:N
ns(n)=genp67(t1,t2,lam);
ns1(n)=genp67(t1,ts,lam);
ns2(n)=genp67(ts,t2,lam);
end
figure(1)
hist(ns,kr)
title('del = 1')
% xi2 - er=v-N*pr
[v,xv]=hist(ns,kr)
Npr=N*pr;
er=v-Npr
er2=er.^2./Npr;
xi2=sum(er2)
% график интенсивности потока m=2
% ns -[t1 t2] ns1 -[t1 ts] ns2 - [ts t2]
m = 2;
dt=(t2-t1)/m;
% N=1 lam1=sum(ns1)/dt
% N=1 lam=sum(ns2)/dt
% N=100 lam1=sum(ns1)/(dt*N)
% N=100 lam2=sum(ns2)/(dt*N)
lam1=sum(ns1)/(dt*N);
lam2=sum(ns1)/(dt*N);
in_vyb=[lam1 lam2];
int=[lam lam];
tt=[t1+dt/2 t1+dt+dt/2];
figure(3)
plot(tt,int)
hold on
plot(tt,in_vyb, 'r*')
title('* - vyborka, - - theory ')
hold off
