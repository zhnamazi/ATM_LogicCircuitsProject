`timescale 1ns/1ns
`include "ten_bit_adder.v"

module ATM_tb;
    wire [0:3] i,j;
    reg [0:9] Balances [0:15];
    reg [0:1] Select;
    reg [0:3] AccountNumber_s, AccountNumber_d;
    reg [0:9] Amount;
    wire [0:9] Balance;
    wire [0:9] result;

    ten_bit_adder ins(Balances[i], Balances[j], result);

    initial begin
        
        $dumpfile("ATM_tb.vcd");
        $dumpvars(0, ATM_tb);

        i=4; j=2;
        Balance[i] = 200; Balances[j] = 100; #10;

        $display("%d", result);
    end
    

endmodule