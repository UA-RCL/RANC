% Pop_2_Dec
% *************************
% Authors: Ewan Nurse and Philippa Karoly
% Modified: 2013

% called by Neural_Network_Classifier

% DESCRIPTION:
% Converts population from decimal to binary
%
% INPUTS:
% binary_pop = the population represented in binary
% size = population size
% layers = max number of hidden layers
% bits = number of bits in the binary representation
%
% OUT:
% pip = the binary population

function pop = Pop_2_Dec(binary_pop, size, layers,bits)
binary_pop = reshape(binary_pop,size*layers,bits);
pop = reshape(bi2de(binary_pop),layers,size);
end %Pop_2_Dec