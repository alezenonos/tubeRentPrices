% results = testClassifierGen(testIn, params)
% 
% testClassifierGen uses a Generative Classifier that has been trained by
% trainClassifierGen to predict the binary labels for the 30-dimensional
% inputs testIn (cancer or no cancer).
%
% Inputs:
%
% testIn    testing inputs. Size: Nx30
%
% params    output of trainClassifierGen function
%
% Outputs:
%
% results   predicted presence of cancer. Size: Nx1
%
function results = testClassifierGen(testIn, params)
%Do not modify the line above!