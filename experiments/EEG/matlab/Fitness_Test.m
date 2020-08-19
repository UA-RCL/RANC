% Mutate
% *************************
% Authors: Ewan Nurse and Philippa Karoly
% Modified: 2013

% called by Neural_Network_Classifier

% DESCRIPTION:
% Calculates fitness of input vector x. Uses simulated annealing to
% decrease Cohen's Kappa of output network. Trains on input data set and tests
% fitness against labels. Passes out calculated highest fitness and network.
%
% INPUTS:
% x = input hidden layer sizes
% Anneal_Its = number of simulated annealing iterations
% input = training data
% target = data labels
%
% OUTPUTS:
% fitness = Cohen's kappa score of network
% Network_Store = final network

function [fitness, Network_Store] = Fitness_Test(x,Anneal_Its,input,target,test_ind)

%divide data into test and training
test_input = input(:,test_ind);
input(:,test_ind) = [];
test_target = target(:,test_ind);
target(:,test_ind) = [];
%Initialise network
% Set up a network with configuration from vector x
% e.g. [80 60 20] would be a 3 hidden layer network with 80, 60 and 20
% neurons respectivly
net = patternnet(x','trainscg');
net.divideFcn = 'dividerand';
net.trainParam.max_fail = 10;
% Set aside 80% of data to train on
net.divideParam.trainRatio = 80/100;
% 20% to use as a validation set
net.divideParam.valRatio = 20/100;
%no test set (already partioned)
net.divideParam.testRatio = 0/100;


% Initial training of network
best_fitness = 1;
count = 0;
% Simulated annealing parameters. Currently set for annealits=10, need to
% find formulae to generalise their values as much as possible
T = 1;
Cooling_Factor = 0.9;

% Keep training until a maximum number of annealing iterations
% is reached
for i = 1:Anneal_Its
    %Iterate through layers of the network
    for k = 1:length(x)
        %Find weights for every neuron
        weights = cell2mat(net.LW(k+1,k));
        %Perturb by adding from uniform distribution [-value,value]
        weights = -0.5*weights + weights.*rand(size(weights));
        %Update network weights
        net.LW(k+1,k) = {weights};
    end
    % Retrain network
    net = train(net,input,target);
    %Calculate fitness
    [err, conf] = confusion(test_target,net(test_input));
    acc = 1 - err;
    %Cohens' kappa value
    n = 0;
    for j = 1:size(conf,1)
        n = n + sum(conf(j,:))*sum(conf(:,j));
    end %for
    
    Pe = n/(sum(sum(conf))^2);
    Kappa = (acc-Pe)/(1-Pe);
    
    fitness = 1-Kappa;
    %Compare fitness
    %If better than previous save best fitness and network
    if fitness <= best_fitness
        best_fitness = fitness;
        best_net = net;
        %If not better, take new network with some probability
    else
        if exp((best_fitness-fitness)/T) > rand
            best_fitness = fitness;
            best_net = net;
            count = count + 1;
        end %if
    end %else
    
    %Cool
    T = T * Cooling_Factor;
    
end %for

% Store the final network
Network_Store = best_net;
end %Fitness_Test