function [ATE_3,b_ATE_3] =Matching(Covariate,Y_1,Y_0,b_number,distance_type)
%UNTITLED3 Summary of this function goes here
%   Applied Matching to get estimation of ATE
% b_number: Number of Bootstrap to Get Variance
% distance_type: 1 Mahadistance ;2 Rank distance

N_samplesize=size(Covariate,1);

if(distance_type==1)
    D=Mahadistance(Covariate);
else
    D=Rankdistance(Covariate);
end
    [A,B]=GreedyMatching(D);

group1=zeros(N_samplesize,1);
group1(A)=1;
group2=ones(N_samplesize,1)-group1;

t=round(rand(1));
ATE_3=2/N_samplesize*((t*group1+(1-t)*group2)'*Y_1-((1-t)*group1+t*group2)'*Y_0);


% %Calculate Empirical Variance
b_ATE_3=zeros(b_number,1);
for k=1:b_number
b_index=datasample(1:N_samplesize,N_samplesize,'Replace',false);
b_Covariate=Covariate;
for j=1:size(Covariate,1);
b_Covariate(j,:)=Covariate(b_index(j),:);
end

if(distance_type==1)
    D=Mahadistance(b_Covariate);
else
    D=Rankdistance(b_Covariate);
end
    [b_A,b_B]=GreedyMatching(D);

b_group1=zeros(N_samplesize,1);
b_group1(b_A)=1;
b_group2=ones(N_samplesize,1)-b_group1;

t=round(rand(1));
b_ATE_3(k)=2/N_samplesize*((t*b_group1+(1-t)*b_group2)'*Y_1-((1-t)*b_group1+t*b_group2)'*Y_0);
end


end

