`timescale 1ns / 1ps

module mux4_1_tb;

    reg [3:0] bin_counter; 
    reg [1:0] sel;         
    wire out;

    // Подключаем ваш мультиплексор
    mux4_1 uut (
        .out(out),
        .in(bin_counter),
        .sel(sel)
    );

    // ГЕНЕРАТОР ЧАСТОТ: Счетчик считает по кругу каждые 5нс
    initial begin
        bin_counter = 0;
        forever #5 bin_counter = bin_counter + 1;
    end

    // ПОСЛЕДОВАТЕЛЬНОСТЬ ТЕСТА И ЭКСПОРТ ДЛЯ GTKWave
    initial begin
        // Обязательные команды для Icarus Verilog:
        $dumpfile("mux_test.vcd"); // Имя файла с графиками
        $dumpvars(0, mux4_1_tb);    // Записывать все сигналы тестбенча

        // Само тестирование (переключаем каналы каждые 200нс)
        sel = 2'b00; #200; 
        sel = 2'b01; #200; 
        sel = 2'b10; #200; 
        sel = 2'b11; #200; 
        
        $finish;
    end

endmodule
