function [f] =Dis(u,l,Covariate)
%Calculate Transformed Matrix Based on Covariate Matrix and vector

N_samplesize=size(u,1)/2;
A=[ones(1,N_samplesize);[1,zeros(1,N_samplesize-1)]];
b=[N_samplesize/2;1];

T=[A,zeros(2,N_samplesize);eye(N_samplesize),eye(N_samplesize)];
t=[-b;-ones(N_samplesize,1)];

Q=Covariate/cov(Covariate)*Covariate';
q=-ones(N_samplesize,1)'*Q;

x=u(1:N_samplesize);
y=u((N_samplesize+1):2*N_samplesize);
f=x'*Q*x+q*x+l*((T*u+t)'*(T*u+t)+(x'*y));

end

