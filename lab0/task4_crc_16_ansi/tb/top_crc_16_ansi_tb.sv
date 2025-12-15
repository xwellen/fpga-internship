`timescale 1ns / 1ps

module top_crc_16_ansi_tb;
  int TEST_COUNT = 1;

  logic        clk = 0;
  logic        rst = 1;
  logic        din;
  logic [15:0] dout;

  bit          rst_done = 0;

  top_crc_16_ansi DUT (
    .clk_i (clk),
    .rst_i (rst),
    .data_i(din),
    .data_o(dout)
  );

  initial $timeformat(-9, 3, " ns", 10);
  initial forever #5 clk = !clk;

  class generator;
    int nums[$];
    int crc[$];

    function crc_sum(int n);
      crc_sum = 0;
    endfunction

    function new(int count);
      for (int i = 0; i < count; i++) begin
        //int val = $urandom;
        int val = 'hDEADBEEF;
        nums.push_back(val);
        crc.push_back(crc_sum(val));
      end
    endfunction
  endclass

  class driver;
    generator g = new(TEST_COUNT);

    task rst_task();
      rst = 0;
      #1;
      rst      = 1;
      rst_done = 1;
    endtask

    task send(int num);

      while (num != 0) begin
        din = num & 1;
        @(posedge clk);
        num >>= 1;
      end
    endtask

    task run();
      bit done = 0;
      while (!done) begin
        int num = g.nums.pop_back();
        send(num);
        $write("%b ",num);
        $write("%h ",num);
        #10;
        $write("%b ",dout);
        $display("%h",dout);
        rst_task();
        if (g.nums.size() < 1) done = 1;
      end
    endtask
  endclass


  driver d = new();
  initial begin
    d.rst_task();
    d.run();
    $stop;
  end

endmodule
