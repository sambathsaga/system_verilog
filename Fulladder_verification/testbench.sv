`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module tb;
  fa_intf vif();
  
  fa dut(.a(vif.a),.b(vif.b),.cin(vif.cin),.sum(vif.sum),
              .cout(vif.cout));
  
  test t;
  
  initial begin
    t=new(vif);
    t.run();
  end
endmodule
