module Clockworks #(
    parameter SLOW = 0
)(
    input CLK,
    input RESET,
    output clk,
    output resetn
);

    reg [SLOW:0] slowdown = 0;

    always @(posedge CLK) begin
        slowdown = slowdown + 1;
    end
    
    assign clk = slowdown[SLOW];

endmodule