



module bench();
    reg CLK;
    reg RST_N = 1;
    wire [31:0] NEXT_PC;
    wire [31:0] PC_OUT;
    reg [31:0] NEXT_PC_REG;


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

    always @(posedge CLK or negedge RST_N) begin 
        if (!RST_N) begin
            NEXT_PC_REG <= 32'b0;
        end else begin
            NEXT_PC_REG <= NEXT_PC;
        end
    end


    initial begin 
        CLK = 0;
        RST_N = 0;
        #10 RST_N = 10;
        
        forever #5 CLK = ~CLK;
    end

    always @(posedge CLK) begin
        $display("PC: %b  %b", PC_OUT, NEXT_PC_REG);
    end


endmodule
