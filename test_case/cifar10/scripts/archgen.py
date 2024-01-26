import os
	
''' notes
	min 4 cores for first layer (otherwise you lose data)
	
'''
'''
def find_architecures(architecture_list, architecture, core) :
	if (core == 1) :
		architecture_list.append(architecture + [1])
		return
	divisor = core / 2
	divisors = []
	while (divisor >= 1) :
		divisors.append(round(divisor))
		divisor /= 2;
	for divisor in divisors :
		find_architecures(architecture_list, architecture + [round(core)], divisor)
'''
# static params
classes = 10
image_size = 28*28
debug = True
epochs = 5
validation_split = 0.20

'''
# generate different architectures
num_starting_cores = [256]
architecture_list = []

for starting_cores in num_starting_cores :
	find_architecures(architecture_list, [], starting_cores)

#architecture_list = [[4, 1]]
#print(architecture_list)
for arch in architecture_list :
	total_cores = 0
	for cores in arch :
		total_cores = total_cores + cores
	if (total_cores > 150) :
		del arch
'''


#architecture_list = [[256, 128, 64, 32, 16, 8, 4, 2, 1], [512, 256, 128, 64, 32, 16, 8, 4, 2, 1]]
architecture_list = [[4, 2, 1]]

# run each config for dynamic params
for architecture in architecture_list :

	selection = architecture

	topology = ""
	for int in selection :
		topology += str(int) + "_"
	topology = topology[:-1]

	layers = len(selection)

	neurons = ""
	for i, int in enumerate(selection) :
		if (i == 0) :
			continue
		neurons += str(round(256 / (selection[i- 1] / selection[i]))) + "_"
	neurons += "250"

	inputs = ""
	for int in selection :
		inputs += str("256") + "_"
	inputs = inputs[:-1]

	'''
	print("The topology is: ", topology)
	print("The layers is: ", layers)
	print("The neurons is: ", neurons)
	print("The inputs is: ", inputs, "\n")
	'''
		
	# enoding
	for encoding in [False] :
	
		use_encoding = encoding
		
		for encoding_option in ['Rate'] :
		
			if (encoding == False) and ((encoding_option == 'Burst') or (encoding_option == 'Time')) :
				continue
			
			encoding_scheme = encoding_option
		
			for spike_option in ['Forward'] :
			
				spike_train = spike_option
				
				for tick_option in [4] :
				
					tick_rate = tick_option
					
					for dropout_option in [0.3] :
					
						dropout_rate = dropout_option
						
						for batch_option in [128] :
							
							batch_size = batch_option

							params = {
								"layers": layers,
								"topology": topology,
								"inputs": inputs,
								"neurons": neurons,
								"classes": classes,
								"use_encoding": use_encoding,
								"encoding_scheme": encoding_scheme,
								"spike_train": spike_train,
								"train_path": "mnist",
								"test_path": "mnist",
								"image_size": image_size,
								"dropout_rate": dropout_rate,
								"tick_rate": tick_rate,
								"debug": debug,
								"batch_size": batch_size,
								"epochs": epochs,
								"validation_split": validation_split

							}
							#print(params)
							cmd = "python generator.py "
							for item in params.items() :
								cmd += "-" + item[0] + " " + str(item[1]) + " "
							os.system("echo Parameters: " + str(params))
							#os.system("echo Parameters: " + str(params) + " >> sar_results.txt")
							os.system(cmd)
							#os.system(cmd + " | grep \"Accuracy\" >> sar_results.txt")

