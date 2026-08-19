class scoreboard;
  
  mailbox mon2scb;
  transaction tr;
  bit expected_sum;
  bit expected_cout;
  
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  
  task run();
    repeat(10) begin
      
      mon2scb.get(tr);
      
      expected_sum=tr.a^tr.b^tr.cin;
      expected_cout=((tr.a&tr.b)|(tr.b&tr.cin)|(tr.cin&tr.a));
      
      if((expected_sum==tr.sum)&&(expected_cout==tr.cout))
        $display("[scoreboard] Pass: a=%0b b=%0b cin=%0b sum=%0b cout=%0b",tr.a,tr.b,tr.cin,tr.sum,tr.cout);
    else
      $display("[scoreboard] Fail: a=%0b b=%0b cin=%0b sum=%0b cout=%0b",tr.a,tr.b,tr.cin,tr.sum,tr.cout);
    end
  endtask
endclass
