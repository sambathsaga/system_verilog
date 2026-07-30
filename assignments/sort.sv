module sort_dynamic_arrray;
  int arr[];
  initial begin
    arr =new[10];
    arr='{9,8,6,5,7,2,4,3,1,0};
    arr.sort();
    $display("Sorted array:");
    foreach(arr[i])
    $write("%0d",arr[i]);
    $display();
  end
  endmodule
