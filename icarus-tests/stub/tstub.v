module test_stub;

reg clk;
reg sig_fast;
reg sig_slow;

// экземпляр тестируемого модуля (заглушка)
stub stub_inst (
    .clk(clk),
    .sig_fast(sig_fast),
    .sig_slow(sig_slow)
);

// тактовая частота
always
  #10 clk = ~clk;

initial
begin
  clk = 0;
  sig_fast = 0;
  sig_slow = 0;
end

// первый сигнал: переключается на каждом такте
always @(posedge clk)
  sig_fast <= ~sig_fast;

// второй сигнал: переключается через два такта
reg div2;
initial div2 = 0;

always @(posedge clk)
begin
  div2 <= ~div2;
  if (div2)
    sig_slow <= ~sig_slow;
end

// конец симуляции
initial
begin
  #400 $finish;
end

// VCD для просмотра волн
initial
begin
  $dumpfile("stub.vcd");
  $dumpvars(0, test_stub);
end

initial
  $monitor($stime,, clk,, sig_fast,, sig_slow);

endmodule
