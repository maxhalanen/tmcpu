// Program counter test bench

module bench();
    reg CLK;
    reg RST_N = 1;
    wire [31:0] NEXT_PC;
    wire [31:0] PC_OUT;

    pc count (
        .clk(CLK),
        .rst_n(RST_N),
        .pc_in(NEXT_PC),
        .pc_out(PC_OUT)  
    );

    inc_pc inc (
      .pc_in(PC_OUT),
      .pc_out(NEXT_PC)
    );

    initial begin 
        CLK = 0;
        RST_N = 0;
        #10 RST_N = 1;
        
        forever #5 CLK = ~CLK;
    end

    always @(posedge CLK) begin
        $display("PC: %h  %h", NEXT_PC, PC_OUT);
    end

endmodule
