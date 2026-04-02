module mux_tb ();
reg a;
reg b;
reg sel;
wire y;
reg expected;

mux uut (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
);

initial begin
    // Dump waveforms
    $dumpfile("mux_tb.vcd");
    // Dump all variables in the testbench
    $dumpvars(0, mux_tb);

    // Test case 1: sel = 0, expect y = a
    a = 0; b = 0; sel = 0;
    expected = a; // Expected output
    #10;
    if (y !== expected) $display("ERROR");
    
    // Test case 2: sel = 0, expect y = a
    a = 1; b = 0; sel = 0;
    expected = a;
    #10;
    if (y !== expected) $display("ERROR");
    
    // Test case 3: sel = 1, expect y = b
    a = 0; b = 1; sel = 1;
    expected = b;
    #10;
    if (y !== expected) $display("ERROR");
    
    // Test case 4: sel = 1, expect y = b
    a = 1; b = 1; sel = 1;
    expected = b;
    #10;
    if (y !== expected) $display("ERROR");
    
    // Test case 5: sel = 0, expect y = a
    a = 0; b = 1; sel = 0;
    expected = a;
    #10;
    if (y !== expected) $display("ERROR");

    // Test case 6: sel = 1, expect y = b
    a = 1; b = 0; sel = 1;
    expected = b;
    #10;
    if (y !== expected) $display("ERROR");

    // Test case 7: sel = 0, expect y = a
    a = 1; b = 1; sel = 0;
    expected = a;
    #10;
    if (y !== expected) $display("ERROR");

    // Test case 8: sel = 1, expect y = b
    a = 0; b = 0; sel = 1;
    expected = b;
    #10;
    if (y !== expected) $display("ERROR");

    // Finish the simulation
    $finish;
end
endmodule