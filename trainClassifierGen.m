% params = trainClassifierGen(trainIn, trainOut)
% 
% trainClassifierGen builds a Generative classifier from 30-dimensional input to
% one-dimensional binary output.
%
% trainClassifierGen returns a structure that contains all information needed
% for testClassifierGen.
%
% Inputs:
%
% trainIn    training inputs. Size: Nx30
%
% trainOut   training output labels. Size: Nx1
%
% Outputs:
%
% params    output of trainClassifierGen function
%
function params = trainClassifierGen(trainIn, trainOut)
%Do not modify the line above!