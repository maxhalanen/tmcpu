


module memory #(
  parameter WORDS = 64,
  parameter mem_init = ""
  ) (

  input logic clk,
  input logic [31:0] input_addr,
  input logic rst_n,
  output logic [31:0] instruction,

);


reg [31:0] mem [0:WORDS];

initial begin
  if (mem_init != "") begin
    $readmemh(mem_init, mem);
  end
end

always @(posedge clk) begin
  if (rst_n == 1'b0) begin
    for (int i = 0; i < WORDS; i++) begin
      mem[i] <= 32'b0;
    end 
  end else begin
    
  end
end





endmodule




