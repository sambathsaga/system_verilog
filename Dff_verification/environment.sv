class environment;
  generator  gen;
  driver     drv;
  monitor    mon;
  scoreboard scb;
  
  mailbox gen2drive;
  mailbox mon2scb;
  
  virtual dff_intf vif;
  function new(virtual dff_intf vif);
    this.vif=vif;
    gen2drive=new();
    mon2scb=new();
    gen=new(gen2drive);
    drv=new(vif,gen2drive);
    mon=new(vif,mon2scb);
    scb=new(mon2scb);
  endfunction
  
  task run();
    fork
      gen.run();
      drv.run();
      mon.run();
      scb.run();
    join_any
  endtask
endclass
