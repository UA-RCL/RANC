% Pop_2_Binary
% *************************
% Authors: Ewan Nurse and Philippa Karoly
% Modified: 2013

% called by Neural_Network_Classifier

% DESCRIPTION:
% Converts input decimal population to binary
%
% INPUTS:
% pop = decimal population [neurons, individuals]
% neurons = maximum number of neurons in a layer
% size = number of individuals in the population
% layers = maximum layers an individual can have
%
% OUTPUTS:
% binary_pop = binary population
% num_bits = number of bits that were required

function [binary_pop, num_bits] = Pop_2_Binary(pop,max_neurons,size,layers)

%Calculate bits required to represent maximum number of neurons
num_bits = length(de2bi(max_neurons));

%Convert population to binary, with each individual represented by 'num_bits'
%number of bits
binary_pop = de2bi(pop,num_bits);

%Reshape population
binary_pop = reshape(binary_pop,size,num_bits*layers);
end %Pop_2_Binary