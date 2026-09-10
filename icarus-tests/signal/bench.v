`timescale 1ns / 100 ps

module testbench();

reg clk;

initial
begin
    $display("start");

    $dumpfile("test.vcd");
    $dumpvars(0,testbench);

  clk <= 0;
  repeat (100) begin
	#10;
	clk <= 1;
	#10;
	clk <= 0; 
  end

    $display("finish");
end
