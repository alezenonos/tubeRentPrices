function result=BASIS_FUNCTION(params)
x=params(:,1:2);

[mu,s]=CONSTANTS;

%Create the design matrix using Gaussian Basis function
% S = [s(1)^2 0;0 s(2)^2];
% S=cov(s)

for i=1:length(x(:,2))
    for j=1:length(mu)
    
    fofx(i,j) = exp(-0.5*(x(i,:)-mu(j,:))*(s\(x(i,:)-mu(j,:))')); %£797.1341 error
    %fofx(i,j)=exp(-0.5*(((x(i,1)-mu(j,1)).^2/s(1,1).^2)+((x(i,2)-mu(j,2)).^2/s(1,2).^2)));
    %%£799.7927 error
    end
%     fofx(i,1)=exp(-0.5*(((x(i,1)-mu(1,1)).^2/s(1,1).^2)+((x(i,2)-mu(1,2)).^2/s(1,2).^2))); 
end

% plot3(x(:,1),x(:,2),fofx,'o')

result=fofx;
end