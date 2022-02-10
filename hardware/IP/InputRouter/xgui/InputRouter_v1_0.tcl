
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/InputRouter_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  set FILENAME [ipgui::add_param $IPINST -name "FILENAME" -parent ${Page_0}]
  set_property tooltip {Path to input file} ${FILENAME}
  ipgui::add_param $IPINST -name "NUM_PACKETS" -parent ${Page_0}


}

proc update_PARAM_VALUE.bitwidth { PARAM_VALUE.bitwidth PARAM_VALUE.NUM_PACKETS } {
	# Procedure called to update bitwidth when any of the dependent parameters in the arguments change
	
	set bitwidth ${PARAM_VALUE.bitwidth}
	set NUM_PACKETS ${PARAM_VALUE.NUM_PACKETS}
	set values(NUM_PACKETS) [get_property value $NUM_PACKETS]
	set_property value [gen_USERPARAMETER_bitwidth_VALUE $values(NUM_PACKETS)] $bitwidth
}

proc validate_PARAM_VALUE.bitwidth { PARAM_VALUE.bitwidth } {
	# Procedure called to validate bitwidth
	return true
}

proc update_PARAM_VALUE.FILENAME { PARAM_VALUE.FILENAME } {
	# Procedure called to update FILENAME when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILENAME { PARAM_VALUE.FILENAME } {
	# Procedure called to validate FILENAME
	return true
}

proc update_PARAM_VALUE.NUM_PACKETS { PARAM_VALUE.NUM_PACKETS } {
	# Procedure called to update NUM_PACKETS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_PACKETS { PARAM_VALUE.NUM_PACKETS } {
	# Procedure called to validate NUM_PACKETS
	return true
}


proc update_MODELPARAM_VALUE.FILENAME { MODELPARAM_VALUE.FILENAME PARAM_VALUE.FILENAME } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILENAME}] ${MODELPARAM_VALUE.FILENAME}
}

proc update_MODELPARAM_VALUE.NUM_PACKETS { MODELPARAM_VALUE.NUM_PACKETS PARAM_VALUE.NUM_PACKETS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_PACKETS}] ${MODELPARAM_VALUE.NUM_PACKETS}
}

proc update_MODELPARAM_VALUE.bitwidth { MODELPARAM_VALUE.bitwidth PARAM_VALUE.bitwidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.bitwidth}] ${MODELPARAM_VALUE.bitwidth}
}

