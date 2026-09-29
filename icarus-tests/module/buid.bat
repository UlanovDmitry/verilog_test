iverilog -o mux_sim.vvp mux4_1.v testbench.v
vvp mux_sim.vvp
gtkwave mux_test.vcd
pause
