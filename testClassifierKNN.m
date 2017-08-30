% results = testClassifierKNN(testIn, params)
%
% testClassifierKNN uses a nearest neighbour Classifier that has been trained by
% trainClassifierKNN to predict the binary labels for the 30-dimensional
% inputs testIn (cancer or no cancer).
%
% Inputs:
%
% testIn    testing inputs. Size: Nx30
%
% params    output of trainClassifierKNN function
%
% Outputs:
%
% results   predicted presence of cancer. Size: Nx1
%
function results = testClassifierKNN(testIn, params)
%Do not modify the line above!
K=params.k;
trainOut=params.trainOut;
trainIn=params.trainIn;
%Create distance matrix of each of the testing points using Euclidean
%distance formula
for example1Number=1:(length(testIn(:,1)))
    for example2Number=1:length(testIn(:,1))
        total=0;
        for column=1:length(testIn(1,:))
            total=total+(testIn(example1Number,column)-trainIn(example2Number,column)).^2;
        end
        if example1Number ~= example2Number
            d(example1Number,example2Number)=sqrt(total); %distance matrix between all the points
        else
            d(example1Number,example2Number)=inf; %distance matrix between itself
        end
        
    end
    
end
%d
for i=1:length(testIn(:,1))
    for k=1:K
        [~,x(i,k)]=min(d(i,:)); %index of closest point
        d(i,x(i,k))=NaN;
        closestPointsValues(i,1)=trainOut(x(i,k),1);% the classes of the points that are closest to the Xi
        
    end
    classForXi(i,1)=mode(closestPointsValues(i,:));%class for Xi when K=optimum
end

correct=0;
    for j=1:length(testIn(:,1))
        if (classForXi(j,1)==trainOut(j,1))
            correct=correct+1;
        end
        
    end
    predictionRate=correct/length(trainOut(:,1));
    
results=classForXi;
end