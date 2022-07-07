`timescale 1ns/1ns
`include "ten_bit_adder.v"
`include "ten_bit_subtractor.v"

module ATM_tb;

    reg [0:1] Select;
    reg [0:3] Acc_numbers[0:15]; 
    reg [0:9] Balances [0:15];
    //reg [0:3] AccountNumber_s, AccountNumber_d;
    //reg [0:9] Amount;
    //wire [0:9] Balance;
    //wire [0:1] result;

    //ten_bit_subtractor ins(a, b, result);
    integer  i;
    initial begin
        
        $dumpfile("ATM_tb.vcd");
        $dumpvars(0, ATM_tb);

        $display("0:Khorooj  1:Mojodi  2:Bardasht  3:Enteghal");

        for(i = 0 ; i < 16 ; i = i++) begin
            Balances[i] = 100;
        end

        //$display("%d", result);
    end
    

endmodule