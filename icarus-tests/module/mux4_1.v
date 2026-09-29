module mux4_1 (
    output out,
    input [3:0] in,
    input [1:0] sel
);

    assign out = in[sel];

endmodule