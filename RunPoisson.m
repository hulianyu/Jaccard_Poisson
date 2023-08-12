function pv = RunPoisson(X)
alpha = 0.2;
[N,M] = size(X);
Xb = Xbinaryeq2(X);
sum_p = 0;
num_alpha = 0;
for m1=1:M-1
    x1 = Xb{m1,1};
    for m2=m1+1:M
        x2 = Xb{m2,1};
        x_1 = x1;
        numx = length(find(x_1==1));
        x_2 = x2;
        numy = length(find(x_2==1));
        sX = (alpha*(numx+numy))/(1+alpha);
        sX = ceil(sX);
        p = pX(numx,numy,N,sX);
        inter = length(find(x_1.*x_2==1));
        ind =  double((inter)/(numx+numy-inter)>=alpha);
        sum_p = sum_p + sum(sum(p));
        num_alpha = num_alpha + sum(sum(ind));
    end
end
lambda = sum_p;
pv = pvalue_poisson(num_alpha,lambda);
end

function Xmb = Xbinaryeq2(X)
[~,M] = size(X);
Xmb = cell(M,1);
for m=1:M
    Xm = X(:,m);
    Xb = double(Xm==2);
    Xmb{m,1} = Xb;
end
end