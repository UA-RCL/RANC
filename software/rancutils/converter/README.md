# University of Arizona RANCUtils - CSV to JSON Converter

This is a software program to support the RANC simulation environment created by Dr. Akoglu's Reconfigurable Computing Lab at the University of Arizona.

## Getting Started

The converter program is a stand alone utility program. One can clone the repository, and immediatly access the converter program assuming one has the following python libraries installed:
```
pandas
argparse

```

If you do not have the required libraries one can install them using the python installation program (pip) process:
```
python -pip install pandas  # If using python2.x

python3 -pip install pandas # If using python3.x
```

argparse should come installed with the python installation.

## Using the converter
The converter requires a series of [ .csv ] files which will be parsed and used to generate a [ .json ] file that can act as the input for the RANC simulation environment.

A extensive help statement for the converter can be found by running `python3 csv2json.py --help`:

For the converter program there are a minimum of [ 3 ] input files that will be used to create the final [ .json ] file.
```
packet.csv -- Contains the required input packet information for the simulator. Each packet csv file represents a single tick's worth of input packet information. For multiple input ticks will require multiple csv files.
core.csv   -- Contains the required core information for a single core. Each csv file contains only the information for a single core. For multiple cores you will require multiple csv files.
neuron.csv -- Contains the required neuron information for all neurons within a single core. Each neuron.csv file only contains the neuron information for that core. So multiple cores require multiple csv files.

```
### Packet CSV Files
The packet.csv files should have the following header information:
```
Destination Core | Destination Axon | Destination Tick
```
Each `Destination Core` should be a numeric pair in the form of `#,#` with no variation. The converter program will parse these values as a string, splitting them on the comma. Failing to represent your destination core in this manner will result in a failed parsing, and either total failure of the converter program or strange output in the resulting [ .json ] file.

Each `Destination Axon` should be a single number from `0` to `N` where N is the total number of neurons in a single core. Currently this is set to be a maximum of 256 neurons as that is the default maximum neuron size of a single RANC core.

Each `Destination Tick` should be a single number from `0` to `15` representing the [ tick offset ] for the packets to enter the core via the scheduler. Note: The simulation environment will automatically add 1 to this value.

### Core CSV Files
The core.csv files should have the following header information:
```
Coordinates | Axon 1 | ... | Axon 256
```
Each `Coordinates` should be a numeric pair in the form of `#,#` with no variation. The converter program will parse these values as a string, splitting them on the comma. Failing to represent your core's coordinates in this manner will result in failed parsing, and either total failure of the converter program or strange output in the resulting [ .json ] file.

Each `Axon N`, where `N` is a value from `1` to `256`, represents the synaptic weight lookup value for a given axon. This value should be a numeric value from `0` to `3`. Any other number will not be parsed correctly, and will result in the program ceasing attempts to parse this particular csv file. This will result in strange outputs within the resulting [ .json ] file. If you wish to use less than the 256 neurons of a core you can dictate this by adding a `.` after your last used neuron. This will cease the parsing program at the `.` but will result in an output [ .json ] file along the lines of what you are expecting. 

### Neuron CSV Files
The neuron.csv files should have the following header information:
```
Reset Potential | Weights | Leak | Positive Threshold | Negative Threshold | Destination Core Offset | Destination Axon | Destination Tick | Axon 1 | ... | Axon 256
```
Each `Reset Potential` should be a numeric value between `256` and `-256`.

Each `Weights` value should be a pairing of [ 4 ] signed numbers of the form `#,#,#,#` or `-#,-#,-#,-#` or any combination inbetween. Like with the Coordinates these values will be taken in as a string and split on the comma. Adding in anything other than a negative sign with the numbers will result in strange behavior from the program, or outright program failure.

Each `Leak` should be a numeric value between `256` and `-256`.

Each `Postive Threshold` should be a positive number from `1` to `256`.

Each `Negative Threshold` should be a number from `0` to `-256`.

Each `Destination Core Offset` should be a numeric pair of of `#,#` where the `#` should be a value from `-256` to `256`. This number represents the `dx`, `dy` values of the neuron packet, and therefore represent the offset from this `core` to the `target core`. So, if you want the neuron to send its' packet one core to the left, this value would be `-1,0`. If you want to send it one core to the right, this value should be `1,0`. If you want to send to your own core, this value should be `0,0`.

Each `Destination Axon` and `Destination Tick` serves the same functionality as explained in the `Packet CSV Files` section.

Each `Current Potential` should be a numeric value between `256` and `-256`.

Each `Reset Mode` should be a numberic value that is either `0` or `1`.

Each `Axon N`, where `N` is a number from `1` to `256`, represents the binary encoding of which axons the neuron is attached to. Spikes on these axons will then activate the neuron's functionality. This value should be either a `1` or a `0`. As explained in the `Core CSV Files` section you can add a `.` to stop the parsing process and not use any other axons past the last described neuron.

### Example
Example CSV Files are provided for new users to copy and modify for their own use. These files can also be used to run the program to see how it functions.

To run the example enter the following into your command line (assuming python3):
```
python3 csv2json.py -cl ./CSV/example/core0.csv,./CSV/example/core1.csv -nl ./CSV/example/neuron0.csv,./CSV/example/neuron1.csv -p ./CSV/example/packet0.csv -ob 2,0 -obn 4 -of ./JSON/example/input.json
```

If all goes correctly you should see the following in your terminal:
```

-------------------- CSV to JSON Converter -----------------------
        -Step 1: Checking Core and Neuron CSV Numeric Compatability
        -Step 2: Checking Output Bus Location
            -- Output Bus is set for Core [ 2, 0 ]. If this is incorrect recommend immediatly halting the program now!!
        -Step 3: Checking Packet CSV File
            -- Packet CSV Specified as [ ./CSV/example/packet0.csv ]. If this is incorrect recommend immediatly halting the program now!!
        -Step 4: Checking Output File
            -- Output JSON File specified as [ ./JSON/input.json ]. If this is incorrect recommend immediatly halting the program now!!
        -Step 5: Beginning Conversion Process ...
---------------------------------------------------------------------------------
            -- Beginning Parsing of: [ ./CSV/example/neuron0.csv ] CSV File ...
            -- Finished Parsing of: [ ./CSV/example/neuron0.csv ] CSV File
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
            -- Beginning Parsing of: [ ./CSV/example/neuron1.csv ] CSV File ...
            -- Finished Parsing of: [ ./CSV/example/neuron1.csv ] CSV File
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
            -- Beginning Parsing of: [ ./CSV/example/core0.csv ] CSV File ...
            -- Finished Parsing of: [ ./CSV/example/core0.csv ] CSV File
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
            -- Beginning Parsing of: [ ./CSV/example/core1.csv ] CSV File ...
            -- Finished Parsing of: [ ./CSV/example/core1.csv ] CSV File
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
            -- Beginning Parsing of: [ ./CSV/example/packet0.csv ] CSV File ...
            -- Finished Parsing of: [ ./CSV/example/packet0.csv ] CSV File
---------------------------------------------------------------------------------
------------------- CSV to JSON Converter END -------------------------
JSON File Printed to: ./JSON/example/input.json
```
