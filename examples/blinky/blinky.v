`include "clockworks.v"

module SOC (
       input  CLK,        
       input  RESET,      
       output [4:0] LEDS, 
       input  RXD,        
       output TXD         
   );

   wire clk;
   wire resetn;

   reg [4:0] count = 0;
   always @(posedge clk) begin
      count <= !resetn ? 0 : count + 1;
   end

   Clockworks #(
      .SLOW(19)
   )CW(
      .CLK(CLK),
      .RESET(RESET),
      .clk(clk),
      .resetn(resetn)
   );

   assign LEDS = count;
   assign TXD  = 1'b0; // not used for now

endmodule
