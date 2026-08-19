class test;
  environment env;
  virtual fa_intf vif;
  
  function new(virtual fa_intf vif);
    this.vif=vif;
  endfunction
  
  task run();
    env=new(vif);
    env.run();
  endtask
endclass
