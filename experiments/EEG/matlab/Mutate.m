% Mutate
% *************************
% Authors: Ewan Nurse and Philippa Karoly
% Modified: 2013

% called by Neural_Network_Classifier

% DESCRIPTION:
% Mutates input binary population
%
% INPUTS:
% pop = binary population to mutate
% rate = mutation rate as percentage e.g. 0.02 = 2%
%
% OUTPUTS:
% pop = mutated population

function pop = Mutate(pop, rate, bits)

% divide rate by number of bits in each individual
rate = rate/bits;
%Generate matrix of random numbers the size of pop
Mut_Array = rand(size(pop));
%Generate vector that retains indicies of Mut_Array with probability 'rate'
Mut_Index = find(Mut_Array>(1-rate));

for j = 1:length(Mut_Index)
    if sum(pop(Mut_Index(j))~=0)
        pop(Mut_Index(j)) = not(pop(Mut_Index(j)));
    end %if
end %for
    
end %Mutate