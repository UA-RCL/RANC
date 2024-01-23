### Quick Setup Guide
Go to the main directory which is ece569project.
```
$ cd ece569project
```

Log onto puma and execute the script launch_puma_interactive.sh. This script will intilize an interactive session with Puma HPC.
```
$ bash launch_puma_interactive.sh 
```

Run the puma_hpc_setup.sh script. This bash script will load neccesary modules(gnu8, cuda11, cmake) and build the serial RANC and the GPU RANC executables.
```
$ bash puma_hpc_setup.sh
```

Now, in the ece569project directory:
```
$ bash run_both_sims.sh
```
This will run both sims using the same test case(a simple mnist test case), both for functional verification and timing estimates. The output files generated from run_both_sims.sh should be output_gpu#.txt and output_serial#.txt. These two output text files contain binary numbers which correspond to the end result spikes of the simulation. To functionally verify our implementation, we compare both output text files directly with the cmp command:
```
cmp output_serial.txt output_gpu.txt
```
If the command does not output anything, it means the two files are the same, and therefor, our GPU funcionality is correct. This comparison of outputs should already be taken care of in the run_both_sims.sh by outputing the following for succesful verification:
```
success: serial and gpu outputs are equivalent
```
In the order hand, if the verification fails because the output is different, the script will output:
```
error: output files are different
```

We have more test cases in the test_case folder where we have: 
   0: reference truenorth architecture
   1: cifar-10 full test set inference
   3: mnist full test set inference, 12-core classifier
   4: mnist full test set inference, 128-core classifier
   5: mnist full test set inference, 512-core classifier
   6: VMM, size 32x32 - doesn't require >256 axons
  
In order to run these test cases, we can use and modify the run_test_cases.sh. This script without any modification will run all test cases by default:
```
cd test_case
bash run_test_cases.sh
```
Before running the script, go to ./mnist/* , ./cifar/ and decompress the "input.tar.gz" to "input.json" 
```
tar -xzvf input.tar.gz
```
In run_test_cases.sh, if we comment line 8 and uncommnet line 9, we can choose specific test cases to run. For example in the run_test_cases.sh:
```
8  #declare -a TEST_CASES=(0 1 3 4 5 6)
9  declare -a TEST_CASES=(3) # UPDATE WHICH TEST CASES YOU WANT TO RUN HERE
```

We can also modify the number of ticks if we wish to reduce the execution time of the simulations in lines 27 & 28.
