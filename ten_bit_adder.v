module ten_bit_adder(input1,input2,answer);
   input [0:9] input1,input2;
   output [0:9] answer;

   assign answer = input1 + input2;

endmodule 