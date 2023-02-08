module register_file (
  input clk,
  input enable,
  input [19:0] write_data,
  input [3:0] write_register,
  input [3:0] select_read_1,
  input [3:0] select_read_2,
  output [19:0] read_data_1,
  output [19:0] read_data_2
);
// Declare registers
reg [19:0] registers [15:0];
// Read data from selected registers
always @(*) begin
  read_data_1 = registers[select_read_1];
  read_data_2 = registers[select_read_2];
end
// Write to register on rising edge of clock
always @(posedge clk) begin
  if (enable) begin
    registers[write_register] <= write_data;
  end
end
endmodule



