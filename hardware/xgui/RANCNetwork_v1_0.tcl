# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Grid Parameters}]
  ipgui::add_param $IPINST -name "GRID_DIMENSION_X" -parent ${Page_0}
  ipgui::add_param $IPINST -name "GRID_DIMENSION_Y" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OUTPUT_CORE_X_COORDINATE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OUTPUT_CORE_Y_COORDINATE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MAX_DIMENSION_X" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MAX_DIMENSION_Y" -parent ${Page_0}
  ipgui::add_param $IPINST -name "INPUT_BUFFER_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUM_OUTPUTS" -parent ${Page_0}

  #Adding Page
  set AXI_Parameters [ipgui::add_page $IPINST -name "AXI Parameters"]
  ipgui::add_param $IPINST -name "MAXIMUM_NUMBER_OF_PACKETS" -parent ${AXI_Parameters}
  ipgui::add_param $IPINST -name "C_S00_AXIS_TDATA_WIDTH" -parent ${AXI_Parameters}

  #Adding Page
  set CSRAM_Parameters [ipgui::add_page $IPINST -name "CSRAM Parameters"]
  ipgui::add_param $IPINST -name "MEMORY_FILEPATH" -parent ${CSRAM_Parameters}
  ipgui::add_param $IPINST -name "NUM_NEURONS" -parent ${CSRAM_Parameters}
  ipgui::add_param $IPINST -name "NUM_AXONS" -parent ${CSRAM_Parameters}
  ipgui::add_param $IPINST -name "NUM_TICKS" -parent ${CSRAM_Parameters}
  ipgui::add_param $IPINST -name "NUM_WEIGHTS" -parent ${CSRAM_Parameters}
  ipgui::add_param $IPINST -name "NUM_RESET_MODES" -parent ${CSRAM_Parameters}
  ipgui::add_param $IPINST -name "LEAK_WIDTH" -parent ${CSRAM_Parameters}
  ipgui::add_param $IPINST -name "POTENTIAL_WIDTH" -parent ${CSRAM_Parameters}
  ipgui::add_param $IPINST -name "THRESHOLD_WIDTH" -parent ${CSRAM_Parameters}
  ipgui::add_param $IPINST -name "WEIGHT_WIDTH" -parent ${CSRAM_Parameters}

  #Adding Page
  set Router_Parameters [ipgui::add_page $IPINST -name "Router Parameters"]
  ipgui::add_param $IPINST -name "ROUTER_BUFFER_DEPTH" -parent ${Router_Parameters}


}

proc update_PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S00_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S00_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.GRID_DIMENSION_X { PARAM_VALUE.GRID_DIMENSION_X } {
	# Procedure called to update GRID_DIMENSION_X when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GRID_DIMENSION_X { PARAM_VALUE.GRID_DIMENSION_X } {
	# Procedure called to validate GRID_DIMENSION_X
	return true
}

proc update_PARAM_VALUE.GRID_DIMENSION_Y { PARAM_VALUE.GRID_DIMENSION_Y } {
	# Procedure called to update GRID_DIMENSION_Y when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GRID_DIMENSION_Y { PARAM_VALUE.GRID_DIMENSION_Y } {
	# Procedure called to validate GRID_DIMENSION_Y
	return true
}

proc update_PARAM_VALUE.INPUT_BUFFER_DEPTH { PARAM_VALUE.INPUT_BUFFER_DEPTH } {
	# Procedure called to update INPUT_BUFFER_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INPUT_BUFFER_DEPTH { PARAM_VALUE.INPUT_BUFFER_DEPTH } {
	# Procedure called to validate INPUT_BUFFER_DEPTH
	return true
}

proc update_PARAM_VALUE.LEAK_WIDTH { PARAM_VALUE.LEAK_WIDTH } {
	# Procedure called to update LEAK_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LEAK_WIDTH { PARAM_VALUE.LEAK_WIDTH } {
	# Procedure called to validate LEAK_WIDTH
	return true
}

proc update_PARAM_VALUE.MAXIMUM_NUMBER_OF_PACKETS { PARAM_VALUE.MAXIMUM_NUMBER_OF_PACKETS } {
	# Procedure called to update MAXIMUM_NUMBER_OF_PACKETS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAXIMUM_NUMBER_OF_PACKETS { PARAM_VALUE.MAXIMUM_NUMBER_OF_PACKETS } {
	# Procedure called to validate MAXIMUM_NUMBER_OF_PACKETS
	return true
}

proc update_PARAM_VALUE.MAX_DIMENSION_X { PARAM_VALUE.MAX_DIMENSION_X } {
	# Procedure called to update MAX_DIMENSION_X when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_DIMENSION_X { PARAM_VALUE.MAX_DIMENSION_X } {
	# Procedure called to validate MAX_DIMENSION_X
	return true
}

proc update_PARAM_VALUE.MAX_DIMENSION_Y { PARAM_VALUE.MAX_DIMENSION_Y } {
	# Procedure called to update MAX_DIMENSION_Y when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_DIMENSION_Y { PARAM_VALUE.MAX_DIMENSION_Y } {
	# Procedure called to validate MAX_DIMENSION_Y
	return true
}

proc update_PARAM_VALUE.MEMORY_FILEPATH { PARAM_VALUE.MEMORY_FILEPATH } {
	# Procedure called to update MEMORY_FILEPATH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEMORY_FILEPATH { PARAM_VALUE.MEMORY_FILEPATH } {
	# Procedure called to validate MEMORY_FILEPATH
	return true
}

proc update_PARAM_VALUE.NUM_AXONS { PARAM_VALUE.NUM_AXONS } {
	# Procedure called to update NUM_AXONS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_AXONS { PARAM_VALUE.NUM_AXONS } {
	# Procedure called to validate NUM_AXONS
	return true
}

proc update_PARAM_VALUE.NUM_NEURONS { PARAM_VALUE.NUM_NEURONS } {
	# Procedure called to update NUM_NEURONS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_NEURONS { PARAM_VALUE.NUM_NEURONS } {
	# Procedure called to validate NUM_NEURONS
	return true
}

proc update_PARAM_VALUE.NUM_OUTPUTS { PARAM_VALUE.NUM_OUTPUTS } {
	# Procedure called to update NUM_OUTPUTS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_OUTPUTS { PARAM_VALUE.NUM_OUTPUTS } {
	# Procedure called to validate NUM_OUTPUTS
	return true
}

proc update_PARAM_VALUE.NUM_RESET_MODES { PARAM_VALUE.NUM_RESET_MODES } {
	# Procedure called to update NUM_RESET_MODES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_RESET_MODES { PARAM_VALUE.NUM_RESET_MODES } {
	# Procedure called to validate NUM_RESET_MODES
	return true
}

proc update_PARAM_VALUE.NUM_TICKS { PARAM_VALUE.NUM_TICKS } {
	# Procedure called to update NUM_TICKS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_TICKS { PARAM_VALUE.NUM_TICKS } {
	# Procedure called to validate NUM_TICKS
	return true
}

proc update_PARAM_VALUE.NUM_WEIGHTS { PARAM_VALUE.NUM_WEIGHTS } {
	# Procedure called to update NUM_WEIGHTS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_WEIGHTS { PARAM_VALUE.NUM_WEIGHTS } {
	# Procedure called to validate NUM_WEIGHTS
	return true
}

proc update_PARAM_VALUE.OUTPUT_CORE_X_COORDINATE { PARAM_VALUE.OUTPUT_CORE_X_COORDINATE } {
	# Procedure called to update OUTPUT_CORE_X_COORDINATE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OUTPUT_CORE_X_COORDINATE { PARAM_VALUE.OUTPUT_CORE_X_COORDINATE } {
	# Procedure called to validate OUTPUT_CORE_X_COORDINATE
	return true
}

proc update_PARAM_VALUE.OUTPUT_CORE_Y_COORDINATE { PARAM_VALUE.OUTPUT_CORE_Y_COORDINATE } {
	# Procedure called to update OUTPUT_CORE_Y_COORDINATE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OUTPUT_CORE_Y_COORDINATE { PARAM_VALUE.OUTPUT_CORE_Y_COORDINATE } {
	# Procedure called to validate OUTPUT_CORE_Y_COORDINATE
	return true
}

proc update_PARAM_VALUE.POTENTIAL_WIDTH { PARAM_VALUE.POTENTIAL_WIDTH } {
	# Procedure called to update POTENTIAL_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.POTENTIAL_WIDTH { PARAM_VALUE.POTENTIAL_WIDTH } {
	# Procedure called to validate POTENTIAL_WIDTH
	return true
}

proc update_PARAM_VALUE.ROUTER_BUFFER_DEPTH { PARAM_VALUE.ROUTER_BUFFER_DEPTH } {
	# Procedure called to update ROUTER_BUFFER_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ROUTER_BUFFER_DEPTH { PARAM_VALUE.ROUTER_BUFFER_DEPTH } {
	# Procedure called to validate ROUTER_BUFFER_DEPTH
	return true
}

proc update_PARAM_VALUE.THRESHOLD_WIDTH { PARAM_VALUE.THRESHOLD_WIDTH } {
	# Procedure called to update THRESHOLD_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.THRESHOLD_WIDTH { PARAM_VALUE.THRESHOLD_WIDTH } {
	# Procedure called to validate THRESHOLD_WIDTH
	return true
}

proc update_PARAM_VALUE.WEIGHT_WIDTH { PARAM_VALUE.WEIGHT_WIDTH } {
	# Procedure called to update WEIGHT_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WEIGHT_WIDTH { PARAM_VALUE.WEIGHT_WIDTH } {
	# Procedure called to validate WEIGHT_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.GRID_DIMENSION_X { MODELPARAM_VALUE.GRID_DIMENSION_X PARAM_VALUE.GRID_DIMENSION_X } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GRID_DIMENSION_X}] ${MODELPARAM_VALUE.GRID_DIMENSION_X}
}

proc update_MODELPARAM_VALUE.GRID_DIMENSION_Y { MODELPARAM_VALUE.GRID_DIMENSION_Y PARAM_VALUE.GRID_DIMENSION_Y } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GRID_DIMENSION_Y}] ${MODELPARAM_VALUE.GRID_DIMENSION_Y}
}

proc update_MODELPARAM_VALUE.MAX_DIMENSION_X { MODELPARAM_VALUE.MAX_DIMENSION_X PARAM_VALUE.MAX_DIMENSION_X } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_DIMENSION_X}] ${MODELPARAM_VALUE.MAX_DIMENSION_X}
}

proc update_MODELPARAM_VALUE.MAX_DIMENSION_Y { MODELPARAM_VALUE.MAX_DIMENSION_Y PARAM_VALUE.MAX_DIMENSION_Y } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_DIMENSION_Y}] ${MODELPARAM_VALUE.MAX_DIMENSION_Y}
}

proc update_MODELPARAM_VALUE.OUTPUT_CORE_X_COORDINATE { MODELPARAM_VALUE.OUTPUT_CORE_X_COORDINATE PARAM_VALUE.OUTPUT_CORE_X_COORDINATE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OUTPUT_CORE_X_COORDINATE}] ${MODELPARAM_VALUE.OUTPUT_CORE_X_COORDINATE}
}

proc update_MODELPARAM_VALUE.OUTPUT_CORE_Y_COORDINATE { MODELPARAM_VALUE.OUTPUT_CORE_Y_COORDINATE PARAM_VALUE.OUTPUT_CORE_Y_COORDINATE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OUTPUT_CORE_Y_COORDINATE}] ${MODELPARAM_VALUE.OUTPUT_CORE_Y_COORDINATE}
}

proc update_MODELPARAM_VALUE.NUM_OUTPUTS { MODELPARAM_VALUE.NUM_OUTPUTS PARAM_VALUE.NUM_OUTPUTS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_OUTPUTS}] ${MODELPARAM_VALUE.NUM_OUTPUTS}
}

proc update_MODELPARAM_VALUE.NUM_NEURONS { MODELPARAM_VALUE.NUM_NEURONS PARAM_VALUE.NUM_NEURONS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_NEURONS}] ${MODELPARAM_VALUE.NUM_NEURONS}
}

proc update_MODELPARAM_VALUE.NUM_AXONS { MODELPARAM_VALUE.NUM_AXONS PARAM_VALUE.NUM_AXONS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_AXONS}] ${MODELPARAM_VALUE.NUM_AXONS}
}

proc update_MODELPARAM_VALUE.NUM_TICKS { MODELPARAM_VALUE.NUM_TICKS PARAM_VALUE.NUM_TICKS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_TICKS}] ${MODELPARAM_VALUE.NUM_TICKS}
}

proc update_MODELPARAM_VALUE.NUM_WEIGHTS { MODELPARAM_VALUE.NUM_WEIGHTS PARAM_VALUE.NUM_WEIGHTS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_WEIGHTS}] ${MODELPARAM_VALUE.NUM_WEIGHTS}
}

proc update_MODELPARAM_VALUE.NUM_RESET_MODES { MODELPARAM_VALUE.NUM_RESET_MODES PARAM_VALUE.NUM_RESET_MODES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_RESET_MODES}] ${MODELPARAM_VALUE.NUM_RESET_MODES}
}

proc update_MODELPARAM_VALUE.POTENTIAL_WIDTH { MODELPARAM_VALUE.POTENTIAL_WIDTH PARAM_VALUE.POTENTIAL_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.POTENTIAL_WIDTH}] ${MODELPARAM_VALUE.POTENTIAL_WIDTH}
}

proc update_MODELPARAM_VALUE.WEIGHT_WIDTH { MODELPARAM_VALUE.WEIGHT_WIDTH PARAM_VALUE.WEIGHT_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WEIGHT_WIDTH}] ${MODELPARAM_VALUE.WEIGHT_WIDTH}
}

proc update_MODELPARAM_VALUE.LEAK_WIDTH { MODELPARAM_VALUE.LEAK_WIDTH PARAM_VALUE.LEAK_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LEAK_WIDTH}] ${MODELPARAM_VALUE.LEAK_WIDTH}
}

proc update_MODELPARAM_VALUE.THRESHOLD_WIDTH { MODELPARAM_VALUE.THRESHOLD_WIDTH PARAM_VALUE.THRESHOLD_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.THRESHOLD_WIDTH}] ${MODELPARAM_VALUE.THRESHOLD_WIDTH}
}

proc update_MODELPARAM_VALUE.INPUT_BUFFER_DEPTH { MODELPARAM_VALUE.INPUT_BUFFER_DEPTH PARAM_VALUE.INPUT_BUFFER_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INPUT_BUFFER_DEPTH}] ${MODELPARAM_VALUE.INPUT_BUFFER_DEPTH}
}

proc update_MODELPARAM_VALUE.ROUTER_BUFFER_DEPTH { MODELPARAM_VALUE.ROUTER_BUFFER_DEPTH PARAM_VALUE.ROUTER_BUFFER_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ROUTER_BUFFER_DEPTH}] ${MODELPARAM_VALUE.ROUTER_BUFFER_DEPTH}
}

proc update_MODELPARAM_VALUE.MEMORY_FILEPATH { MODELPARAM_VALUE.MEMORY_FILEPATH PARAM_VALUE.MEMORY_FILEPATH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEMORY_FILEPATH}] ${MODELPARAM_VALUE.MEMORY_FILEPATH}
}

proc update_MODELPARAM_VALUE.MAXIMUM_NUMBER_OF_PACKETS { MODELPARAM_VALUE.MAXIMUM_NUMBER_OF_PACKETS PARAM_VALUE.MAXIMUM_NUMBER_OF_PACKETS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAXIMUM_NUMBER_OF_PACKETS}] ${MODELPARAM_VALUE.MAXIMUM_NUMBER_OF_PACKETS}
}

proc update_MODELPARAM_VALUE.C_S00_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S00_AXIS_TDATA_WIDTH PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXIS_TDATA_WIDTH}
}

