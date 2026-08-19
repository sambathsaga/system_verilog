class monitor;
  virtual fa_intf vif;
  mailbox mon2scb;
  transaction tr;
  event done;
  
  function new(virtual fa_intf vif,mailbox mon2scb, event done);
    this.vif=vif;
    this.mon2scb=mon2scb;
    this.done=done;
  endfunction
  
  task run();
    repeat(10) begin
      
      @done;
      
      tr=new();
      tr.a=vif.a;
      tr.b=vif.b;
      tr.cin=vif.cin;
      tr.sum=vif.sum;
      tr.cout=vif.cout;

      $display("MONITOR: a=%0b b=%0b cin=%0b sum=%0b cout=%0b",tr.a,tr.b,tr.cin,tr.sum,tr.cout);
      
      mon2scb.put(tr);
      
    end
  endtask
endclass
