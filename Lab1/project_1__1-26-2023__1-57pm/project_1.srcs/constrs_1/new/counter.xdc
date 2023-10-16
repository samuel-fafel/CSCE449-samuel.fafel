# CLOCK
set_property PACKAGE_PIN K17 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
create_clock -add -name sys_clk_pin -period 24.00 -waveform {0 4} [get_ports clk]

## Buttons
set_property PACKAGE_PIN K18 [get_ports {BTN0}]
set_property IOSTANDARD LVCMOS33 [get_ports {BTN0}]

set_property PACKAGE_PIN P16 [get_ports {BTN1}]
set_property IOSTANDARD LVCMOS33 [get_ports {BTN1}]

set_property PACKAGE_PIN Y16 [get_ports {BTN3}]
set_property IOSTANDARD LVCMOS33 [get_ports {BTN3}]

## LEDs
set_property PACKAGE_PIN M14 [get_ports {LEDS[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[0]}]

set_property PACKAGE_PIN M15 [get_ports {LEDS[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[1]}]

set_property PACKAGE_PIN G14 [get_ports {LEDS[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[2]}]

set_property PACKAGE_PIN D18 [get_ports {LEDS[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[3]}]