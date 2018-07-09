function[ATE,E_ATE]=Completerand(Y_1,Y_0,boottime)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N_samplesize=length(Y_1);
Wholeindex=1:N_samplesize;
T_index=datasample(1:N_samplesize,N_samplesize/2,'Replace',false);
C_index= setdiff(Wholeindex,T_index);
ATE=mean(Y_1(T_index))-mean(Y_0(C_index));

%Caculate Empirical Variance
E_ATE=zeros(boottime,1);
Y_obs=Y_1;
Y_obs(C_index)=Y_0(C_index);
for j=1:boottime
T_index=datasample(1:N_samplesize,N_samplesize/2,'Replace',false);
C_index= setdiff(Wholeindex,T_index);
E_ATE(j)=mean(Y_obs(T_index))-mean(Y_obs(C_index));
end

end

