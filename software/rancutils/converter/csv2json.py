###########################
# Imports
###########################
import pandas as pd

import sys

import math

import argparse

import time
###########################
def parse_csv( coreList, neuronList, listSize, packetList, packetListSize, outputFile, outputBus, debug):
    neuronDataPerCore = []
    neuron_list = []
    coreDataPerCore = []
    core_list = []
    packet_list = []
    packetDataPerTick = []
    ######################################################################################################
    if debug:
        print("\t\t --------- BEGINNING PARSE FUNCTION --------")
		
	###################################################################################################################################################
	###################################################################################################################################################
	# Neuron CSV Parsing
    if listSize is 1:
        if ".csv" not in neuronList[0] and debug:
            print("\t\t -- Missing [.csv] marker. Adding to [ {n} ] ....".format(n=neuronList[0]))
            neuronList[0] = neuronList[0] + ".csv"
        elif ".csv" not in neuronList[0]:
            neuronList[0] = neuronList[0] + ".csv"

        print("-----------------------------------------------------------------------------")
        print("\t\t -- Beginning Parsing of: [ {n} ] CSV File ...".format(n=neuronList[0]))
        neuronData = pd.read_csv(neuronList[0])
        
        neuron_list = []
        for row in range(len(neuronData)):
            neuron_list.append(collect_neuron_data(neuronData, row))
            
            if debug:
                print("Row [ {r} ] : Neuron Data [ {nd} ]".format(r = row, nd = neuron_list[-1]))

        neuronDataPerCore.append(neuron_list)
        print("\t\t -- Finished Parsing of: [ {n} ] CSV File".format(n=neuronList[0]))
        print("---------------------------------------------------------------------------")

    elif len(neuronList) == listSize:
        for neuronCSV in neuronList:
            if ".csv" not in neuronCSV and debug:
                print("\t\t -- Missing [.csv] marker. Adding to [ {n} ] ....".format(n = neuronCSV))
                neuronCSV = neuronCSV + ".csv"
            elif '.csv' not in neuronCSV:
                neuronCSV = neuronCSV + ".csv"

            print("--------------------------------------------------------------------------------")
            print("\t\t -- Beginning Parsing of: [ {n} ] CSV File ...".format(n=neuronCSV))
            neuronData = pd.read_csv(neuronCSV)

            neuron_list = []
            for row in range(len(neuronData)):
                neuron_list.append(collect_neuron_data(neuronData,row))

                if debug:
                    print("Row [ {r} ] : Neuron Data [ {nd} ]".format(r=row,nd=neuron_list[-1]))

            neuronDataPerCore.append(neuron_list)
            print("\t\t -- Finished Parsing of: [ {n} ] CSV File".format(n=neuronCSV))
            print("-------------------------------------------------------------------------------")

    else:
        for x in range(listSize):
            print("-------------------------------------------------------------------------------")
            print("\t\t -- Beginning Parsing of: [ {n} ] CSV File ...".format(n=neuronList[0] + "{}".format(x) + ".csv"))
            neuronData = pd.read_csv(neuronList[0] + "{}".format(x) + ".csv")

            neuron_list = []
            for row in range(len(neuronData)):
                neuron_list.append(collect_neuron_data(neuronData,row))

                if debug:
                    print("Row [ {r} ] : Neuron Data [ {nd} ]".format(r=row, nd=neuron_list[-1]))
            neuronDataPerCore.append(neuron_list)
            print("\t\t -- Finished Parsing of: [ {n} ] CSV File.".format(n=neuronList[0]+"{}".format(x)+".csv"))
            print("------------------------------------------------------------------------------")
	###################################################################################################################################################
	###################################################################################################################################################
	
	###################################################################################################################################################
	###################################################################################################################################################
	# Core CSV Parsing
    if listSize is 1:
        if ".csv" not in coreList[0] and debug:
            print("\t\t -- Missing [.csv] marker. Adding to [ {c} ] ....".format(c = coreList[0]))
            coreList[0] = coreList[0] + ".csv"
        elif ".csv" not in coreList[0]:
            coreList[0] = coreList[0] + ".csv"

        print("----------------------------------------------------------------------")
        print("\t\t -- Beginning Parsing of: [ {c} ] CSV File ...".format(c=coreList[0]))
        coreData = pd.read_csv(coreList[0])

        core_list = []
        for row in range(len(coreData)):
            core_list.append(collect_core_data(coreData,row))

            if debug:
                print("Row [ {r} ] : Core Data [ {cd} ]".format(r=row, cd=core_list[-1]))

        coreDataPerCore.append(core_list)
        print("\t\t -- Finished Parsing of: [ {c} ] CSV File.".format(c=coreList[0]))
        print("---------------------------------------------------------------------")
    
    elif len(coreList) == listSize:
        for coreCSV in coreList:
            if ".csv" not in coreCSV and debug:
                print("\t\t -- Missing [.csv] marker. Adding to [ {c} ] ....".format(c=coreCSV))
                coreCSV = coreCSV + ".csv"
            elif ".csv" not in coreCSV:
                coreCSV = coreCSV + ".csv"

            print("------------------------------------------------------------------------------")
            print("\t\t -- Beginning Parsing of: [ {c} ] CSV File ...".format(c=coreCSV))

            coreData = pd.read_csv(coreCSV)

            core_list= []
            for row in range(len(coreData)):
                core_list.append(collect_core_data(coreData, row))

                if debug:
                    print("Row [ {r} ] : Core Data [ {cd} ]".format(r = row, cd = core_list[-1]))

            coreDataPerCore.append(core_list)

            print("\t\t -- Finished Parsing of: [ {c} ] CS File.".format(c=coreCSV))
            print("-----------------------------------------------------------------------------")

    else:
        for x in range(listSize):
            print("-----------------------------------------------------------------------------")
            print("\t\t -- Beginning Parsing of: [ {c} ] CSV File ...".format(c=coreList[0] + "{}".format(x) + ".csv"))

            coreData = pd.read_csv(coreList[0] + "{}".format(x) + ".csv")

            core_list = []

            for row in range(len(coreData)):
                core_list.append(collect_core_data(coreData,row))

                if debug:
                    print("Row [ {r} ] : Core Data [ {cd} ]".format(r=row, cd=core_list[-1]))

            coreDataPerCore.append(core_list)

            print("\t\t -- Finished Parsing of: [ {c} ] CSV File.".format(c=coreList[0]+"{}".format(x)+".csv"))
            print("----------------------------------------------------------------------------")

	###################################################################################################################################################
	###################################################################################################################################################
	# Packet CSV Parsing
    if packetListSize is 1:
        if ".csv" not in packetList[0] and debug:
            print("\t\t -- Missing [.csv] marker. Adding to [ {p} ] ....".format(p = packetList[0]))
            packetList[0] = packetList[0] + ".csv"
        elif ".csv" not in packetList[0]:
            packetList[0] = packetList[0] + ".csv"

        print("----------------------------------------------------------------------")
        print("\t\t -- Beginning Parsing of: [ {p} ] CSV File ...".format(p=packetList[0]))
        packetData = pd.read_csv(packetList[0])

        packet_list = []
        for row in range(len(packetData)):
            packet_list.append(collect_packet_data(packetData,row))

            if debug:
                print("Row [ {r} ] : Packet Data [ {pd} ]".format(r=row, pd=packet_list[-1]))

        packetDataPerTick.append(packet_list)
        print("\t\t -- Finished Parsing of: [ {p} ] CSV File.".format(p=packetList[0]))
        print("---------------------------------------------------------------------")
    
    elif len(packetList) == packetListSize:
        for packetCSV in packetList:
            if ".csv" not in packetCSV and debug:
                print("\t\t -- Missing [.csv] marker. Adding to [ {p} ] ....".format(p=packetCSV))
                packetCSV = packetCSV + ".csv"
            elif ".csv" not in packetCSV:
                packetCSV = packetCSV + ".csv"

            print("------------------------------------------------------------------------------")
            print("\t\t -- Beginning Parsing of: [ {p} ] CSV File ...".format(p=packetCSV))

            packetData = pd.read_csv(packetCSV)

            packet_list= []
            for row in range(len(packetData)):
                packet_list.append(collect_packet_data(packetData, row))

                if debug:
                    print("Row [ {r} ] : Packet Data [ {pd} ]".format(r = row, pd = packet_list[-1]))

            packetDataPerTick.append(packet_list)

            print("\t\t -- Finished Parsing of: [ {p} ] CS File.".format(p=packetCSV))
            print("-----------------------------------------------------------------------------")

    else:
        for x in range(packetListSize):
            print("-----------------------------------------------------------------------------")
            print("\t\t -- Beginning Parsing of: [ {p} ] CSV File ...".format(p=packetList[0] + "{}".format(x) + ".csv"))

            packetData = pd.read_csv(packetList[0] + "{}".format(x) + ".csv")

            packet_list = []

            for row in range(len(packetData)):
                packet_list.append(collect_packet_data(packetData,row))

                if debug:
                    print("Row [ {r} ] : Packet Data [ {pd} ]".format(r=row, pd=packet_list[-1]))

            packetDataPerTick.append(packet_list)

            print("\t\t -- Finished Parsing of: [ {p} ] CSV File.".format(p=packetList[0]+"{}".format(x)+".csv"))
            print("----------------------------------------------------------------------------")
	
	###################################################################################################################################################
	###################################################################################################################################################
    print_json(coreDataPerCore, neuronDataPerCore, packetDataPerTick, outputFile, outputBus, debug)

    return


##################################################################################################################################################
def print_json(coreData, neuronData, packetData, outputFile, outputBus, debug):
    of = open(outputFile, "w")
    if debug:
        print("\t\t -- Opening [ {f} ] for writing ...".format(f=outputFile))

    of.write("{\n")
    of.write(" \"packets\":\n") #1 Space
    of.write("  [\n") # 2 Spaces
    of.write("   [\n") # 3 Spaces

    for tick in range(len(packetData)):
        for packet in range(len(packetData[tick])):
            of.write("    {\n") # 4 spaces
            of.write("     \"destination_core\": [{x},{y}],\n".format(x=packetData[tick][packet]['destination_core'][0], y=packetData[tick][packet]['destination_core'][1]))
            of.write("     \"destination_axon\": {a},\n".format(a=packetData[tick][packet]['destination_axon']))
            of.write("     \"destination_tick\": {t}\n".format(t=packetData[tick][packet]['destination_tick']))
        
            if packet != len(packetData[tick])-1:
                of.write("    },\n") # 4 spaces
            else:
                of.write("    }\n") # 4 spaces
        if tick != len(packetData)-1:
            of.write("   ],\n") # 3 spaces
        else:
            of.write("   ]\n") # 3 spaces
    of.write("  ],\n") # 2 spaces

    of.write(" \"output_bus\": {\n") # 1 space
    of.write("  \"coordinates\": [{x},{y}],\n".format(x=outputBus['coordinates'][0],y=outputBus['coordinates'][1])) # 2 spaces
    of.write("  \"num_outputs\": {x}\n".format(x=outputBus['num_outputs'])) # 2 spaces
    of.write(" },\n") # 1 space

    of.write(" \"cores\":\n") # 1 space
    of.write("  [\n") # 2 spaces

    for core in range(len(coreData)):
        for cdata in range(len(coreData[core])):
            of.write("   {\n") # 3 spaces
            of.write("    \"axons\":[\n") # 4 spaces
            for x in range(len(coreData[core][cdata]['axons'])):
                if x is 0 :
                    of.write("     ") # 5 spaces
                of.write("{}".format(coreData[core][cdata]['axons'][x]))
                if x < len(coreData[core][cdata]['axons'])-1:
                    of.write(",")
                if (x+1) % 32 is 0 and x != 0 or x == len(coreData[core][cdata]['axons'])-1:
                    of.write("\n     ")
            of.write("    ],\n") # 4 spaces
            of.write("    \"neurons\":\n") # 4 spaces
            of.write("     [\n") #5 spaces
            
            for neuron in range(len(neuronData[core])):
                of.write("      {\n") # 6 spaces
                of.write("       \"reset_potential\": {r},\n".format(r=neuronData[core][neuron]['reset_potential'])) # 7 spaces
                of.write("       \"weights\": [{w1}, {w2}, {w3}, {w4}],\n".format(w1=neuronData[core][neuron]['weights'][0], w2=neuronData[core][neuron]['weights'][1], w3=neuronData[core][neuron]['weights'][2], w4=neuronData[core][neuron]['weights'][3]))
                of.write("       \"leak\": {l},\n".format(l=neuronData[core][neuron]['leak']))
                of.write("       \"positive_threshold\": {pt},\n".format(pt=neuronData[core][neuron]['positive_threshold']))
                of.write("       \"negative_threshold\": {nt},\n".format(nt=neuronData[core][neuron]['negative_threshold']))
                of.write("       \"destination_core_offset\": [{x}, {y}],\n".format(x=neuronData[core][neuron]['destination_core_offset'][0],y=neuronData[core][neuron]['destination_core_offset'][1]))
                of.write("       \"destination_axon\": {da},\n".format(da=neuronData[core][neuron]['destination_axon']))
                of.write("       \"destination_tick\": {dt},\n".format(dt=neuronData[core][neuron]['destination_tick']))
                of.write("       \"current_potential\": {cp},\n".format(cp=neuronData[core][neuron]['current_potential']))
                of.write("       \"reset_mode\": {rm}\n".format(rm=neuronData[core][neuron]['reset_mode']))

                if neuron != len(neuronData[core])-1:
                    of.write("      },\n") # 6 spaces
                else:
                    of.write("      }\n") # 6 spaces

            of.write("     ],\n") # 5 spaces

            of.write("    \"connections\":[\n") # 4 spaces

            for neuron in range(len(neuronData[core])):
                of.write("      [\n") # 5 spaces
                for x in range(len(neuronData[core][neuron]['connections'])):
                    if x is 0:
                        of.write("       ") # 6 spaces
                    of.write("{}".format(neuronData[core][neuron]['connections'][x]))
                    if x < len(neuronData[core][neuron]['connections'])-1:
                        of.write(",")
                    if (x+1) % 32 is 0 and x != 0 or x == len(neuronData[core][neuron]['connections'])-1:
                        of.write("\n      ")
                if neuron < len(neuronData[core]) -1:
                    of.write("      ],\n") # 6 spaces
                else:
                    of.write("      ]\n") # 6 spaces
            of.write("     ],\n") # 5 spaces

            of.write("    \"coordinates\": [{x},{y}]\n".format(x=coreData[core][cdata]['coordinates'][0], y=coreData[core][cdata]['coordinates'][1])) # 4 spaces
            
        if core < len(coreData)-1:
            of.write("   },\n") # 3 spaces
        else:
            of.write("   }\n") # 3 spaces
    of.write("  ]\n") # 2 spaces
    of.write("}")
    of.close()
    return

##########################################
def collect_packet_data(data, row):
    packet_data = {}
    
    packet_data['destination_core'] = data['Destination Core'][row].split(',')
    for x in range(len(packet_data['destination_core'])):
        packet_data['destination_core'][x] = int(packet_data['destination_core'][x])

    packet_data['destination_axon'] = int(data['Destination Axon'][row])
    packet_data['destination_tick'] = int(data['Destination Tick'][row])

    return packet_data

#########################################
def collect_core_data(data, row):
    core_data = {}

    core_data['axons'] = []
    
    x = 1
    while x < 257:
        if data['Axon {}'.format(x)][row] != '.' and int(data['Axon {}'.format(x)][row]) >=0 and int(data['Axon {}'.format(x)][row]) <= 3:
            core_data['axons'].append(int(data['Axon {}'.format(x)][row]))
        else:
            break
        x += 1

    core_data['coordinates'] = data['Coordinates'][row].split(',')
    for x in range(len(core_data['coordinates'])):
        core_data['coordinates'][x] = int(core_data['coordinates'][x])

    return core_data

##########################

def collect_neuron_data(data, row):
    neuron_data = {}
    # data is a pandas dataset
    neuron_data['reset_potential'] = int(data['Reset Potential'][row])
        
    weights = data['Weights'][row].split(',')
    weights = [int(x) for x in weights]
    neuron_data['weights'] = weights

    neuron_data['leak'] = int(data['Leak'][row])

    neuron_data['positive_threshold'] = int(data['Positive Threshold'][row])

    neuron_data['negative_threshold'] = int(data['Negative Threshold'][row])

    weights = data['Destination Core Offset'][row].split(',')
    weights = [int(x) for x in weights]
    neuron_data['destination_core_offset'] = weights

    neuron_data['destination_axon'] = int(data['Destination Axon'][row])

    neuron_data['destination_tick'] = int(data['Destination Tick'][row])

    neuron_data['current_potential'] = int(data['Current Potential'][row])

    neuron_data['reset_mode'] = int(data['Reset Mode'][row])
    
    neuron_data['connections'] = []

    x = 1
    while x < 257:
        if data['Axon {}'.format(x)][row] != '.' and int(data['Axon {}'.format(x)][row]) == 0 or int(data['Axon {}'.format(x)][row] == 1):
            neuron_data['connections'].append(int(data['Axon {}'.format(x)][row]))
        else:
            break
        x += 1
            

    return neuron_data
#############################

def collect_data_core(data, row):
    core_data = {}

#############################

##################################################################################################################
if __name__ == "__main__":
    canRun = True
    coreList = 0
    neuronList = 0
    coreNum = 0
    neuronNum = 0
    packetList = 0
    packetNum = 0
    #############################################################
    ## Arguemnt Parser Information:
    parser = argparse.ArgumentParser()
		#########################################################
		# Core CSV Arguments:
    parser.add_argument('-coreCSV', '-ccsv', '-c', type=str, metavar = 'PATH+FILENAME', default='None', help='This argument takes in a string path and filename to a Core CSV file. This file will be converted into the RANC Simulation required input json file. EX: -c ./core0.csv')
    parser.add_argument('-coreCSVList', '-ccsvl', '-cl', type=str, metavar = 'PATH+FILENAME,PATH+FILENAME,...', default='None', help="This argument specifies that a list of Core CSV files will be used. Each csv file requires the corresponding path and filename. The list is indicated via a comma without additional spacing between each csv. EX: -cl ./core0.csv,./core1.csv")
    parser.add_argument('-coreCSVNumericList', '-ccsvnl', '-cnl', type=str, metavar = 'PATH+FILENAME', default='None', help="This argument takes in a string path and filename to a Core CSV file, and indicates that there a numerically many copies of this file. Each file is changed by a numerical value, such as a 0 or 1. Each file has the same path and filename, with the only difference being the number. EX: -cnl ./core0.csv")
    parser.add_argument('-coreCSVNumber', '-ccsvn', '-cn', type=int, metavar = 'NUMBER', default=0, help="This argument specifies the number of Core CSV files being used. This argument is only necessary when using the [ core CSV numeric list ] option.")
	
		#########################################################
		# Neuron CSV Arguments:	
    parser.add_argument('-neuronCSV', '-ncsv', '-n', type=str, metavar = 'PATH+FILENAME', default='None', help='This argument takes in a string path and filename to a Neuron CSV file. This file will be converted into the RANC Simulation required input json file. EX: -n ./neuron0.csv')
    parser.add_argument('-neuronCSVList', '-ncsvl', '-nl', type=str, metavar = 'PATH+FILENAME,PATH+FILENAME,...', default='None', help="This argument specifies that a list of Neuron CSV files will be used. Each csv file requires the corresponding path and filename. The list is indicated via a comma without additional spacing between each csv. EX: -nl ./neuron0.csv,./neuron1.csv")
    parser.add_argument('-neuronCSVNumericList', '-ncsvnl', '-nnl', type=str, metavar = 'PATH+FILENAME', default='None', help="This argument takes in a string path and filename to a Neuron CSV file, and indicates that there a numerically many copies of this file. Each file is changed by a numerical value, such as a 0 or 1. Each file has the same path and filename, with the only difference being the number. EX: -nnl ./neuron0.csv")
    parser.add_argument('-neuronCSVNumber', '-ncsvn', '-nn', type=int, metavar = 'NUMBER', default=0, help="This argument specifies the number of Neuron CSV files being used. This argument is only necessary when using the [ Neuron CSV numeric list ] option.")
	
		#########################################################
		# Packet CSV Arguments:	
    parser.add_argument('-packetCSV', '-pcsv', '-p', type=str, metavar = 'PATH+FILENAME', default='None', help='This argument takes in a string path and filename to a Packet CSV file. This file will be converted into the RANC Simulation required input json file. EX: -p ./packet0.csv')
    parser.add_argument('-packetCSVList', '-pcsvl', '-pl', type=str, metavar = 'PATH+FILENAME,PATH+FILENAME,...', default='None', help="This argument specifies that a list of Packet CSV files will be used. Each csv file requires the corresponding path and filename. The list is indicated via a comma without additional spacing between each csv. EX: -pl ./packet0.csv,./packet1.csv")
    parser.add_argument('-packetCSVNumericList', '-pcsvnl', '-pnl', type=str, metavar = 'PATH+FILENAME', default='None', help="This argument takes in a string path and filename to a Packet CSV file, and indicates that there a numerically many copies of this file. Each file is changed by a numerical value, such as a 0 or 1. Each file has the same path and filename, with the only difference being the number. EX: -pnl ./core0.csv")
    parser.add_argument('-packetCSVNumber', '-pcsvn', '-pn', type=int, metavar = 'NUMBER', default=0, help="This argument specifies the number of Packet CSV files being used. This argument is only necessary when using the [ packet CSV numeric list ] option.")
	
		#########################################################
		# Output Bus Arguments:	
    parser.add_argument('-outputBus', '-ob', type=str, metavar="NUMBER,NUMBER", default="0,0", help="This argument specifies which core will be used for the output bus. This argument expects a single string of two numbers representing the X,Y coordinates of the output bus' location. Do not add an extra space between the comma. EX: --ob 0,0")
    parser.add_argument('-outputBusNum', '-obn', type=int, metavar="NUMBER", default=0, help="The number of output neurons for the Output Bus.")
    
		#########################################################
		# Output File Arguments:
    parser.add_argument("-outputFile", "-of", type=str, metavar="PATH+FILENAME", default="./converted_json.json", help="This argument specifies the path and filename of the Output JSON File that will be generated. By default this is set to [ ./converted_json.json ]. EX: --of ./output_json.json")
    
		#########################################################
		# Debug Arguments:
    parser.add_argument("-debug", "-dbg", type=bool, metavar="TRUE or FALSE", default=False, help="This argument turns on Debug information and removes certain requirements (such as the number of Core CSV files matching the number of Neuron CSV Files")
    #############################################################
    options = parser.parse_args()
    outputBus = {}
	
	# Core List Generator
    if options.coreCSVList != "None":
        coreList = options.coreCSVList.split(',')
    elif options.coreCSVList == "None" and options.coreCSV != "None":
        coreList = []
        coreList.append(options.coreCSV)
    elif options.coreCSVNumericList != "None":
        coreList = options.coreCSVNumericList.split(".csv")[0]
        neuronList = []
        neuronList.append(coreList[0:len(coreList)-1])
        coreList = neuronList

	# Neuron List Generator
    if options.neuronCSVList != "None":
        neuronList = options.neuronCSVList.split(',')
    elif options.neuronCSVList == "None" and options.neuronCSV != "None":
        neuronList = []
        neuronList.append(options.neuronCSV)
    elif options.neuronCSVNumericList != "None":
        neuronList = options.neuronCSVNumericList.split(".csv")[0]
        coreNum = []
        coreNum.append(neuronList[0:len(neuronList)-1])
        neuronList = coreNum
		
    # Packet List Generator
    if options.packetCSVList != 'None':
    	packetList = options.packetCSVList.split(',')
    elif options.packetCSVList == 'None' and options.packetCSV != 'None':
        packetList = []
        packetList.append(options.packetCSV)
    elif options.packetCSVNumericList != 'None':
        packetList = options.packetCSVNumericList.split(".csv")[0]
        coreNum = []
        coreNum.append(packetList[0:len(packetList)-1])
        packetList = coreNum

	# Get Core, Neuron and Packet CSV Numbers
    if options.coreCSVNumber == 0:
        coreNum = len(coreList)
    else: 
        coreNum = options.coreCSVNumber

    if options.neuronCSVNumber == 0:
        neuronNum = len(neuronList)
    else:
        neuronNum = options.neuronCSVNumber
		
    if options.packetCSVNumber == 0:
        packetNum = len(packetList)
    else:
        packetNum = options.packetCSVNumber

    if options.debug:
        print("\n\nCore List: {c}".format(c=coreList))
        print("Neuron List: {n}".format(n=neuronList))
        print("Core Num: {c}".format(c=coreNum))
        print("Neuron Num: {n}".format(n=neuronNum))

    print("-------------- CSV to JSON Converter ----------------------")
    print("\t-Step 1: Checking Core and Neuron CSV Numeric Compatibility")
    if options.coreCSV != "None" and options.neuronCSV == "None" and options.debug is False:
        print("\t\t -- WARNING : The number of Core CSV Files should match the number of Neuron CSV Files being converted.")
        print("\t\t\t Currently you are attempting to convert [ 1 ] Core CSV Files and [ 0 ] Neuron CSV Files.")
        canRun = False

    if options.coreCSV == "None" and options.neuronCSV != "None" and options.debug is False:
        print("\t\t -- WARNING : The number of Core CSV Files should match the number of Neuron CSV Files being converted.")
        print("\t\t\t Currently you are attempting to convert [ 0 ] Core CSV Files and [ 1 ] Neuron CSV Files.")
        canRun = False

    if len(coreList) != len(neuronList) and options.debug is False:
        print("\t\t -- WARNING : The number of Core CSV Files should match the number of Neuron CSV Files being converted.")
        print("\t\t\t Currently you are attempting to convert [ {c} ] Core CSV Files and [ {n} ] Neuron CSV Files.".format(c=len(coreList), n = len(neuronList)))
        canRun = False

    if coreNum != neuronNum and options.debug is False:
        print("\t\t -- WARNING : The number of Core CSV Files should match the number of Neuron CSV Files being converted.")
        print("\t\t\t Currently you are attempting to convert [ {c} ] Core CSV Files and [ {n} ] Neuron CSV Files.".format(c=coreNum, n=neuronNum))
        canRun = False

    if options.coreCSV != "None" and options.neuronCSV != "None" and options.coreCSV == options.neuronCSV and options.debug is False:
        print("\t\t -- WARNING : Core CSV and Neuron CSV are specified as the same CSV File. This is currently incompatible!")
        canRun = False
    
    if canRun is True:
        print("\t-Step 2: Checking Output Bus Location")
        print("\t\t -- Output Bus is set for Core [ {x}, {y} ]. If this is incorrect recommend immediately halting the program now!!".format(x=options.outputBus.split(',')[0], y=options.outputBus.split(',')[1]))
        time.sleep(5)
		
        print("\t-Step 3: Checking Packet CSV File")
        if options.packetCSV == "None":
            print("\t\t -- WARNING : No Packet CSV Specified! If this is incorrect recommend immediately halting the program now!!")
            time.sleep(5)
        else:
            print("\t\t -- Packet CSV Specified as [ {p} ]. If this is incorrect recommend immediately halting the program now!!".format(p = options.packetCSV))
            time.sleep(5)
			
        print("\t-Step 4: Checking Output File")
        print("\t\t -- Output JSON File specified as [ {o} ]. If this is incorrect recommend immediately halting the program now!!".format(o = options.outputFile))
        time.sleep(5)
		
        print("\t-Step 5: Beginning Conversion Process ...")
        outputBus['coordinates'] = options.outputBus.split(',')
        for x in range(len(outputBus['coordinates'])):
            outputBus['coordinates'][x] = int(outputBus['coordinates'][x])

        outputBus['num_outputs'] = options.outputBusNum
        #####################################################
        # Call CSV Main Parsing Function:
        parse_csv(coreList, neuronList, coreNum, packetList, packetNum, options.outputFile, outputBus, options.debug)
        #####################################################
    else:
        print("\n\t -- WARNING SPECIFIED. HALTING CONVERSION PROCESS")
    print("-------------- CSV to JSON Converter END ------------------")
    if canRun is True:
        print("JSON File Printed to: {outputfile}".format(outputfile=options.outputFile))
    
