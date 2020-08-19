'''
This script is used to test the VMM conversion functionality of 
rancutils. Tests can just determine if the right answer
was calculated (using a random or hardcoded matrix and vector)
or it can be used to see if the spiking behavior matches Compass
on a tick-by-tick basis. The outputs of Compass have been provided
by Kaitlin Fair of Air Force Research Lab in the form of a .mat 
file.
'''

import numpy as np
from vmmmap import vmm_fair_create_cores_and_packets
from vmmmap import vmm_synapse_index_create_cores_and_packets
from vmmmap import read_vmm_output
from rancutils import save
import subprocess
from scipy.io import loadmat
import matplotlib.pyplot as plt
import click
import json

 

def print_vmm_results(
        matrix, 
        vector, 
        correct_solution, 
        tn_vector_output, 
        tn_neuron_output):
    '''
    Prints all the results pertaining to a VMM run on the simulator

    Arguments:
        matrix -- The matrix in the VMM
        vector -- The vector in the VMM
        correct_solution -- The mathematical solution of the VMM
        tn_vector_output -- The solution vector outputted by the simulator
        tn_neuron_output -- The number of times each output neuron spiked
    '''
    print("Matrix:")
    print(matrix)
    print("Vector:")
    print(vector)
    print("Correct solution:")
    print(correct_solution)
    print("TrueNorth vector output:")
    print(tn_vector_output)
    if np.array_equal(tn_vector_output, correct_solution):
        print("Outputs matched on solution basis")
    else:
        print("[ERROR] Outputs did not match on solution basis")
        exit(1)
  
    print("TrueNorth neuron output:")
    print(tn_neuron_output)

    

def print_vmm_comp_results(
        matrix, 
        vector, 
        correct_solution, 
        tn_vector_output, 
        tn_neuron_output, 
        tn_spike_output, 
        mat_neuron_output, 
        mat_spike_output):
    '''
    Print all the results pertaining to comparing th VMM on the simulator to a
    .mat file with results from Compass

    Arguments:
        matrix -- The matrix in the VMM
        vector -- The vector in the VMM
        correct_solution -- The mathematical solution of the VMM
        tn_vector_output -- The solution vector outputted by the simulator
        tn_neuron_output -- The number of times each output neuron spiked
        tn_spike_output -- The tick-by-tick spikes for each neuron 
                           from the simulator
        mat_neuron_output -- The number of times each output neuron spiked in 
                             Compass
        mat_spike_output -- The tick-by-tick spikes for each neuron in Compass
    '''

    print_vmm_results(
        matrix, 
        vector, 
        correct_solution, 
        tn_vector_output, 
        tn_neuron_output)
    print("mat file neuron output:")
    print(mat_neuron_output)
    print("Comparing all outputs with .mat file...")
      
    if np.array_equal(tn_neuron_output, mat_neuron_output):
        print("Outputs matched on neuron basis")
    else:
        print("[ERROR] Outputs did not match on neuron basis")
        exit(1)
   
    '''
    Checking if the spiking behavior is the same on a tick-by-tick
    basis 
    ''' 
    if np.array_equal(tn_spike_output[:, :], mat_spike_output):
        print("Outputs matched on tick-by-tick spike basis")
    else:
        print("[ERROR] Outputs did not match on tick-by-tick spike basis")
        for neuron in tn_spike_output.shape[0]:
            if not np.array_equal(tn_spike_output[neuron, :], mat_spike_output[neuron, :]):
                print("Neuron {} didn't match tick-by-tick".format(neuron))
                print("Sim output: {}".format(tn_spike_output[neuron, :]))
                print(".mat output: {}".format(mat_spike_output[neuron, :]))
        exit(1)


def read_structured_np_array(data, is_batch = False, iteration = 0):
    '''
    Reads data from the .mat file, which is read as a structured numpy 
    array, and returns just the information that is used in the comparison.
    Note that this function is hardcoded for how Kaitlin currently has been
    organizing the .mat files and it will break if the organization is 
    changed.

    Arguments:
        data -- The structured numpy array which contains all of the data 
                from Compass

    Keyword Arguments:
        is_batch -- Whether the numpy array contains a batch of VMMs 
                    (default: {False})
        iteration -- Which element of the batch to read 
                     (default: {0})
    '''
 
    if is_batch:
         data = data['testcase'][0][iteration]
    else:
        data = data['testcase']
    
    matrix = np.asmatrix(data['matrix'][0][0])
    vector = np.asmatrix(data['vector'][0][0]).T
    output_spikes = data['output_spikes'][0][0]
    correct_solution = np.squeeze(np.asarray(vector * matrix))

    return matrix, vector, correct_solution, output_spikes
    

def reorder_spikes(spikes):
    '''
    Reorders spikes from the .mat file so the results can be comparred. 
    Currently the results in the .mat files have the first half neurons 
    represent the positive portions of the output and the second half 
    represent the negative portions. In the simulator, every even 
    neuron representsthe positive portion of the output and every odd 
    neuron represents the negative portions. This function reorders how 
    the .mat files are organized to be the same as the simulator.

    Arguments:
        spikes -- a numpy array containing the tick-by-tick spikes of 
                  each neuron from the .mat file
    '''
    
    num_neurons, num_ticks = spikes.shape 
    reordered_spikes = np.zeros((num_neurons, num_ticks), dtype = np.int32)
    reordered_spikes[0::2, 0:num_ticks] = spikes[0:int(num_neurons / 2), :]
    reordered_spikes[1::2, 0:num_ticks] = spikes[int(num_neurons / 2):num_neurons, :]
    return reordered_spikes


def create_tn_vmm_output(
        sim_path, 
        config_path, 
        A, 
        x, 
        num_ticks, 
        use_synapse_index = False,
        first_core_feedback = True,
        third_core_feedback = True, 
        num_neurons = 256,
        num_axons = 256):
    '''
    Maps the VMM to RANC cores and calls the simulator for the 
    given number of ticks.    

    Arguments:
        sim_path -- The path to the simulation executable
        config_path -- the path to config.json in the simulator
        A -- The matrix in the VMM
        x -- The vector in the VMM
        num_ticks -- The number of ticks to run the simulation for
    
    Keyword Arguments:
        first_core_feedback -- Whether to hookup feedback connections in
                               the first core of the corelet (Default: {True})
        third_core_feedback -- Whether to hookup feedback connections in the 
                              last core of the corelet (Default: {True})
        num_neurons -- The number of neurons in a core (Default: {256})
        num_axons -- The number of axons in a core (Default: {256})
    '''
    if use_synapse_index:
        cores, output_bus, packets, config = vmm_synapse_index_create_cores_and_packets(
                                                A,
                                                x,
                                                num_neurons = num_neurons,
                                                num_axons = num_axons)
    else:
        cores, output_bus, packets, config = vmm_fair_create_cores_and_packets(
                                                A, 
                                                x, 
                                                first_core_feedback = first_core_feedback,
                                                third_core_feedback = third_core_feedback,
                                                num_neurons = num_neurons,
                                                num_axons = num_axons)

    '''
    Saving the core and packet objects into the input json file for 
    the simulator
    '''
    if not (cores is None or packets is None):
        save('input.json', cores, packets, output_bus, indent='\t')
    else:
        print('[ERROR] Core or Packet object is NULL. ' \
              'Couldn\'t create config file')
        exit(1)

    '''
    Saving the configuration json file for the simulator so we can 
    configure the simulator with the correct grid size and number of
    neurons / axons.
    '''
    with open(config_path, 'w') as f:
        f.write(json.dumps(config, indent = '\t'))
        
    bash_cmd = '{} -i input.json -o output.txt -c ../simulator/config.json' \
               ' --ticks {} -r 1'.format(sim_path, num_ticks)

    print("Running simulator...")
    process = subprocess.Popen(bash_cmd.split(), stdout=subprocess.PIPE)
    output, _ = process.communicate()

    try:
        tn_spikes, tn_neuron_output, tn_vector_output = read_vmm_output('output.txt')
        print('Done')
    except Exception as e:
        print("[ERROR] Exception occured when reading vmm output. Dumping info.")
        print("Simulator Output:")
        print(output.decode('utf-8'))
        print("Exception string:")
        print(e)
        exit(1)
    

    return tn_spikes, tn_neuron_output, tn_vector_output


def create_spike_scatter_plot(spike_list, color_list, marker_list, filename):
    '''
    Creates a scatter plot where the y-axis is the neuron ID, the x-axis are
    the different ticks, and a dot signifies that a certain neuron spiked on
    a given tick.
    
    Arguments:
        spike_list  --  A list of numpy arrays which represent different 
                        sets of spikes to be plotted. Typically the list
                        will contain two numpy arrays, one from the simulator
                        and one from the .mat file.
        color_list  --  A list of strings that represent the color that 
                        each set of spikes in spike_list will be plotted as
        marker_list --  A list of strings that represent the markers that 
                        will be used to plot each set of spikes in spike_list
        file_name   -- The path to where the figure will be outputted to.
    '''
    num_spike_sets = len(spike_list)
    plt.figure()
    for spike_set in range(num_spike_sets):
        scatter_plt_height, _ = spike_list[spike_set].shape
        for row in range(scatter_plt_height):
            y = [row * i for i in list(spike_list[spike_set][row, :]) if i > 0]
            x = [indx for indx, val in enumerate(spike_list[spike_set][row, :]) if val > 0]
            plt.scatter(x, y, color = color_list[spike_set], marker = marker_list[spike_set])
           
    plt.xlabel("Tick")
    plt.ylabel("Neuron")
    plt.yticks([i for i in range(scatter_plt_height)])
    plt.savefig(filename)


def run_single_sim_mat_comp(
        data, 
        sim_path,
        config_path,
        is_batch = False, 
        iteration = 0):
    '''
    Goes through the entire flow of comparing a single VMM with the .mat file

    Arguments:
        data -- The structured array data from the .mat file
        sim_path -- The path to the simulator executable
    
    Keyword Arguments:
        is_batch -- Whether the .mat file contains a batch of VMMs 
                    (default: {False})
        iteration -- If the .mat file contains a batch, the index of the 
                     VMM pair to be executed.
    '''

    '''
    Reading all necessary data from .mat file
    '''
    A, x, correct_solution, mat_spike_output = read_structured_np_array(
                                                data, 
                                                is_batch = is_batch, 
                                                iteration = iteration)
    num_ticks = mat_spike_output.shape[1]
    
    '''
    Getting results in .mat file in similar order as simulator outputs
    '''
    mat_spike_output = reorder_spikes(mat_spike_output)
    mat_neuron_output = np.sum(mat_spike_output, axis = 1)
    
    '''
    Getting our results in spike, neuron, and vector representation. 
    The output bus in the simulator reports spikes the tick after they are received, 
    so we need to run the simulator for one tick more than the .mat file.
    '''
    tn_spike_output, tn_neuron_output, tn_vector_output = create_tn_vmm_output(
                                                            sim_path,
                                                            config_path,
                                                            A, 
                                                            x, 
                                                            num_ticks)

    '''
    Printing the comparison between the .mat file  and the simulator
    '''
    print_vmm_comp_results(
        A, x, correct_solution, 
        tn_vector_output, tn_neuron_output, tn_spike_output, 
        mat_neuron_output, mat_spike_output)

    return mat_spike_output, tn_spike_output

'''
Defining command line arguments
'''
@click.command()
@click.option(
    '--use_hardcoded', 
    default = False, 
    help = 'Whether to use the VMM hardcoded in the source code', 
    is_flag = True)
@click.option('--use_random', 
    default = False, 
    help = 'Whether to use a randomly generated VMM.', 
    is_flag = True)
@click.option(
    '--use_single_mat', 
    default = False, 
    help = 'Whether to use a .mat file with a single VMM', 
    is_flag = True)
@click.option('--use_batch_mat', 
    default = False, 
    help = 'Whether to use a .mat file with multiple VMMs', 
    is_flag = True)
@click.option(
    '--mat_file', 
    '-i', 
    default = 'testcase_UA.mat', 
    help = 'The path to the .mat file which defines the VMM(s)')
@click.option(
    '--first_core_no_feedback',
    default = False,
    help = 'If set the first core in the VMM corelet will not have feedback. \
            Need to be used with symmetric reset in the simulator/emulator.',
    is_flag = True)
@click.option(
    '--third_core_no_feedback', 
    default = False, 
    help = 'If set the third core in the VMM corelet will not have feedback', 
    is_flag = True)
@click.option(
    '--use_synapse_index', 
    default = False, 
    help = 'If set the core will be mapped using the indices in the synapse', 
    is_flag = True)
@click.option(
    '--sim_path', 
    '-s', 
    default = '../simulator/build/simulator', 
    help = 'Path to the simulator executable')
@click.option(
    '--config_path', 
    '-c', 
    default = '../simulator/config.json', 
    help = 'Path to the simulator configuration.json')
@click.option(
    '--matrix', 
    '-A', 
    default = '1 4 -5 -2 4 1; -6 4 0 3 6 -2; 0 -1 5 2 4 5', 
    help = 'Hardcoded matrix in MATLAB notation i.e. "a00 a01 a02 .. ; a10 a11 a12 ; ..."')
@click.option(
    '--vector', 
    '-x', 
    default = '1 1 -4', 
    help = 'Hardcoded vector in MATLAB notation i.e. "x0 x1 x2 ..."')
@click.option(
    '--height', 
    '-h', 
    default = 8, 
    help = 'The height of the randomly generated VMM.')
@click.option(
    '--width', 
    '-w', 
    default = 8, 
    help = 'The width of the randomly generated VMM.')
@click.option(
    '--num_axons',  
    default = 256, 
    help = 'The number of axons in a core.')
@click.option(
    '--num_neurons', 
    default = 256, 
    help = 'The number of neurons in a core.')




def main(
    use_hardcoded, 
    use_random, 
    use_single_mat, 
    use_batch_mat, 
    mat_file,
    first_core_no_feedback,
    third_core_no_feedback,
    use_synapse_index, 
    sim_path,
    config_path,
    matrix, 
    vector, 
    height, 
    width,
    num_axons,
    num_neurons):
    
    if use_hardcoded + use_random + use_single_mat + use_batch_mat != 1:
        print("[ERROR] Given many/no configurations. Just pick one :-)")
        exit(1)

    
    if use_single_mat:
        '''
        Running a single run of comparing .mat file and simulator. 
        Entire flow is in the called function.
        ''' 
        mat_spike_output, tn_spike_output = run_single_sim_mat_comp(
                                                loadmat(mat_file), 
                                                sim_path, 
                                                config_path,
                                                third_core_no_feedback)
        
        '''
        Generating scatter plot to visually compare spikes 
        between .mat file and simulation
        '''
        create_spike_scatter_plot(
            [mat_spike_output, 
            tn_spike_output], 
            ['red', 'blue'], 
            ['o', 'x'], 
            'comparison_spike_scatter_plot.png')

    elif use_batch_mat: 
        '''
        Iterating through every VMM pair in the .mat batch file 
        and comparing with the simulation output.
        ''' 
        data = loadmat(mat_file)
        num_pairs = len(data['testcase'][0])
        for i in range(num_pairs):
            print("********** VMM {} **********".format(i))
            run_single_sim_mat_comp(
                data, 
                sim_path,
                config_path, 
                is_batch = True, 
                iteration = i)
          
    elif use_hardcoded or use_random:
        '''
        Initializing hardcoded or random VMM
        '''
        if use_hardcoded:
            A = np.matrix(matrix)
            x = np.matrix(vector)
        elif use_random:
            A = np.asmatrix(
                    np.random.randint(-8, high = 8, 
                    size = (height, width)))
            x = np.asmatrix(
                    np.random.randint(-15, high = 15, 
                    size = (1, height)))
        correct_solution = np.squeeze(np.asarray(x * A))

        '''
        Running VMM on the simulator
        '''
        tn_spikes, tn_neuron_output, tn_vector_output = create_tn_vmm_output(
                                                            sim_path, 
                                                            config_path,
                                                            A, 
                                                            x, 
                                                            np.amax(np.absolute(correct_solution)) + 200,
                                                            use_synapse_index=use_synapse_index,
                                                            first_core_feedback = not first_core_no_feedback,
                                                            third_core_feedback = not third_core_no_feedback,
                                                            num_neurons = num_neurons,
                                                            num_axons = num_axons)

        '''
        Printing results
        '''
        print_vmm_results(
            A, 
            x, 
            correct_solution, 
            tn_vector_output, 
            tn_neuron_output)


        '''
        Generating a scatter plot of the spikes
        '''
        create_spike_scatter_plot(
            [tn_spikes], 
            ['blue'], 
            ['x'], 
            'single_spike_scatter_plot.png')



if __name__ == '__main__':
    main()
