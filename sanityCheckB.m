% sanityCheckB(trainFunc,testFunc)
%
% sanityCheckB will check if the functions trainClassifierXXX and testClassifierXXX
% conform to the accepted programming interface.
% sanityCheck will not check if the values of results are reasonable, only
% that the right number of results are returned.
%
% Inputs:
%
% trainFunc    to test your classifiers type:    @trainClassifierXXX
%
% testFunc     to test your classifiers type:    @testClassifierXXX
%
% These are function handles which you may not be familiar with and are not
% within the scope of this course. Ask a TA if you want to know more.
%
function sanityCheckB(trainFunc,testFunc)
%generate some data
trainData=rand(randi([90 110],1),31);
testData=rand(randi([90 110],1),30);
trainIn=trainData(:,1:30);
trainOut=trainData(:,31)>0.5;%a vector of ones and zeros
testIn=testData;
%train classifier
try
    param=trainFunc(trainIn,trainOut);
catch exception
    fprintf('Something went wrong in your training Function:\n')
    fprintf(exception.message)
    fprintf('\n\n')
    return
end
%test classifier
try
    results=testFunc(testIn,param);
catch exception
    fprintf('Something went wrong in your testing Function:\n')
    fprintf(exception.message)
    fprintf('\n\n')
    return
end
%check correct number of results is returned
if(((size(results,1)==length(testIn))...
        &...
        (size(results,2)==1))...
        |...
        ((size(results,2)==length(testIn))...
        &...
        (size(results,1)==1)))
    fprintf('Congratulations, your functions return the correct number of results.\n')
else
    fprintf('your testing function did not return the correct number of results.\n')
end
if(~all( results==1 | results==0 ) )
    fprintf('your testing function did not return zeros and ones as classification labels.\n')
end
