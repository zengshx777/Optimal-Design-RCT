function[ATE_1,E_ATE,numberre]=R1(Covariate,Y_1,Y_0,var_number,a)
% Function of Rerandomization to get estimation
%Y_1,Y_0,Covariate: Potential Outcome and Covariates Values.
% a threshold quantile for Mdistance
% var_number:time of repeatance to assess variance of estimator for RR
N_samplesize=size(Covariate,1);
N_covariate=size(Covariate,2);

Wholeindex=1:N_samplesize;
threshold=chi2inv(a,N_covariate);


M=10000;
numberre=0;

while(M>threshold)
T_index=datasample(1:N_samplesize,N_samplesize/2,'Replace',false);
C_index= setdiff(Wholeindex,T_index);

TreatmentGroup=Covariate(T_index,:);
ControlGroup=Covariate(C_index,:);
M=(N_samplesize/4)*(mean(TreatmentGroup)-mean(ControlGroup))/(cov(Covariate))*(mean(TreatmentGroup)-mean(ControlGroup))';
numberre=numberre+1;
end

%estimated value
ATE_1=mean(Y_1(T_index))-mean(Y_0(C_index));
% 
%empirical variance calculation
Y_obs=Y_1;
Y_obs(C_index)=Y_0(C_index);
E_ATE=zeros(var_number,1);
for j=1:var_number
M=10000;
while(M>threshold)
T_index=datasample(1:N_samplesize,N_samplesize/2,'Replace',false);
C_index= setdiff(Wholeindex,T_index);

TreatmentGroup=Covariate(T_index,:);
ControlGroup=Covariate(C_index,:);
M=(N_samplesize/4)*(mean(TreatmentGroup)-mean(ControlGroup))/(cov(Covariate))*(mean(TreatmentGroup)-mean(ControlGroup))';
end
E_ATE(j)=mean(Y_obs(T_index))-mean(Y_obs(C_index));
end


end
