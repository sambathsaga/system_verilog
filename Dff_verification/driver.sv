class driver;
  virtual dff_intf vif;
  transaction tr;
  mailbox gen2drive;
  
  function new(virtual dff_intf vif,mailbox gen2drive);
    this.vif=vif;
    this.gen2drive=gen2drive;
  endfunction
  
  task run();
    forever begin
    gen2drive.get(tr);
      @(negedge vif.clk);
      vif.rst<=tr.rst;
      vif.d<=tr.d;
      end
  endtask
  
endclass
