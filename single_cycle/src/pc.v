// program counter 

module pc (
    input clk,
    input rst_n,
    input [31:0] pc_in,
    output reg [31:0] pc_out
);

    always @(posedge clk or negedge rst_n) begin 
        if (rst_n == 1'b0) begin
            pc_out <= 32'b0;
        end else begin
            pc_out <= pc_in;
        end
    end

endmodule

module inc_pc (
    input  [31:0] pc_in,
    output [31:0] pc_out 
);
    assign pc_out = 4 + pc_in;
endmodule




