class driver;
  virtual fa_intf vif;
  transaction tr;
  mailbox gen2drive;
  event done;
  
  function new(virtual fa_intf vif,mailbox gen2drive, event done);
    this.vif=vif;
    this.gen2drive=gen2drive;
    this.done=done;
  endfunction
  
  task run();
    repeat(10) begin
    gen2drive.get(tr);
    
      vif.a=tr.a;
      vif.b=tr.b;
      vif.cin=tr.cin;
      #1;
     
      $display("DRIVER: a=%0b b=%0b cin=%0b",vif.a,vif.b,vif.cin);
      ->done;
      #1;
    end
  endtask
endclass
