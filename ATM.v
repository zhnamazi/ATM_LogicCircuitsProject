//main module ;
module ATM ( select , origin_account_number , purpose_account_number , transfer_amount ,result, inventory_result );

input wire[0:1] select ; 
input wire[0:3] origin_account_number ;
input wire[0:9] transfer_amount ;
input wire[0:3] purpose_account_number ;
output reg[0:1] result ;
output reg[0:9]inventory_result ;

endmodule;


//save module ;
module save_informations();
// 2d array array of account numbers and inventories ;
// contain 15 cloumns and 2 rows ;
reg [14:0] save_array [0:1];
endmodule;


// display inventory module ;
module display_inventory(account_number , inventory);
input wire [0:3] account_number ;
output wire [0:9] inventory ;
// assign the inventory of input account_number in inventory output ;
// by call the save_information module ;

endmodule ;


//deposit module
module deposit(origin_account_number , purpose_account_number , transfer_amount1 , origin_account_inventory);
input wire[0:3] origin_account_number ;
input wire[0:9] transfer_amount1 ;
input wire[0:3] purpose_account_number ;
output reg[0:9] origin_account_inventory ;
//  check the inventory of origin_account_number by save_information module and subtractor module ;

endmodule;


//withdraw module ;
module withdraw(account_number1 , withdraw_amount , account_inventory);
input wire [0:3] account_number1 ;
input wire[0:9] withdraw_amount ;
output reg[0:9]account_inventory;
//  check the inventory of account_number by save_information module and subtractor module ;

endmodule ;











