`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Engineer:Dharti Patel
// Module Name: fifo_tb
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


module fifo_tb;
parameter FIFO_DEPTH = 8;
parameter DATA_WIDTH = 32;
reg clk, rst, wr_en, rd_en,cs;
reg [DATA_WIDTH-1:0] data_in;
wire [DATA_WIDTH-1:0] data_out;
wire empty, full;
integer i;
fifo_d   #(.FIFO_DEPTH(FIFO_DEPTH),.DATA_WIDTH(DATA_WIDTH))
dut (
  .clk      (clk),
  .rst    (rst),
  .cs       (cs),
  .wr_en    (wr_en),
  .rd_en    (rd_en),
  .data_in  (data_in),
  .data_out (data_out),
  .empty    (empty),
  .full     (full)
);
  
initial clk=1'b0;
always begin 
  #10 clk = ~clk; 
end
task write_data(input [DATA_WIDTH-1:0] d_in);
begin
  @(posedge clk);   // wait for clock edge
  cs = 1; wr_en = 1;
  data_in = d_in;

  $display($time, " write_data data_in = %0d", data_in);

  @(posedge clk);
  cs = 1; wr_en = 0;
end
endtask 

task read_data();
begin
  @(posedge clk);
  cs = 1; rd_en = 1;

  @(posedge clk);

  $display($time, " read_data data_out = %0d", data_out);

  cs = 1; rd_en = 0;
end
endtask

initial begin 
#1;
rst = 0; rd_en =0 ; wr_en =0;
@(posedge clk)
rst=1;
  
$display($time,"\n SCENARIO 1");
write_data(1);
write_data(10);
write_data(100);
read_data();
read_data();
read_data();
  
  //reading and writing immediately
$display($time,"\n SCENARIO 2");
for(i=0; i<FIFO_DEPTH; i=i+1)begin
write_data(2**i);
read_data();
end

$display($time,"\n SCENARIO 3");
for(i=0; i<FIFO_DEPTH; i=i+1)begin
write_data(2**i);
end

for(i=0; i<FIFO_DEPTH; i=i+1)begin
read_data();
end

#40 $finish;
end


endmodule 
