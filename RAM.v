`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2023 11:14:16 AM
// Design Name: 
// Module Name: RAM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RAM #(parameter WIDTH = 8, DEPTH = 8)
    (input clk,
     input wrEn, rdEn,
     input [$clog2(DEPTH)-1:0] wraddr, rdaddr,
     input [WIDTH-1:0] wrdata, 
     output reg [WIDTH-1:0] rddata
    );
    
    reg [WIDTH -1:0] mem [DEPTH-1:0];
    
    always@(posedge clk) begin
        if(wrEn)
            mem[wraddr] <=wrdata;
    end
    
    always@(posedge clk) begin
        if(rdEn)
            rddata <= mem[rdaddr];
    end
    
endmodule
