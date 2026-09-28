iverilog -o mux_sim mux4_1.v mux4_1_tb.v
vvp mux_sim
gtkwave mux_test.vcd
