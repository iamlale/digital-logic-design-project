module register (
    input clk,
    input reset,
    input [15:0] din,
    input wr,
    output [15:0] dout
);
    reg [15:0] dout;

    always @(posedge clk) begin
        if (reset)
            dout <= 16'b0;
        else if (wr)
            dout <= din;
    end
endmodule
