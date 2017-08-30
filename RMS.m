function Erms=RMS(predicted,target)
%Provide the predicted prices as calculated from testRegressor and the
%corresponding target function
%Find Squared Error
targetFunction=target;
ExpectedValues=predicted;
Ew=0;
for i=1:length(target)
Ew=Ew+(ExpectedValues(i)-targetFunction(i)).^2;
end
Ew = 0.5*Ew;
Erms=sqrt(2*Ew/length(target));
end