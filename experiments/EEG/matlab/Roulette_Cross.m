% Roulette_Cross
% *************************
% Authors: Ewan Nurse and Philippa Karoly
% Modified: 2013

% called by Neural_Network_Classifier

% DESCRIPTION:
% Uses Roulette style selection and one-point crossover to produce next
% generation for genetic algorithm
%
% INPUTS:
% Pop = input binary population
% Fitness = ranked fitnesses of the population
% Pop_Size = number of individuals in population
% Child_Num = number of children to be produced
%
% OUTPUTS:
% Pop = next generation

function Pop = Roulette_Cross(Pop, Fitness, Pop_Size, Child_Num)

%Produce a vector of the cumulitive population fitness
Fit_Cumul = cumsum(1-Fitness)/sum(1-Fitness);

Old_Bin_Pop = Pop;

%Creates new population of previous elites and new children formed by
%roullete style single-point crossover
for j = Pop_Size - Child_Num + 1:Pop_Size
    spins = rand(2,1);
    Parent_Ind(1) = find(Fit_Cumul > spins(1),1,'first');
    Parent_Ind(2) = find(Fit_Cumul > spins(2),1,'first');
    
    Crosspoint = randi([1 size(Pop,2)]);
    Pop(j,:) = [Old_Bin_Pop(Parent_Ind(1),1:Crosspoint),...
        Old_Bin_Pop(Parent_Ind(2),Crosspoint+1:size(Pop,2))];
end %for

end %Roulette_Cross