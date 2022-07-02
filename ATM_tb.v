`timescale 1ns/1ns
`include "ten_bit_adder.v"
`include "ten_bit_subtractor.v"

module ATM_tb;

    reg [0:1] Select;
    reg [0:9] Balances [0:15];
    reg [0:3] AccountNumber_s, AccountNumber_d;
    reg [0:9] Amount;
    wire [0:9] Balance;
    wire [0:1] result;

    ten_bit_subtractor ins(a, b, result);

    initial begin
        
        $dumpfile("ATM_tb.vcd");
        $dumpvars(0, ATM_tb);

        a=200 ;b = 100; #10;

        $display("%d", result);
    end
    

endmodule