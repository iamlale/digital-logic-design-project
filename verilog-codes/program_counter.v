module program_counter (
    input clk,
    input reset,
    input [19:0] pc_in,
    input pc_en,
    output [19:0] pc_out
);
    reg [19:0] pc;

    always @(posedge clk) begin
        if (reset)
            pc <= 20'b0;
        else if (pc_en)
            pc <= pc_in;
    end

    assign pc_out = pc;
endmodule
