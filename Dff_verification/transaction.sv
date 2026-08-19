class transaction;
  
  rand bit rst;
  rand bit d;
  bit q;
  
  function void display(string name);
    $display("%s rst=%0b d=%0b q=%0b",name,rst,d,q);
  endfunction
  
endclass
