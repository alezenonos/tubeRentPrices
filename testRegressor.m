% results = testRegressor(testIn, params)
% 
% testRegressor uses a mapping that has been trained by trainRegressor to
% predict the one-dimensional outputs for the two-dimensional inputs
% testIn.
%
% Inputs:
%
% testIn    testing input locations. Size: Nx2
%
% params    output of trainRegressor function
%
% Outputs:
%
% results   predicted price to rent at the input locationss. Size: Nx1
%
function results = testRegressor(testIn, params)
%Do not modify the line above!
fofx=BASIS_FUNCTION(testIn);
%size(fofx)

%size(params)
%size(fofx)
% fofx(1:10,:)
ExpectedValues = fofx*params;

results=ExpectedValues;
end