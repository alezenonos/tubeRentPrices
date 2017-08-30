function [mu,s]=CONSTANTS
load('QuestionA.mat')
[location,rent]=FILTER_LOC(prices.location,prices.rent);
M=FILTER_PRICE(location,rent);
location=M(:,1:2);
%rent=M(:,3);
% mu=mean(location);
%s=std(location);
%s = cov(location);
% Create mu and sigma length based on location's quartiles
% Sort based on Latitude
x1Sorted=sortrows(location,1);
Q1Index=floor(length(x1Sorted)/4);
Q3Index=floor(3*length(x1Sorted)/4);


%Sort based on Longitude-notused
x2Sorted=sortrows(location,2);


j=1;
NumberOfMus=200;% This will be the column size of the "Design Matrix" 200
stepSize=floor((Q3Index-Q1Index)/(NumberOfMus/2));
%Create mu based on Interquartile range values
for i=Q1Index:stepSize:Q3Index
mu1(j,:)=x1Sorted(i,:);
mu2(j,:)=x2Sorted(i,:);
%mu3(j,:)=vertcat(mu1(j,:),mu2(j,:));
%s(j,:)=cov(mu3(j,:));
j=j+1;
end



mu=vertcat(mu1,mu2);%use
s=cov(mu);%covariance of the locations 797.1341
%s=std(mu);%799.7927
end
%me 400 ->793.3255