% Total variation distance vs. m shuffles

n = 52; % # of cards in deck
R_nr=zeros(52,10); % Eulerian number
R_nj=zeros(52,10); % used to compute Eulerian number
Q_mr=zeros(52,10); % Prob. of r rising sequences after m shuffles
tvd=zeros(1,10); % total variation distance

for m=1:10
    
% Calculate Eulerian number
    for r=1:n
        for j=1:r-1
            R_nj(j,m)=nchoosek(n+r-j,n)*R_nr(j,m);
        end
        R_nr(r,m)=r^n-sum(R_nj(:,m));
    end
    
% P(of r rising sequences in a permutation after m shuffles)
    for r=1:n
    if 2^m+n-r>=n
        Q_mr(r,m)=abs(nchoosek(2^m+n-r,n)/2^(m*n))-(1/factorial(n));
    else
        continue
    end
    end
    
% Total variation distance from uniform distribution
    tvd(m)=sum(R_nr(:,m).*Q_mr(:,m))*.5;
end