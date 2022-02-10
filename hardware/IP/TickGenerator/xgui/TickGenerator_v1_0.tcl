# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ASSERT_INTR_CYCLES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "INPUT_FREQUENCY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TICK_FREQUENCY" -parent ${Page_0}


}

proc update_PARAM_VALUE.ASSERT_INTR_CYCLES { PARAM_VALUE.ASSERT_INTR_CYCLES } {
	# Procedure called to update ASSERT_INTR_CYCLES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASSERT_INTR_CYCLES { PARAM_VALUE.ASSERT_INTR_CYCLES } {
	# Procedure called to validate ASSERT_INTR_CYCLES
	return true
}

proc update_PARAM_VALUE.INPUT_FREQUENCY { PARAM_VALUE.INPUT_FREQUENCY } {
	# Procedure called to update INPUT_FREQUENCY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INPUT_FREQUENCY { PARAM_VALUE.INPUT_FREQUENCY } {
	# Procedure called to validate INPUT_FREQUENCY
	return true
}

proc update_PARAM_VALUE.TICK_FREQUENCY { PARAM_VALUE.TICK_FREQUENCY } {
	# Procedure called to update TICK_FREQUENCY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TICK_FREQUENCY { PARAM_VALUE.TICK_FREQUENCY } {
	# Procedure called to validate TICK_FREQUENCY
	return true
}


proc update_MODELPARAM_VALUE.INPUT_FREQUENCY { MODELPARAM_VALUE.INPUT_FREQUENCY PARAM_VALUE.INPUT_FREQUENCY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INPUT_FREQUENCY}] ${MODELPARAM_VALUE.INPUT_FREQUENCY}
}

proc update_MODELPARAM_VALUE.TICK_FREQUENCY { MODELPARAM_VALUE.TICK_FREQUENCY PARAM_VALUE.TICK_FREQUENCY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TICK_FREQUENCY}] ${MODELPARAM_VALUE.TICK_FREQUENCY}
}

proc update_MODELPARAM_VALUE.ASSERT_INTR_CYCLES { MODELPARAM_VALUE.ASSERT_INTR_CYCLES PARAM_VALUE.ASSERT_INTR_CYCLES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASSERT_INTR_CYCLES}] ${MODELPARAM_VALUE.ASSERT_INTR_CYCLES}
}

