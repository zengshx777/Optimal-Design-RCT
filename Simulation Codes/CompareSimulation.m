
function [ATE,ATE_1,ATE_2,ATE_3,ATE_4,V_ATE,VR_ATE,VB_ATE,VMM_ATE,VMR_ATE,numberre,run_time] =CompareSimulation(simu_number,N_samplesize,N_covariate,normal,p,t,h1,h2,linear,boottime)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

%simu_number simulation time

%N_samplesize:samplesize
%N_covariate:number of covariate

%normal=1 if the covariate generate from normal distribution
%p dependence between covariate

%t is the real ATE
%h1 heterogeneity type1 
%h2: heterogeneity type2

%linear =1 linear relationship =0 nonlinear


%generate covariate
%Uniform distribution without dependence

%Covariate=rand([N_samplesize,N_covariate]);

%Normal Distribution without dependence
%Mean
mu=linspace(-1,1,N_covariate);
%mu=zeros(N_covariate,1);

%Covariance Matrix,p is covariance coefficient
cov_var=linspace(1,1.5,N_covariate);
Sigma=diag(p*cov_var(1:end-1).*cov_var(2:end),1)+diag(p*cov_var(1:end-1).*cov_var(2:end),-1)+diag(cov_var);


b_number=boottime;


ATE=zeros(simu_number,1);
ATE_1=zeros(simu_number,1);
ATE_2=zeros(simu_number,1);
ATE_3=zeros(simu_number,1);
ATE_4=zeros(simu_number,1);

numberre=zeros(simu_number,1);
run_time=zeros(simu_number,1);

V_ATE=zeros(simu_number,1);
VR_ATE=zeros(simu_number,1);
VB_ATE=zeros(simu_number,1);
VMM_ATE=zeros(simu_number,1);
VMR_ATE=zeros(simu_number,1);

for i=1:simu_number
if normal==1
Covariate=mvnrnd(mu,Sigma,N_samplesize);
else
Covariate=rand(N_samplesize,N_covariate);
end
%Potential outcome:
%linear relationship

if linear==1
Y_0= Covariate*h1*(-10+rand(N_covariate,1)*20);
TE=t+h2*Covariate*(-1+rand(N_covariate,1)*2);

Y_1=Y_0+TE;
else
%nonlinear relationship
Y_0=sum(10*h1*(Covariate(:,1:(N_covariate-3)).^3),2)+sum(log(abs(h1*10*Covariate(:,(N_covariate-2):(N_covariate)))+1),2);
TE=t+h2*Covariate*(-1+rand(N_covariate,1)*2);
Y_1=Y_0+TE;
end

[ATE_1(i),b_ATE_1,numberre(i)]=R1(Covariate, Y_1,Y_0,b_number,0.05);
%Branch and Bound Matching Method;
[ATE_2(i),b_ATE_2,run_time(i)]=Optimalb_Pen(Covariate, Y_1,Y_0,b_number);

%Matching Method
[ATE_3(i),b_ATE_3]=Matching(Covariate, Y_1,Y_0,b_number,1);
[ATE_4(i),b_ATE_4]=Matching(Covariate, Y_1,Y_0,b_number,2);
[ATE(i),b_ATE]=Completerand(Y_1,Y_0,b_number);

VR_ATE(i)=var(b_ATE_1);
VB_ATE(i)=var(b_ATE_2);
VMM_ATE(i)=var(b_ATE_3);
VMR_ATE(i)=var(b_ATE_4);
V_ATE(i)=var(b_ATE);
disp(i);
end
end

