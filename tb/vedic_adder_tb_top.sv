//TB_TOP connection
`include "vedic_pkg.sv"
`include "vedic8x8.v"
`include "test_if.sv"

import uvm_pkg::*;
import vedic_pkg::*;

`include "base_test.sv"


module vedic_adder_tb_top;

  reg clk;
  

   //reg [7:0] a,b;
   //wire [15:0] prod;

   test_if vif(); // SystemVerilog Interface

   vedic8x8 U0(vif.a, vif.b, vif.prod);

   initial begin
      clk = 0;
      #500;
      //$finish;
   end

   //always@(posedge clk) begin
   //   a = $random;
   //   b = $random;
   //   #20;
   //end

   always #10 clk = !clk;

   reg [7:0] a_reg,b_reg;

   always@(posedge clk) begin
      a_reg <= vif.a;
      b_reg <= vif.b;
   end

   always@(posedge clk)begin
      if((a_reg > 0) && (b_reg > 0)) begin
         if(vif.prod == a_reg *b_reg)
            $display("%d x %d = %d, Test Passed", a_reg, b_reg, vif.prod);
         else
            $display("%d x %d = %d, Test Failed", a_reg, b_reg, vif.prod);
      end
   end

   initial begin
      uvm_config_db#(virtual test_if)::set(null, "*", "vif", vif);
      run_test();
   end

endmodule
