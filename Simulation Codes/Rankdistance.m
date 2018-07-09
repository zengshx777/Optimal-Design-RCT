function [ distance ] = Rankdistance(M)
%Function to Calculate Rank Distance Based on the Covariates Value
[A,index]=sort(M);
distance=diag(ones(size(M,1),1)*size(M,1)*1000);
for i=1:size(M,1)
for j=(i+1):size(M,1)
    distance(i,j)=sum(abs(index(i,:)-index(j,:)));
end
end
end

