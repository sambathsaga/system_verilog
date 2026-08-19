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
      tr.display("generator");
      gen2drive.put(tr);      
    end
  endtask
endclass
