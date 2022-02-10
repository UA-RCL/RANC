# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "C_M00_AXIS_START_COUNT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M00_AXIS_TDATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FIFO_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUM_CLASSES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PACKET_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "STREAM_DEPTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.C_M00_AXIS_START_COUNT { PARAM_VALUE.C_M00_AXIS_START_COUNT } {
	# Procedure called to update C_M00_AXIS_START_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXIS_START_COUNT { PARAM_VALUE.C_M00_AXIS_START_COUNT } {
	# Procedure called to validate C_M00_AXIS_START_COUNT
	return true
}

proc update_PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M00_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M00_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.FIFO_DEPTH { PARAM_VALUE.FIFO_DEPTH } {
	# Procedure called to update FIFO_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIFO_DEPTH { PARAM_VALUE.FIFO_DEPTH } {
	# Procedure called to validate FIFO_DEPTH
	return true
}

proc update_PARAM_VALUE.NUM_CLASSES { PARAM_VALUE.NUM_CLASSES } {
	# Procedure called to update NUM_CLASSES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_CLASSES { PARAM_VALUE.NUM_CLASSES } {
	# Procedure called to validate NUM_CLASSES
	return true
}

proc update_PARAM_VALUE.PACKET_WIDTH { PARAM_VALUE.PACKET_WIDTH } {
	# Procedure called to update PACKET_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PACKET_WIDTH { PARAM_VALUE.PACKET_WIDTH } {
	# Procedure called to validate PACKET_WIDTH
	return true
}

proc update_PARAM_VALUE.STREAM_DEPTH { PARAM_VALUE.STREAM_DEPTH } {
	# Procedure called to update STREAM_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.STREAM_DEPTH { PARAM_VALUE.STREAM_DEPTH } {
	# Procedure called to validate STREAM_DEPTH
	return true
}


proc update_MODELPARAM_VALUE.PACKET_WIDTH { MODELPARAM_VALUE.PACKET_WIDTH PARAM_VALUE.PACKET_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PACKET_WIDTH}] ${MODELPARAM_VALUE.PACKET_WIDTH}
}

proc update_MODELPARAM_VALUE.NUM_CLASSES { MODELPARAM_VALUE.NUM_CLASSES PARAM_VALUE.NUM_CLASSES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_CLASSES}] ${MODELPARAM_VALUE.NUM_CLASSES}
}

proc update_MODELPARAM_VALUE.FIFO_DEPTH { MODELPARAM_VALUE.FIFO_DEPTH PARAM_VALUE.FIFO_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_DEPTH}] ${MODELPARAM_VALUE.FIFO_DEPTH}
}

proc update_MODELPARAM_VALUE.STREAM_DEPTH { MODELPARAM_VALUE.STREAM_DEPTH PARAM_VALUE.STREAM_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.STREAM_DEPTH}] ${MODELPARAM_VALUE.STREAM_DEPTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M00_AXIS_TDATA_WIDTH PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M00_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXIS_START_COUNT { MODELPARAM_VALUE.C_M00_AXIS_START_COUNT PARAM_VALUE.C_M00_AXIS_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXIS_START_COUNT}] ${MODELPARAM_VALUE.C_M00_AXIS_START_COUNT}
}

