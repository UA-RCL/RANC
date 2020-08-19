"""
This file will take in a json file
describing a VMM and output the 
files necessary to run on 
the hardware (both streaming
and behavioral unittest) 
"""

from rancutils import output_for_streaming, output_for_testbench
from rancutils import load
import click
import numpy as np

# Defining command line arguments
@click.command()
@click.option(
    '--input_filepath', 
    '-i', 
    default = 'input.json', 
    help = 'Path to the input.json file')
@click.option(
    '--sim_output_filepath', 
    '-o', 
    default = 'output.txt', 
    help = 'Path to the output file of the simulator')


def main(input_filepath, sim_output_filepath):
    
    correct_outputs = []
    with open(sim_output_filepath) as f:
        for line in f:
            tick_spikes = []
            for char in line.rsplit():
                # Have to get rid of BOM from utf-8 encoding
                val = int(char.split('\ufeff')[1]) if '\ufeff' in char else int(char) 
                tick_spikes.append(val)
            
            # FIXME: It is possible that there will be a tick in the middle with no spikes
            if len(np.nonzero(tick_spikes)[0]) != 0:
                correct_outputs.append(tick_spikes)

    packets, cores = load(input_filepath)


    output_for_streaming(cores,
                        packets=packets,
                        max_xy=(1, 2), # FIXME: Don't hardcode this
                        potential_width=9,
                        leak_width=9,
                        weight_width=9,
                        threshold_width=9,
                        num_reset_modes=2,
                        max_dx=512,
                        max_dy=512,
                        num_axons=256,
                        num_neurons=256,
                        num_ticks=16,
                        num_weights=13, # Should dynamically load this
                        max_packet_xy=(512, 512),
                        output_path='streaming/',
                        packet_file_name='data.bin',
                        packet_count_file_name='count.bin',
                        max_file_number=100,
                        verbose=True)


    output_for_testbench(packets,
                        correct_outputs,
                        output_path='testbench/',
                        input_filename='tb_input.txt',
                        correct_filename='tb_correct.txt',
                        num_inputs_filename='tb_num_inputs.txt',
                        num_outputs_filename='tb_num_outputs.txt',
                        max_packet_xy=(512, 512),
                        num_axons=256,
                        num_ticks=16,
                        num_outputs=250)

    output_for_testbench(
        packets,
        correct_outputs,
        output_path = 'testbench/'
    )

    



if __name__ == '__main__':
    main()