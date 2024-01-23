# To run a specific subset of test cases, modify only the TEST_CASES array below

# !!!IMPORTANT!!!: 4 test cases: {2, 4-6} have HUGE input.jsons. they are too large to upload to git. you need to decompress them first in their respective directories.
# !!!IMPORTANT!!!: Before the script will execute, go to ./mnist/* , ./cifar/ and decompress the "input.tar.gz" to "input.json" (tar -xzvf input.tar.gz)

declare -a TEST_CASES=(1 2 4 5 6 9) # UPDATE WHICH TEST CASES YOU WANT TO RUN HERE

echo "Please read this script's comments before running!"

# Test cases available are:
# 1: reference truenorth architecture
# 2: cifar-10 full test set inference
# 4: mnist full test set inference, 12-core classifier
# 5: mnist full test set inference, 128-core classifier
# 6: mnist full test set inference, 512-core classifier
# 7: VMM, size 32x32 - doesn't require >256 axons

# To run a specific subset of test cases, modify only the TEST_CASES array below

declare -a TEST_CASE_DIRS=("./chipidle/conv_cores" "./chipidle/truenorth_64x64" "./cifar10" "./mceliece" "./mnist/mnist_12core" "./mnist/mnist_128core" "./mnist/mnist_512core" "./vmm/vmm_32x32" "./vmm/vmm_50x50" "./vmm/vmm_60x60")
declare -a NUM_TICKS=(10000 500 10002 10 10010 10010 10010 788 889 1095)

echo "Reminder: Both simulators must be built first!"
for i in "${TEST_CASES[@]}"
do
	echo "Running & timing serial simulator for test case $i"
	echo "Test case $i: ${TEST_CASE_DIRS[$i]}" >> ./outputs/output_log.txt
	echo "Running & timing serial simulator for test case $i" >> ./outputs/output_log.txt
	SECONDS=0
	time ../simulator/build/ranc_sim -i ${TEST_CASE_DIRS[$i]}/input.json -o ./outputs/output_serial_$i.txt -c ${TEST_CASE_DIRS[$i]}/config.json --ticks ${NUM_TICKS[$i]} | grep "cumulative" >> ./outputs/output_log.txt
	SERIAL_SECONDS=$SECONDS
	echo "Running & timing serial simulator done"

	echo "Running & timing gpu simulator"
	echo "Running & timing gpu simulator for test case $i" >> ./outputs/output_log.txt
	SECONDS=0
	time ../simulator_gpu/build/ranc_sim -i ${TEST_CASE_DIRS[$i]}/input.json -o ./outputs/output_gpu_$i.txt -c ${TEST_CASE_DIRS[$i]}/config.json --ticks ${NUM_TICKS[$i]} | grep "cumulative" >> ./outputs/output_log.txt
	GPU_SECONDS=$SECONDS
	echo "Running & timing gpu simulator done"

	#cmp --silent ./test_case/trace_serial.txt ./test_case/trace_gpu.txt && echo "success: serial and gpu traces are equivalent"|| echo "error: trace files are different"
	cmp --silent ./outputs/output_serial_$i.txt ./outputs/output_gpu_$i.txt && echo "success: serial and gpu outputs are equivalent" || echo "error: output files are different"
	echo "Rough Speedup is:"
	echo $(( 100 * $SERIAL_SECONDS / $GPU_SECONDS )) | sed 's/..$/.&/'
	
	cmp --silent ./outputs/output_serial_$i.txt ./outputs/output_gpu_$i.txt && echo "success: serial and gpu outputs are equivalent" >> ./outputs/output_log.txt || echo "error: output files are different"  >> ./outputs/output_log.txt
	echo "Serial/CPU seconds: $SERIAL_SECONDS" >> ./outputs/output_log.txt
	echo "Parallel/GPU seconds: $GPU_SECONDS" >> ./outputs/output_log.txt
	echo "Rough Speedup is: $(( 100 * $SERIAL_SECONDS / $GPU_SECONDS ))" | sed 's/..$/.&/' >> ./outputs/output_log.txt
done

echo "Run performance metrics logged to ./outputs/output_log.txt"

#exit # for launching to puma compute node, uncomment this to terminate when finished.
