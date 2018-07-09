function [ATE_2,b_ATE_2,time] = Optimalb_Pen(Covariate,Y_1,Y_0,b_number)
%Penalized BB to Get Optimal Pairs
%Time to Store CPU time
temp=Covariate;
N_samplesize=size(Covariate,1);
N_covariate=size(Covariate,2);

l=1000;
options = optimset('MaxIter', 1000,'TolX',10^(-6));
t0=cputime;
[x,fval]=fmincon(@(u)(Dis(u,1,temp)),ones(N_samplesize*2,1),[],[],[],[],zeros(N_samplesize*2,1),[],[],options);
time=cputime-t0;
X=round(x(1:N_samplesize));

%Round the result to integer
group1=round(X);
group2=ones(N_samplesize,1)-group1;
%t=1 1 for treatment group
%t=0 1 for control group

t=round(rand(1));
% ATE_2=2/N_samplesize*((t*group1+(1-t)*group2)'*Y_1-((1-t)*group1+t*group2)'*Y_0);

ATE_2=1/sum(group1)*(t*group1+(1-t)*group2)'*Y_1+1/sum(group2)*((1-t)*group1+t*group2)'*Y_0;
%Calculate Empirical Variance with Bootstrap
b_ATE_2=zeros(b_number,1);


for k=1:b_number
b_index=datasample(1:N_samplesize,N_samplesize,'Replace',false);
b_Covariate=zeros(N_samplesize,N_covariate);
for j=1:N_samplesize;
b_Covariate(j,:)=Covariate(b_index(j),:);
end

[x,fval]=fmincon(@(u)(Dis(u,1,b_Covariate)),ones(N_samplesize*2,1),[],[],[],[],zeros(N_samplesize*2,1),[],[],options);
X=round(x(1:N_samplesize)); 
group1=round(X);
group2=ones(N_samplesize,1)-group1;
t=round(rand(1));
b_ATE_2(k)=1/sum(group1)*(t*group1+(1-t)*group2)'*Y_1+1/sum(group2)*((1-t)*group1+t*group2)'*Y_0;
end
end

