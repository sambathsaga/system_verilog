`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module tb;
  logic clk;
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  dff_intf vif(clk);
  
  dff dut(.clk(clk),.rst(vif.rst),.d(vif.d),.q(vif.q));
  
  test t;
  initial begin
    t=new(vif);
    t.run();
    $dumpfile("wave.vcd");
    $dumpvars(0,tb);
  end
endmodule
