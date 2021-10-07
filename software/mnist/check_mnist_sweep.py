import sys
import argparse

import numpy as np
from rancutils.simulator import collect_classifications_from_simulator

def check_model_vs_simulator(tf_output_path, simulator_output_path, correct_output_path, simulator_offset=2):
    tf_output = np.load(tf_output_path)
    simulator_output = collect_classifications_from_simulator(simulator_output_path, num_classes=10)
    correct_output = np.load(correct_output_path)
    
    tf_output = tf_output[:(len(simulator_output)-simulator_offset)]
    tf_output_flat = np.array([0] * tf_output.shape[0])
    for i in range(tf_output.shape[0]):
        output_i = tf_output[i, :]
        decision = np.where(output_i == max(output_i))[0]
        if len(decision) > 1:
            decision = decision[0]
        tf_output_flat[i] = decision
    tf_output = tf_output_flat
    
    correct_output_flat = np.array([0] * correct_output.shape[0])
    for i in range(correct_output.shape[0]):
        output_i = correct_output[i, :]
        decision = np.where(output_i == max(output_i))[0]
        if len(decision) > 1:
            decision = decision[0]
        correct_output_flat[i] = decision
    correct_output = correct_output_flat

    simulator_output = simulator_output[simulator_offset:]
    #print(tf_output == simulator_output)
    if all(tf_output == simulator_output):
        print("Tensorflow output matches simulator output exactly!")
        print(f"Testing accuracy against known class labels is {(len(np.where(tf_output == correct_output[:len(tf_output)])[0]) / len(tf_output)) * 100}%")
        return 0
    else:
        print("There are differences :(")
        print(f"Differences are in indices {np.where(tf_output != simulator_output)}")
        print(f"Tensorflow thought the classes were {tf_output[np.where(tf_output != simulator_output)]}")
        print(f"The simulator thought the classes were {simulator_output[np.where(tf_output != simulator_output)]}")
        return 1

def get_arg_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument("tf_output_path", type=str)
    parser.add_argument("simulator_output_path", type=str)
    parser.add_argument("correct_output_path", type=str)
    parser.add_argument("--simulator_offset", type=int, default=2, required=False)
    return parser

if __name__ == "__main__":
    parser = get_arg_parser()
    args = parser.parse_args()
    return_code = check_model_vs_simulator(args.tf_output_path, args.simulator_output_path, args.correct_output_path, args.simulator_offset)
    sys.exit(return_code)
