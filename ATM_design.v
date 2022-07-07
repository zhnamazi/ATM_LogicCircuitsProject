<<<<<<< HEAD:ATM_design.v
//`include "ten_bit_adder.v"
//`include "ten_bit_subtractor.v"

module ATM (select, amount, accnumber_origin, accnumber_purpose, result, inventory);

input reg[0:1] select; 
input reg[0:3] accnumber_origin;
input reg[0:3] accnumber_purpose;
input reg[0:9] amount;
output wire[0:1] result;
output wire[0:9]inventory;

reg [0:3] Acc_numbers[0:14]; 
reg [0:9] Balances [0:14];

integer i;
initial begin

  for(i=0;i<15;i++) begin
    Balances[i] = 100;
  end

  if(select == 0) begin
    assign result = 0;

  end else if(select == 1) begin 
    assign inventory = Balances[accnumber_origin];
    assign result = 3;

  end else if(select == 2) begin
    if (Balances[accnumber_origin]=>amount) begin
      assign alances[accnumber_origin] -= amount;
      assign result = 3;
    end else begin
      assign result = 1;
    end

  end else begin
    if (Balances[accnumber_origin]=>amount) begin
      assign Balances[accnumber_origin] -= amount;
      assign Balances[accnumber_purpose] += amount;
      assign result = 3;
    end else begin
      assign result = 2;
    end

  end

end

endmodule;


/*   //save module ;
module save_informations();
// 2d array array of account numbers and inventories ;
// contain 15 cloumns and 2 rows ;
reg [14:0] save_array [0:1];
initial   begin
for(int i = 0 ; i < 15 ; i++) begin
for(int j = 0 ; j < 2 ; j++)  begin
save_array[i][j] = i ;
    end 
  end 
end
endmodule;


// display inventory module ;
module display_inventory(account_number , inventory);
input wire [0:3] account_number ;
output wire [0:9] inventory ;
assign inventory = save_information[account_number][1];
// assign the inventory of input account_number in inventory output ;
// by call the save_information module ;

endmodule ;


//deposit module
module deposit(origin_account_number , purpose_account_number , transfer_amount1 );
input wire[0:3] origin_account_number ;
input wire[0:9] transfer_amount1 ;
input wire[0:3] purpose_account_number ;


//  check the inventory of origin_account_number by save_information module and subtractor module ;
 if(save_information[origin_account_number][1]>save_information[purpose_account_number][1])begin
assign save_information[origin_account_number][1] = save_information[origin_account_number][1]+transfer_amount1
endendmodule;
else 
  begin
end

//withdraw module ;
module withdraw(account_number1 , withdraw_amount);
input wire [0:3] account_number1 ;
input wire[0:9] withdraw_amount ;

//  check the inventory of account_number by save_information module and subtractor module ;
if(save_information[account_number1][1]>withdraw_amount)begin

save_information[account_number1][1] = save_information[account_number1][1]-withdraw_amount 
end 
else
    begin
end

endmodule ; */











=======
//main module ;
module ATM ( select , origin_account_number , purpose_account_number , transfer_amount ,result, inventory_result );

// select:: 00 : display inventory  , 01 : withdraw  , 10 : deposite  , 11 : exite ;  
input wire[0:1] select ; 
input wire[0:3] origin_account_number ;
input wire[0:9] transfer_amount ;
input wire[0:3] purpose_account_number ;
output reg[0:1] result ;
output reg[0:9]inventory_result ;

// array of registers of 15 person inventories ;
reg[0:9]save_inventory[0:3];
// array of registers of 15 person accoount number ; 
reg[0:3] save_account_numbers[0:3];

reg [0:9]  valid_transfer ; // valid amount of transfer money ; 

initial begin
//diaplay inventory ;
if(select==00)begin
assign inventory_result = save_inventory[origin_account_number];
 assign result = 01 ;
  end

else if(select==01)begin
// check for enough money ;
if(transfer_amount<save_inventory[origin_account_number])begin 
save_inventory[origin_account_number] =save_inventory[origin_account_number] - transfer_amount ;
 assign result = 01 ;
end

else begin
assign result = 00 ; 
end
end
// withdraw
else if(select==10) begin
// check the enough inventory ;
if(transfer_amount<save_inventory[origin_account_number])begin

assign valid_transfer = save_inventory[purpose_account_number] ;
if(valid_transfer<transfer_amount)begin 

 save_inventory[purpose_account_number] = 2'b111111110 ;
 save_inventory[origin_account_number] =save_inventory[origin_account_number] - valid_transfer;

       end 
else if(valid_transfer>transfer_amount)begin
 save_inventory[purpose_account_number] = transfer_amount;
 save_inventory[origin_account_number] =save_inventory[origin_account_number] - transfer_amount;
end

     end

  end
else begin 
assign result = 00;
end 
end

endmodule;
 
>>>>>>> 522e3fa2a925c6c5dee86f40dbe45e51b4791053:ATM.v
