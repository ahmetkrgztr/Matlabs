% Number of observations of each class
n1=size(class0,1);
n2=size(class1,1);
N=n1+n2;
%Mean of each class
mu1=mean(c1);
mu2=mean(c2); 
% Average of the mean of all classes
mu=((n1/N)*mu1+(n2/N)*mu2);
% Center the data (data-mean)
d1=c1-repmat(mu1,size(c1,1),1);
d2=c2-repmat(mu2,size(c2,1),1);
% Calculate the within class variance (SW)
s1=d1'*d1 ;
s2=d2'*d2 ;
sw=s1+s2 ;
invsw=inv(sw);
% in case of two classes only use v
v=invsw*(mu1-mu2)';
% if more than 2 classes calculate between class variance (SB)
% sb1=n1*(mu1-mu)'*(mu1-mu);
% sb2=n2*(mu2-mu)'*(mu2-mu);
% SB=sb1+sb2;
% v=invsw*SB;
% find eigne values and eigen vectors of the (v)
[evec,eval]=eig(v);
% Sort eigen vectors according to eigen values (descending order) and
% neglect eigen vectors according to small eigen values
% v=evec(greater eigen value)
% or use all the eigen vectors
% project the data of the first and second class respectively
y1=c1*evec(:,2);
y2=c2*evec(:,2);
% You can check the other eigenvector (evec(:,1))
