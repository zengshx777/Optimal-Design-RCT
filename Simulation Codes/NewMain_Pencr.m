%Major Script to Conduct Simulation
load('pen_cr.mat');
boottime=200;
simu_time=200;
[cr_20,a1_20,a2_20,a3_20,a4_20,vcr_20,b1_20,b2_20,b3_20,b4_20,num1,r1]=CompareSimulation(simu_time,20,10,1,0.2,3,0.5,0,1,boottime);
save pen_cr
[cr_30,a1_30,a2_30,a3_30,a4_30,vcr_30,b1_30,b2_30,b3_30,b4_30,num2,r2]=CompareSimulation(simu_time,30,10,1,0.2,3,0.5,0,1,boottime);
save pen_cr
[cr_50,a1_50,a2_50,a3_50,a4_50,vcr_50,b1_50,b2_50,b3_50,b4_50,num3,r3]=CompareSimulation(simu_time,50,10,1,0.2,3,0.5,0,1,boottime);
save pen_cr

%covariate number
boottime=0;
[crcov_5,cov1_5,cov2_5,cov3_5,cov4_5,crb_5,cb1_5,cb2_5,cb3_5,cb4_5,num4,r4]=CompareSimulation(simu_time,20,5,1,0.2,3,0.5,0,1,boottime);
save pen_cr
[crcov_10,cov1_10,cov2_10,cov3_10,cov4_10,crb_10,cb1_10,cb2_10,cb3_10,cb4_10,num5,r5]=CompareSimulation(simu_time,20,10,1,0.2,3,0.5,0,1,boottime);
save pen_cr
[crcov_15,cov1_15,cov2_15,cov3_15,cov4_15,crb_15,cb1_15,cb2_15,cb3_15,cb4_15,num6,r6]=CompareSimulation(simu_time,20,15,1,0.2,3,0.5,0,1,boottime);
save pen_cr
%covariate relationship with outcome
[cr_0,c1_0,c2_0,c3_0,c4_0,dcr_0,d1_0,d2_0,d3_0,d4_0,num7,r7]=CompareSimulation(simu_time,20,5,1,0.2,3,0,0,1,boottime);
save pen_cr

%[c1_5,c2_5,c3_5,c4_5,d1_5,d2_5,d3_5,d4_5,num6,r6]=CompareSimulation_nop(simu_time,20,10,1,0.2,3,0.5,0,boottime);
[cr_1,c1_1,c2_1,c3_1,c4_1,dcr_1,d1_1,d2_1,d3_1,d4_1,num8,r8]=CompareSimulation(simu_time,20,10,1,0.2,3,1,0,1,boottime);
save pen_cr
[cr_15,c1_15,c2_15,c3_15,c4_15,dcr_15,d1_15,d2_15,d3_15,d4_15,num9,r9]=CompareSimulation(simu_time,20,10,1,0.2,3,1.5,0,1,boottime);
save pen_cr
% %normal->uniform
% [n1,n2,n3,n4,dn1,dn2,dn3,dn4,num9,r9]=CompareSimulation(simu_time,20,10,1,0.2,3,0.5,0,200);
[cr_u,u1,u2,u3,u4,dcr_u,du1,du2,du3,du4,num10,r10]=CompareSimulation(simu_time,20,10,0,0.2,3,0.5,0,1,boottime);
save pen_cr
%causal estimand
boottime=200;
[crm_0,m1_0,m2_0,m3_0,m4_0,dcrm_0,dm1_0,dm2_0,dm3_0,dm4_0,num11,r11]=CompareSimulation(simu_time,20,10,1,0.2,0,0.5,0,1,boottime);
save pen_cr
[crm_1,m1_1,m2_1,m3_1,m4_1,dcrm_1,dm1_1,dm2_1,dm3_1,dm4_1,num12,r12]=CompareSimulation(simu_time,20,10,1,0.2,1,0.5,0,1,boottime);
save pen_cr
[crm_5,m1_5,m2_5,m3_5,m4_5,dcrm_5,dm1_5,dm2_5,dm3_5,dm4_5,num13,r13]=CompareSimulation(simu_time,20,10,1,0.2,5,0.5,0,1,boottime);
save pen_cr

%linear or nonlinear relationship
[ncr,nl1,nl2,nl3,nl4,dncr,dnl1,dnl2,dnl3,dnl4,num14,r14]=CompareSimulation(simu_time,20,10,0,0.2,3,0.5,0,0,boottime);
save pen_cr