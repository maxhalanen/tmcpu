module SOC (
       input  CLK,        
       input  RESET,      
       output [4:0] LEDS, 
       input  RXD,        
       output TXD         
   );

   reg [4:0] count = 0;
   always @(posedge CLK) begin
      count <= count + 1;
   end
   assign LEDS = count;
   assign TXD  = 1'b0; // not used for now

endmodule
