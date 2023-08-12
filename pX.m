function p = pX(numx,numy,N,sX)
% Kirsch A, Mitzenmacher M, Pietracaprina A, et al. An efficient rigorous approach for identifying statistically significant frequent itemsets[J].
% Journal of the ACM (JACM), 2012, 59(3): 1-22.
%% for every pair (x,y), compute probability that (x,y) appears in objects
% if length(x)~=length(y)
%     disp("Error!")
% end
p = 0;
% STEP1: compute the excepted support of (x,y)

% STEP2: compute the probability
for n=sX:min(numx,numy)
    p = p + pXn(numx,numy,N,n);
end
end

function pn = pXn(numx,numy,N,n)
% pn = nchoosek(N,n)*(((numx/N)*(numy/N))^n)*((1-(numx/N)*(numy/N))^(N-n));
log_pn = nchoosekln(N,n) + n*(log(numx*numy)-2*log(N)) + (N-n)*(log(N^2-numx*numy)-2*log(N));
pn = exp(log_pn);
end

function nk = nchoosekln(n,k)
nk = gammaln(n+1) - gammaln(k+1) - gammaln(n-k+1);
end