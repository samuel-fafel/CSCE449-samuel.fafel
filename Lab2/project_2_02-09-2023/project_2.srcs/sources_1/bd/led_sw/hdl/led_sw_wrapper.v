//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Thu Feb  9 16:19:49 2023
//Host        : DESKTOP-JS7 running 64-bit major release  (build 9200)
//Command     : generate_target led_sw_wrapper.bd
//Design      : led_sw_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module led_sw_wrapper
   (clock_rtl,
    led_tri_o);
  input clock_rtl;
  output [3:0]led_tri_o;

  wire clock_rtl;
  wire [3:0]led_tri_o;

  led_sw led_sw_i
       (.clock_rtl(clock_rtl),
        .led_tri_o(led_tri_o));
endmodule
