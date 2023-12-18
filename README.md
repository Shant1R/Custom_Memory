# Custom_Memory
Under the repo, we will be looking into the abstract view of a custom RAM and ROM, and model them using HDL, specifically verilog.


## Custom RAM

From an abstract view, considering RAM as a black box, it will have a clock input for keeping a synchronus read and write operation. The input for the RAM are the read and write enable, read and write adderess. Write data will be given as input and write output is taken as the output from the RAM. 

```bash
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
```
*NOTE* - The design is synthesized for FPGA implementation here on. The RTL will be the same for ASIC flow as well. Just the difference will be, for ASIC flow, the WIDTH and DEPTH of the Custom RAM will be fixed, whereas under FPGA flow, one has the freedom for parameterisig them as per need. 

The block diagram for the given code. 
Elaborated Design

![image](https://github.com/Shant1R/Custom_Memory/assets/59409568/b20eb50f-f303-40e3-a8ac-86852287408e)

Upon synthesis, it is verified that the given RTL is synthesizable on hardware. The further implementation can be done by defining the board, and specifiying the pins for clock and the other input and outputs.

Synthesized Schematic

![image](https://github.com/Shant1R/Custom_Memory/assets/59409568/17c05dde-d8a9-47c6-bf99-51b2f7dd2b6e)
