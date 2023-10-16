# The next three lines connect the clock port K17 to our clk input	
set_property PACKAGE_PIN K17 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports clk]

#BUTTON0 (BTN0)
set_property PACKAGE_PIN K18 [get_ports {btn0}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn0}]

#LED0 (LD0)
set_property PACKAGE_PIN M14 [get_ports {leds[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[0]}]

#LED1 (LD1)
set_property PACKAGE_PIN M15 [get_ports {leds[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[1]}]

#LED2 (LD2)
set_property PACKAGE_PIN G14 [get_ports {leds[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[2]}]

#LED3 (LD3)
set_property PACKAGE_PIN D18 [get_ports {leds[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[3]}]