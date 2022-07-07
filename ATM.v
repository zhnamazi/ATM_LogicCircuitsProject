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
 
