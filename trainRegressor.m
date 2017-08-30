% params = trainRegressor(trainIn, trainOut)
% 
% trainRegressor builds a mapping from two-dimensional input to
% one-dimensional output.
%
% trainRegressor returns a structure that contains all information needed
% for testRegressor.
%
% Inputs:
%
% trainIn    training input locations. Size: Nx2
%
% trainOut   training output prices. Size: Nx1
%
% Outputs:
%
% params    output of trainRegressor function
%
function params = trainRegressor(trainIn, trainOut)
%Do not modify the line above!
%Filter locations that are not in London
[locations prices]=FILTER_LOC(trainIn,trainOut);
%Filter prices that are zero and concat matrices
data=FILTER_PRICE(locations,prices);
%plot3(data(:,1),data(:,2),data(:,3),'o');

fofx=BASIS_FUNCTION(data);
%size(fofx)
%size(data(:,3))
%size(prices)
%size(pinv(fofx))
%data(:,3)
% fofx(1:10,:)
Wml=pinv(fofx)*data(:,3);
%size(Wml)
params=Wml;
end