function k2 = genp67(t1,t2,lam)
%genp67 return k2 for [t1,t2]
t = t1;
k = 0;
while t < t2
    t = t - log(rand)/lam;
    k = k + 1;
end
k2 = k - 1;