module alu(
    input clk,
    input enable,
    input [4:0] opcode,
    input [3:0] src1_sel,
    input [3:0] src2_sel,
    input [3:0] dst_sel,
    output reg [19:0] dst,
    input [19:0] src1,
    input [19:0] src2,
    input [19:0] src1_imm,
    input [19:0] src2_imm,
    output reg [19:0] adder_out,
    output reg [19:0] subtractor_out,
    output reg [19:0] pc_out
);

// Register file to hold register values and signal to write into any register
reg [19:0] register_file[15:0];

// Adder to perform add operation
always@(posedge clk) begin
    if (enable) begin
        adder_out <= src1 + src2;
    end
end

// Subtractor to perform sub operation
always@(posedge clk) begin
    if (enable) begin
        subtractor_out <= src1 - src2;
    end
end

// PC output
always@(posedge clk) begin
    if (enable) begin
        pc_out <= pc_out + src2;
    end
end

// Select read registers and assign src1 and src2 values
always@(posedge clk) begin
    if (enable) begin
        src1 <= register_file[src1_sel];
        src2 <= register_file[src2_sel];
    end
end

// Select destination register and assign dst value
always@(posedge clk) begin
    if (enable) begin
        case (opcode)
            5'b00000: register_file[dst_sel] <= adder_out;
            5'b00010: register_file[dst_sel] <= subtractor_out;
            // Other operations
            default: register_file[dst_sel] <= 0;
        endcase
    end
end

// Assign immediate values to src1 and src2
always@(posedge clk) begin
    if (enable) begin
        if (opcode[4] == 1) begin
            src1 <= src1_imm;
        end
        if (opcode[3] == 1) begin
            src2 <= src2_imm;
        end
    end
end

endmodule

