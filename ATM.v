//main module ;
module ATM ( select , origin_account_number , purpose_account_number , transfer_amount ,result, inventory_result );

input wire[0:1] select ; 
input wire[0:3] origin_account_number ;
input wire[0:9] transfer_amount ;
input wire[0:3] purpose_account_number ;
output reg[0:1] result ;
output reg[0:9]inventory_result ;
if(select == 00)begin
// exite ;
end
else if(select ==01)begin 
display_inventory(origin_account_number , inventory_result);
end
else if(select == 10) begin
withdraw(origin_account_number , transfer_amount);
end
else if(select == 11)begin
deposit(origin_account_number , purpose_account_number , transfer_amount);
end

endmodule;


//save module ;
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

endmodule ;











