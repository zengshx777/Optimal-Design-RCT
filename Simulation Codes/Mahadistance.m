function [distance] = Mahadistance(M)
%Function to Calculate Mahadistance Between Observations Based on the
%Covariates Matrix
distance=diag(ones(size(M,1),1)*size(M,1)*1000);
for i=1:size(M,1)
for j=(i+1):size(M,1)
distance(i,j)=(M(i,:)-M(j,:))/cov(M)*(M(i,:)-M(j,:))';
end
end

end

