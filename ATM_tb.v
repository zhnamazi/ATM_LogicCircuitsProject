`timescale 1ns/1ns
`include "ATM_design.v"

module ATM_tb;

    reg [0:1] Select;
    reg [0:3] AccountNumber_s, AccountNumber_d;
    reg [0:9] Amount;
    wire [0:9] Balance;
    wire [0:1] result;

    ATM_design ins(Select, Amount, AccountNumber_s, AccountNumber_d, result, Balance);

    initial begin
        
        $dumpfile("ATM_tb.vcd");
        $dumpvars(0, ATM_tb);

        $display("0:Khorooj  1:Mojodi  2:Bardasht  3:Enteghal");


        Select = 1; AccountNumber_s = 4; AccountNumber_d = 8; Amount = 50; #10;
        Select = 2; AccountNumber_s = 3; AccountNumber_d = 8; Amount = 70; #10;
        Select = 3; AccountNumber_s = 6; AccountNumber_d = 10; Amount = 40; #10;
        Select = 0; AccountNumber_s = 4; AccountNumber_d = 8; Amount = 50; #10;
        Select = 3; AccountNumber_s = 4; AccountNumber_d = 8; Amount = 50; #10;
        Select = 1; AccountNumber_s = 4; AccountNumber_d = 8; Amount = 50; #10;


        if(Select == 0) begin

            $display("0: Closed");
            $finish;

        end else if(Select==1) begin

            $display("Balance: %d", Balance);

        end else if(Select ==2) begin

            if(result==3) begin
                $display("Receive: %d", Amount);
            end else begin
                $display("Not enough balance");
            end

        end else begin

            if(result==3) begin
                $display("Transfer: %d", Amount);
            end else begin
                $display("Not enough balance");
            end

        end
        

    end
    

endmodule