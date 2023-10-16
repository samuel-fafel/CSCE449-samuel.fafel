set_property SRC_FILE_INFO {cfile:/home/ugrads/s/samuel.fafel/Desktop/ecen449/project_2/project_2.srcs/sources_1/bd/led_sw/ip/led_sw_clk_wiz_1_0/led_sw_clk_wiz_1_0.xdc rfile:../../../project_2.srcs/sources_1/bd/led_sw/ip/led_sw_clk_wiz_1_0/led_sw_clk_wiz_1_0.xdc id:1 order:EARLY scoped_inst:led_sw_i/clk_wiz_1/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/home/ugrads/s/samuel.fafel/Desktop/ecen449/project_2/project_2.srcs/constrs_1/new/led.xdc rfile:../../../project_2.srcs/constrs_1/new/led.xdc id:2} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
set_property src_info {type:XDC file:2 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_clock −add −name sys_clk_pin −period 10.00 −waveform {0 5} [get_ports clock_rtl]
