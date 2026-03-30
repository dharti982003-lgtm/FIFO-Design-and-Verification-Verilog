`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Dharti Patel
// Module Name: fifo_d
// Project Name: Synchronous FIFO-Design-and-Verification-Verilog
// Target Devices: 
// Tool Versions: 
// Description: 
// Dependencies: 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_d #(parameter FIFO_DEPTH = 8, DATA_WIDTH = 32) //fifo stored 8 element and each data has 32bit. 
(input clk, rst, wr_en, rd_en,cs,
input [DATA_WIDTH-1:0] data_in,
output reg [DATA_WIDTH-1:0] data_out,
output empty, full
);

localparam NEW_FIFO_DEPTH = $clog2(FIFO_DEPTH);   //calculates no of bits needed as per fifo depth
  reg [DATA_WIDTH-1:0] fifo [0: FIFO_DEPTH-1];    // MEMORY Declaration
  reg [NEW_FIFO_DEPTH:0] rd_ptr = 0;
  reg [NEW_FIFO_DEPTH:0] wr_ptr = 0;

//WRITE LOGIC
always @ (posedge clk or negedge rst)
begin
  if (!rst)                             //ACTIVE LOW RESET -- systen reset happens
wr_ptr <= 1'b0;
else if(cs && wr_en && !full)begin
  fifo [wr_ptr[NEW_FIFO_DEPTH-1:0]] <= data_in;
wr_ptr <= wr_ptr + 1'b1;                  
end
end

  
//READ LOGIC
always @(posedge clk or negedge rst)
begin 
if (!rst)
rd_ptr <=0;
else if(cs && wr_en && !empty)begin
  data_out <= fifo [rd_ptr[NEW_FIFO_DEPTH-1:0]];
rd_ptr <= rd_ptr + 1'b1; 
end
end

  
//empty and full logic 
assign  empty = (rd_ptr == wr_ptr);
  assign full = (rd_ptr == {~wr_ptr[NEW_FIFO_DEPTH],wr_ptr[NEW_FIFO_DEPTH-1:0]});
endmodule

