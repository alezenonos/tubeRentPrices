function meanError=CROSSVALIDATION
%Load location and rent from file
load('QuestionA.mat')
[location,rent]=FILTER_LOC(prices.location,prices.rent);
M=FILTER_PRICE(location,rent);
location=M(:,1:2);
rent=M(:,3);
%Split data to folds and calculate rms for each fold
N=length(location);
indices = crossvalind('Kfold',N,10);
rms=0;
for i = 1:10
    test = (indices == i); train = ~test;
    trainData=trainRegressor(location(train,:),rent(train,:));
    testData=testRegressor(location(test,:),trainData);
    rms=rms+RMS(testData,rent(test,:));
end
meanError=rms/10;%797.6239

end