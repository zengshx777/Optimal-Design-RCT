%Plotting Based on the Results
%compare between normal and uniform distribution
load pen_cr
hold off;
set(gcf,'Position',[100,100,1200,600], 'color','w')
s=[cr_20,cr_u,a1_20,u1,a2_20,u2,a3_20,u3,a4_20,u4];
plot1=boxplot(s);
line([0,2500],[3,3],'linestyle',':');
line([2.5,2.5],[0,3],'linestyle',':');
line([2.5,2.5],[-100,100],'linestyle',':');
line([4.5,4.5],[-100,100],'linestyle',':');
line([6.5,6.5],[-100,100],'linestyle',':');
line([8.5,8.5],[-100,100],'linestyle',':');
set(gca,'XTickLabel',{''});

dim = [0.15 0.6 0.3 0.3];
str = {'CR','Normal  Uniform'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.31 0.6 0.3 0.3];
str = {'RR','Normal  Uniform'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.47 0.6 0.3 0.3];
str = {'OB(Pen)','Normal  Uniform'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.61 0.6 0.3 0.3];
str = {'M-MD','Normal  Uniform'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.77 0.6 0.3 0.3];
str = {'M-R','Normal  Uniform'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');


xlabel('Different Methods');ylabel('Estimated Value');title('Comparison via Simulation(Normal and Uniform Distribution)');
%saveas(gcf,'E:\大四下\数学系毕设\Plot\paperplot\diffdis.eps')
hold off;
close(figure(gcf));

%linear and nonlinear Comparison
hold off;
set(gcf,'Position',[100,100,1200,600], 'color','w')
s=[cr_20,ncr,a1_20,nl1,a2_20,nl2,a3_20,nl3,a4_20,nl4];
plot1=boxplot(s);
line([0,2500],[3,3],'linestyle',':');
line([2.5,2.5],[0,3],'linestyle',':');
line([2.5,2.5],[-100,100],'linestyle',':');
line([4.5,4.5],[-100,100],'linestyle',':');
line([6.5,6.5],[-100,100],'linestyle',':');
line([8.5,8.5],[-100,100],'linestyle',':');
set(gca,'XTickLabel',{''});

dim = [0.15 0.6 0.3 0.3];
str = {'CR','Linear Nonlinear'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.31 0.6 0.3 0.3];
str = {'RR','Linear Nonlinear'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.47 0.6 0.3 0.3];
str = {'OB(Pen)','Linear Nonlinear'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.61 0.6 0.3 0.3];
str = {'M-MD','Linear Nonlinear'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.77 0.6 0.3 0.3];
str = {'M-R','Linear Nonlinear'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');

xlabel('Different Methods');ylabel('Estimated Value');title('Comparison via Simulation(Linear versus Nonlinear)');
%saveas(gcf,'E:\大四下\数学系毕设\Plot\paperplot\difflin.eps')
hold off;
close(figure(gcf));

%compare different causal effect estimation:c=0,1,5

set(gcf,'Position',[100,100,1200,600], 'color','w')
s=[crm_0,crm_1,crm_5,m1_0,m1_1,m1_5,m2_0,m2_1,m2_5,m3_0,m3_1,m3_5,m4_0,m4_1,m4_5];
plot2=boxplot(s);
line([0,2500],[5,5],'linestyle',':');
line([0,2500],[0,0],'linestyle',':');
line([0,2500],[1,1],'linestyle',':');
line([3.5,3.5],[-100,100],'linestyle',':');
line([6.5,6.5],[-100,100],'linestyle',':');
line([9.5,9.5],[-100,100],'linestyle',':');
line([12.5,12.5],[-100,100],'linestyle',':');
set(gca,'XTickLabel',{''});
dim = [0.15 0.6 0.3 0.3];
str = {'CR','t=0  t=1  t=5'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.31 0.6 0.3 0.3];
str = {'RR','t=0  t=1  t=5'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.47 0.6 0.3 0.3];
str = {'OB(Pen)','t=0  t=1  t=5'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.61 0.6 0.3 0.3];
str = {'M-MD','t=0  t=1  t=5'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.77 0.6 0.3 0.3];
str = {'M-R','t=0  t=1  t=5'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');

xlabel('Different Methods');ylabel('Estimated Value');title('Comparison via Simulation for Different Causal Effect(0,1,5)');
%saveas(gcf,'E:\大四下\数学系毕设\Plot\paperplot\diffc.eps')
hold off;
close(figure(gcf));


%compare different relationship between covariate with outcome 

set(gcf,'Position',[100,100,1200,600], 'color','w')
s=[cr_0,cr_1,cr_15,c1_0,c1_1,c1_15,c2_0,c2_1,c2_15,c3_0,c3_1,c3_15,c4_0,c4_1,c4_15];
plot2=boxplot(s);
line([0,2500],[3,3],'linestyle',':');
line([3.5,3.5],[-100,100],'linestyle',':');
line([6.5,6.5],[-100,100],'linestyle',':');
line([9.5,9.5],[-100,100],'linestyle',':');
line([12.5,12.5],[-100,100],'linestyle',':');
set(gca,'XTickLabel',{''});
dim = [0.15 0.6 0.3 0.3];
str = {'CR','h1=0, 1, 1.5'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.31 0.6 0.3 0.3];
str = {'RR','h1=0, 1, 1.5'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.47 0.6 0.3 0.3];
str = {'OB(Pen)','h1=0, 1, 1.5'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.61 0.6 0.3 0.3];
str = {'M-MD','h1=0, 1, 1.5'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.77 0.6 0.3 0.3];
str = {'M-R','h1=0, 1, 1.5'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');

xlabel('Different Methods');ylabel('Estimated Value');title('Comparison via Simulation for Different h1(0,1,1.5)');
%saveas(gcf,'E:\大四下\数学系毕设\Plot\paperplot\diffh.eps')
hold off;
close(figure(gcf));



set(gcf,'Position',[100,100,1200,600], 'color','w')
s=[cr_20,cr_30,cr_50,a1_20,a1_30,a1_50,a2_20,a2_30,a2_50,a3_20,a3_30,a3_50,a4_20,a4_30,a4_50];
plot2=boxplot(s);
line([0,2500],[3,3],'linestyle',':');
line([3.5,3.5],[-100,100],'linestyle',':');
line([6.5,6.5],[-100,100],'linestyle',':');
line([9.5,9.5],[-100,100],'linestyle',':');
line([12.5,12.5],[-100,100],'linestyle',':');
set(gca,'XTickLabel',{''});
dim = [0.15 0.6 0.3 0.3];
str = {'CR','n=20,30,50'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.31 0.6 0.3 0.3];
str = {'RR','n=20,30,50'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.47 0.6 0.3 0.3];
str = {'OB(Pen)','n=20,30,50'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.61 0.6 0.3 0.3];
str = {'M-MD','n=20,30,50'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.77 0.6 0.3 0.3];
str = {'M-R','n=20,30,50'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');

xlabel('Different Methods');ylabel('Estimated Value');title('Comparison via Simulation for Different Samplesize(20,30,50)');
%saveas(gcf,'E:\大四下\数学系毕设\Plot\paperplot\diffsamplesize.eps')
hold off;
close(figure(gcf));


set(gcf,'Position',[100,100,1200,600], 'color','w')

s=[crcov_5,crcov_10,crcov_15,cov1_5,cov1_10,cov1_15,cov2_5,cov2_10,cov2_15,cov3_5,cov3_10,cov3_15,cov4_5,cov4_10,cov4_15];
plot5=boxplot(s);
line([0,2500],[3,3],'linestyle',':');
line([3.5,3.5],[-100,100],'linestyle',':');
line([6.5,6.5],[-100,100],'linestyle',':');
line([9.5,9.5],[-100,100],'linestyle',':');
line([12.5,12.5],[-100,100],'linestyle',':');
set(gca,'XTickLabel',{''});
dim = [0.15 0.6 0.3 0.3];
str = {'CR','p=5,10,15'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.31 0.6 0.3 0.3];
str = {'RR','p=5,10,15'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.47 0.6 0.3 0.3];
str = {'OB(Pen)','p=5,10,15'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.61 0.6 0.3 0.3];
str = {'M-MD','p=5,10,15'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');
dim = [0.77 0.6 0.3 0.3];
str = {'M-R','p=5,10,15'};
annotation('textbox',dim,'String',str,'FitBoxToText','on','EdgeColor','none');

xlabel('Different Methods');ylabel('Estimated Value');title('Comparison via Simulation for Different Covariates Number(5,10,15)');
%saveas(gcf,'E:\大四下\数学系毕设\Plot\paperplot\diffcovariates.eps')
hold off;
close(figure(gcf));





