% params = trainClassifierKNN(trainIn, trainOut)
%
% trainClassifierKNN builds a K nearest neighbours classifier from
% 30-dimensional input to one-dimensional binary output.
%
% trainClassifierKNN returns a structure that contains all information needed
% for testClassifierKNN.
%
% Inputs:
%
% trainIn    training inputs. Size: Nx30
%
% trainOut   training output labels. Size: Nx1
%
% Outputs:
%
% params    output of trainClassifierKNN function
%
function params = trainClassifierKNN(trainIn, trainOut)
%Do not modify the line above!
%trainIn=trainIn(1:10,1:5);
K=10;%number of neighbours
for example1Number=1:(length(trainIn(:,1)))
    for example2Number=1:length(trainIn(:,1))
        total=0;
        for column=1:length(trainIn(1,:))
            total=total+(trainIn(example1Number,column)-trainIn(example2Number,column)).^2;
        end
        if example1Number ~= example2Number
            d(example1Number,example2Number)=sqrt(total); %distance matrix between all the points
        else
            d(example1Number,example2Number)=inf; %distance matrix between itself
        end
        
    end
    
end

for i=1:length(trainIn(:,1))
    
    for kappa=1:K
        for k=1:kappa
            [~,x(i,k)]=min(d(i,:)); %index of closest point
            d(i,x(i,k))=NaN;
            closestPointsValues(i,1)=trainOut(x(i,k),1);% the classes of the points that are closest to the Xi
            
        end
        classForXi(i,kappa)=mode(closestPointsValues(i,:));%class for Xi when K=kappa
    end
end

%classForXi

%Claculate the prediction rate for every K value
for k=1:K
    correct=0;
    for j=1:length(trainIn(:,1))
        if (classForXi(j,k)==trainOut(j,1))
            correct=correct+1;
        end
        
    end
    predictionRate(k,1)=correct/length(trainOut(:,1));
end

%predictionRate

%Find the best value for K
[maxPrediction,OptimalK]=max(predictionRate);


params.k=OptimalK;
params.trainOut=trainOut;
params.trainIn=trainIn;

end