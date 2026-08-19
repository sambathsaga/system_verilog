class monitor;
  
  virtual dff_intf vif;
  mailbox mon2scb;
  transaction tr;
  
  function new(virtual dff_intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  
  task run();
    forever begin
    @(posedge vif.clk);
     #1;
      tr=new();
      tr.rst=vif.rst;
      tr.d=vif.d;
      tr.q=vif.q;
      tr.display("monitor");
      mon2scb.put(tr);
    end
  endtask
endclass
