module test_tb();

  reg clk;

  test uut();

  initial begin
    clk = 0;
    $dumpfile("dump.vcd");
    $dumpvars(0, test_tb);

    #20;
    $display("Simulation finished");
    $finish;
  end

  always #5 clk = ~clk;

endmodule