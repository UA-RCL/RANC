% Neural_Network_Classifier
% *************************
% Authors: Ewan Nurse and Philippa Karoly
% Modified: 2013
%
% Requires Neural Network Toolbox and Parallel Computing Toolbox for operation.
%
% Description
% ************
% This script is used to create a neural network classifier. It creates a
% multi-layer perceptron that trains using simulated annealing to avoid
% training into local minima. A genetic algorithm is used to optimise the
% number of layers and neurons in each layer.
%
% Required Variables
% ******************
% data:
% N x M matrix of data epochs where N is the length of the epoch and
% M is the number of examples for network training
%
% target:
% 1 x M vector containing the class indicators that correspond to
% the data epochs. i.e. for a 3-class problem target contains integers 1,2
% and 3 ordered by the class of the data epochs
%
% Call Functions Used
% *******************
% Pop_2_Dec, Mutate, Roulette_Cross, Pop_2_Binary, Fitness_Test

clc
close all

%% Define Variables

% Population Parameters
%*********************
%Maximum number of hidden layers in each network
Max_Layers = 3;
%Maximum number of neurons per hidden layer
Max_Neurons = 200;
%Minimum number of neurons per hidden layer
Min_Neurons = max(max(target));
%Number of networks per generation
Pop_Size = 30;

% Genetic Algorithm Parameters
%******************************
%Number of generations GA will iterate through
Max_Gen = 20;
%Number of elites (fittest individuals automatically carried through to the
%next generation)
Elite_Num = 1;
%Probability of mutation for each bit in the genome
Mut_Rate = 2/100;

%Network Training Parameters
%*****************************
%Number of iterations of simulated annealing
Anneal_Its = 10;
%Percentage of data allocated for testing to calculate fitness
Test_Percent = 15;

%Initialising
Fitness = ones(1,Pop_Size);
Network_Store = cell(Pop_Size, 1);

Min_Fit = ones(1,Max_Gen);
Max_Fit = ones(1,Max_Gen);
Mean_Fit = ones(1,Max_Gen);

Sens = zeros(1, Min_Neurons);
Spec = zeros(1, Min_Neurons);

%% Allocate Test/Training Data 
%If needed, split data into test and training sets
%Data allocated for final analysis of the network (use 0% if you want to
%train with all the data
Test_Set_Percent = 15;

%Randomly divide data into training and testing subsets
if Test_Set_Percent ~= 0
    n = round((Test_Set_Percent/100) * size(data,2));
    test_ind = randperm(size(data,2),n);

    train_ind = 1:size(data,2);
    train_ind(test_ind) = [];

    input_train = data(:,train_ind);

    input_test = data(:,test_ind);
    %vectorise target vector
    target_train = target(train_ind);
    target_train = ind2vec(target_train);
    target_train = full(target_train);

    target_test = target(test_ind);
    target_test=ind2vec(target_test);
    target_test = full(target_test);

else input_train = data;
     target_train = target;
     target_train = ind2vec(target_train);
     target_train = full(target_train);
end


%% Genetic Algorithm
%Generate Intial Population ([Number of neurons, individuals])
Pop = randi([Min_Neurons Max_Neurons], Max_Layers, Pop_Size);

%Force approximate equal disdtribution of number of layers
LayerMatrix = zeros(Max_Layers,Pop_Size);

for j = 1:Max_Layers
    LayerMatrix(j, 1:floor(j*Pop_Size/Max_Layers)) = ...
        LayerMatrix(j, 1:floor(j*Pop_Size/Max_Layers)) + 1;
end

Pop = Pop.*LayerMatrix;

%Begin iterating through generations
for i = 1:Max_Gen
    
    %Calculate Fitness
    n = round((Test_Percent/100) * size(input_train,2));
    fit_test_ind = randperm(size(input_train,2),n);
    
    for f = 1:Pop_Size
        x = Pop(:,f);
        [Fitness(f), Network_Store{f}] = Fitness_Test(x(x~=0),Anneal_Its,input_train,target_train,fit_test_ind);
    end
    
    %Ranking population by fitness and saving the best network found
    [Fitness, Fit_Index] = sort(Fitness);
    Pop = Pop(:,Fit_Index);
    
    if Fitness(1) < min(Min_Fit)
        Best_Net = Network_Store{Fit_Index(1)};
    end
    
    % Keep track of best, average and worst fitness
    Min_Fit(i) = Fitness(1);
    Max_Fit(i) = Fitness(Pop_Size);
    Mean_Fit(i) = mean(Fitness);
    
    % Plot Fitness data
    plot(Mean_Fit(1:i),'r*');
    hold on
    plot(Min_Fit(1:i),'bo');
    hold on
    plot(Max_Fit(1:i),'go');
    legend('Mean Error', 'Minimum Error','Maximum Error');
    axis([1 Max_Gen 0 2]);
    
    % If it is the last generation, stop GA after fitness calculations
    if i == Max_Gen
        break
    end
    
    %Crossover
    %Convert population into binary
    [Bin_Pop, Bits] = Pop_2_Binary(Pop,Max_Neurons,Pop_Size,Max_Layers);
    
    %Roulette crossover
    Roulette_Cross(Bin_Pop, Fitness, Pop_Size, Pop_Size-Elite_Num);
    
    %Mutation
    Mutate(Bin_Pop,Mut_Rate,Bits);
    
    %Convert to decimal
    Pop = Pop_2_Dec(Bin_Pop,Pop_Size,Max_Layers,Bits);
    
end %for

%% Analysis of fittest neural network
%Find network size
Net_Layers = Best_Net.numlayers-1;
Hidden_Layers = zeros(1,Net_Layers);
for i = 1:Net_Layers
    Hidden_Layers(i) = Best_Net.layers{i}.dimensions;
end

%Calculation of classification accuracy on unseen data
if Test_Set_Percent ~= 0
    [Test_Error, Conf] = confusion(target_test,Best_Net(input_test));
    %MATLAB outputs a transposed confusion matrix
    Conf = Conf';
    Test_Accuracy = 1 - Test_Error;
    %Cohen's Kappa calculation
    n=0;
    for j = 1:size(Conf,1)
        n = n + sum(Conf(j,:))*sum(Conf(:,j));
    end %for
    
    Pe = n/(sum(sum(Conf))^2);
    Test_Kappa = (Test_Accuracy-Pe)/(1-Pe);
end %if

