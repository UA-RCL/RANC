NUM_TICKS=100

echo "Reminder: Both simulators must be built first!"

echo "Running & timing serial simulator"
SECONDS=0
time ./simulator/build/ranc_sim -i ./test_case/mnist_config_1.json -o ./test_case/output_serial.txt -c ./test_case/config.json --ticks $NUM_TICKS
SERIAL_SECONDS=$SECONDS
echo "Running & timing serial simulator done"

echo "Running & timing gpu simulator"
SECONDS=0
time ./simulator_gpu/build/ranc_sim -i ./test_case/mnist_config_1.json -o ./test_case/output_gpu.txt -c ./test_case/config.json --ticks $NUM_TICKS
GPU_SECONDS=$SECONDS
echo "Running & timing gpu simulator done"

#cmp --silent ./test_case/trace_serial.txt ./test_case/trace_gpu.txt && echo "success: serial and gpu traces are equivalent"|| echo "error: trace files are different"
cmp --silent ./test_case/output_serial.txt ./test_case/output_gpu.txt && echo "success: serial and gpu outputs are equivalent" || echo "error: output files are different"
echo "Rough Speedup is:"
echo $(( 100 * $SERIAL_SECONDS / $GPU_SECONDS )) | sed 's/..$/.&/'
