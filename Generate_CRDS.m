function X_random = Generate_CRDS(X) % X is a ODS
[N,M] = size(X);
X_random = zeros(N,M);
for m=1:M
    % Generate a completely randomized data set by using m-th permutation
    X_random(:,m) =  randsample(X(:,m), N, false);
end
end