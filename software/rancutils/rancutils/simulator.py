
import numpy as np

def collect_votes_from_simulator(filename, num_classes=10):
    """
    Given an output from a neural network's output core in the simulator, this function collapses all the votes into a score for each class
    See software/tealayers/tealayer2.0/additivepooling.py for more information about the strided layout of class labels 
    """
    votes = None
    with open(filename) as file:
        lines = file.readlines()
        votes = np.zeros((len(lines), num_classes))
        for linenum, line in enumerate(lines):
            individual_votes = np.array(line.split(' '))
            for class_num in range(num_classes):
                votes_for_class = list(filter(lambda vote: vote == '0' or vote == '1', individual_votes[class_num:len(individual_votes):num_classes]))
                votes_for_class = list(map(lambda vote: int(vote), votes_for_class))
                votes[linenum, class_num] = np.sum(votes_for_class)
    return votes

def collect_classifications_from_simulator(filename, num_classes=10, verbose=False):
    """
    Given an output from a neural network's output core in the simulator, this function collapses all the votes into a score for each class
    And then collapses again by performing an argmax across a given row to determine the class label for a given input
    See software/tealayers/tealayer2.0/additivepooling.py for more information about the strided layout of class labels 
    """
    votes = collect_votes_from_simulator(filename, num_classes=num_classes)
    classifications = -1 * np.ones(votes.shape[0])
    for i in range(votes.shape[0]):
        decision = np.where(votes[i, :] == max(votes[i, :]))[0]
        if verbose and len(decision) > 1:
            print(f"There's a tie in voting at index {i}. Possible classes are {decision}. Picking {decision[0]}")
        classifications[i] = decision[0]
    return classifications