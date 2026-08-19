class test;
  environment env;
  function new(virtual dff_intf vif);
    env=new(vif);
  endfunction
  
  task run();
    env.run();
    #200;
    $finish;
  endtask
endclass
