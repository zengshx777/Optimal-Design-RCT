function [ATE_2,b_ATE_2,run_time] = Optimalb(b_number)
%UNTITLED2 Summary of this function goes here
%   

global Covariate;
global Y_1;
global Y_0;

temp=Covariate;
N_samplesize=size(Covariate,1);

%Get the Optimal Partition
x0=[zeros(N_samplesize/2,1);ones(N_samplesize/2,1)];
[errmsg,Z,X,time,c,fail] =BNB20('mdistance',x0,ones(N_samplesize,1),zeros(N_samplesize,1),ones(N_samplesize,1),[],[],[ones(1,N_samplesize);[1,zeros(1,N_samplesize-1)]],[N_samplesize/2;0]);



%Round the result to integer
group1=round(X);
group2=ones(N_samplesize,1)-group1;
%t=1 1 for treatment group
%t=0 1 for control group

t=round(rand(1));
ATE_2=2/N_samplesize*((t*group1+(1-t)*group2)'*Y_1-((1-t)*group1+t*group2)'*Y_0);
run_time=time;



%Calculate Empirical Variance with Bootstrap
b_ATE_2=zeros(b_number,1);


for k=1:b_number
b_index=datasample(1:N_samplesize,N_samplesize,'Replace',false);
b_Covariate=Covariate;
for j=1:size(Covariate,1);
b_Covariate(j,:)=Covariate(b_index(j),:);
end
Covariate=b_Covariate;
%Applied BB to get Optimal Partition
x0=[zeros(N_samplesize/2,1);ones(N_samplesize/2,1)];
[errmsg,Z,X,time,c,fail] =BNB20('mdistance',x0,ones(N_samplesize,1),zeros(N_samplesize/2,1),ones(N_samplesize/2,1),[],[],[ones(1,N_samplesize);[1,zeros(1,N_samplesize-1)]],[N_samplesize/2;0]);
group1=round(X);
group2=ones(N_samplesize,1)-group1;
t=round(rand(1));
b_ATE_2(k)=2/N_samplesize*((t*group1+(1-t)*group2)'*Y_1-((1-t)*group1+t*group2)'*Y_0);
end
Covariate=temp;
end

