function class=CLASSIFIERKNN(input,target)
trainNumber=round(length(input)/2);

trainedData=input(1:trainNumber,:);
targetValues=target(1:trainNumber,:);
testData=input(trainNumber+1:end,:);

testValues=target(trainNumber+1:end,:);

% train=trainClassifierKNN(trainedData,targetValues);
% test=testClassifierKNN(testData,train);
% 
% %Calculate classifier's performance
% correct=0;
% for j=1:length(testData(:,1))
%     if (test(j,1)==testValues(j,1))
%         correct=correct+1;
%     end  
% end
% predictionRate=correct/length(test(:,1))


%Crossvalidation
M=1;
N=length(input);
CrossValidation = 0;
iter=569;
for i = 1:iter
[Train, Test] = crossvalind('LeaveMOut',N, M);

testTarget=target(Test,:);
train2=trainClassifierKNN(input(Train,:),target(Train,:));
test2=testClassifierKNN(input(Test,:),train2);

correct=0;
    for j=1:length(test2(:,1))
        if (test2(j,1)==testTarget(j,1))
            correct=correct+1;
        end
        
    end
    CrossValidation= CrossValidation + correct/length(test2(:,1))
end

CrossValidationRate=CrossValidation/iter

class.cross=CrossValidationRate;
end