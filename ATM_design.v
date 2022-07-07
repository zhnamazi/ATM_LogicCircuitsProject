module ATM (select, amount, accnumber_origin, accnumber_purpose, result, inventory);

input wire[0:1] select; 
input wire[0:3] accnumber_origin;
input wire[0:3] accnumber_purpose;
input wire[0:9] amount;
output reg[0:1] result;
output reg[0:9]inventory;

reg [0:3] Acc_numbers[0:14]; 
reg [0:9] Balances [0:14];

integer i;
initial begin

  for(i=0;i<15;i=i+1) begin
    Balances[i] = 100;
  end

  if(select == 0) begin
     result = 0;

  end 
else if(select == 1) begin 
     inventory = Balances[accnumber_origin];
     result = 3;

  end 
else if(select == 2) begin
    if (Balances[accnumber_origin]>=amount) begin
      Balances[accnumber_origin] = amount-Balances[accnumber_origin];
       result = 3;
    end 
else begin
       result = 1;
    end

  end 
else begin
    if (Balances[accnumber_origin]>=amount) begin
       Balances[accnumber_origin] = amount-Balances[accnumber_origin];
       Balances[accnumber_purpose] = amount+Balances[accnumber_purpose];
       result = 3;
    end 
else begin
       result = 2;
    end

  end

end

endmodule;
