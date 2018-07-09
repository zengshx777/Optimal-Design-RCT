%Given Distance Matrix to Partition Sample into two groups
function [ First,Second ] =GreedyMatching( Distance )
% Apply Greedy Matching to Find the Optimal Pairs
n=size(Distance,1);
First=zeros(n/2,1);
Second=zeros(n/2,1);
for i=1:(n/2)
    ingroup=union(First,Second);
    ungroup=setdiff(1:n,ingroup);
[a,index]=min(Distance(ungroup(1),:));
First(i)=ungroup(1);
Distance(:,ungroup(1))=10000;
Second(i)=index;
Distance(:,index)=10000;
end
end

