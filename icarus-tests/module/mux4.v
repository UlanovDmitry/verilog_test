module mux4_1_old (
    output out,
    input [3:0] in,
    input [1:0] sel
);

    wire [1:0] sn;
    wire [3:0] y;

    not (sn[1], sel[1]);
    not (sn[0], sel[0]);

    and (y[0], in[0],  sn[1],  sn[0]);
    and (y[1], in[1],  sn[1], sel[0]);
    and (y[2], in[2], sel[1],  sn[0]);
    and (y[3], in[3], sel[1], sel[0]);

    or (out, y[0], y[1], y[2], y[3]);

endmodule

module mux4_1_ext (
    output reg out, // добавлен тип reg для использования внутри always
    input [3:0] in,
    input [1:0] sel
);

    always @(*) begin
        case (sel)
            2'b00: out = in[0];
            2'b01: out = in[1];
            2'b10: out = in[2];
            2'b11: out = in[3];
        endcase
    end

endmodule



module mux4_1 (
    output out,
    input [3:0] in,
    input [1:0] sel
);

    assign out = in[sel];

endmodule