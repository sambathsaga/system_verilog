class generator;
  
  transaction tr;
  mailbox gen2drive;
  
  function new(mailbox gen2drive);
    this.gen2drive=gen2drive;
  endfunction
  
  task run();
    repeat(10)begin
      tr=new();
      assert(tr.randomize());
      gen2drive.put(tr);
      $display("GENERATOR: a=%0b b=%0b cin=%0b sum=%0b cout=%0b",tr.a,tr.b,tr.cin,tr.sum,tr.cout);
    end
  endtask
endclass
