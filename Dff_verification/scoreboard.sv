class scoreboard;

  mailbox mon2scb;
  transaction tr;
  bit expected_q;
  
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  
  task run();
    forever begin
      mon2scb.get(tr);
      if(tr.rst)
        expected_q=1'b0;
      else
        expected_q=tr.d;
      if(tr.q==expected_q)
        $display("[SCOREBOARD] PASS : d=%0b q=%0b expected=%0b",
                         tr.d, tr.q, expected_q);
      else
        $display("[SCOREBOARD] FAIL : d=%0b q=%0b expected=%0b",
                         tr.d, tr.q, expected_q);
    end
  endtask
endclass
