`timescale 1ns / 1ps

module delay_15_top_tb;
  localparam LEN = 32;
  localparam MAX_DELAY = 16;

  logic                clk = 0;
  logic                rst = 1;
  logic                din;
  logic          [3:0] delay;
  logic                dout;

  bit                  rst_done = 0;
  int                  check_timeout = 0;

  bit                  tmp1;
  bit                  tmp2;

  delay_15_top DUT (
    .clk_i       (clk),
    .rst_i       (rst),
    .data_i      (din),
    .data_delay_i(delay),
    .data_o      (dout)
  );

  initial forever #5 clk = !clk;

  default clocking cb @(posedge clk);
  endclocking



  class generator;
    bit q [$];
    task run();
      forever begin
        bit val = $urandom % 2;
        din = val;
        q.push_back(val);
        @(posedge clk);
      end
    endtask
    task print();
      foreach (this.q[i]) $write("%b", this.q[i]);
      $display;
    endtask
  endclass

  class reader;
    bit q [$];
    task run();
      forever begin
        q.push_back(dout);
        @(posedge clk);
      end
    endtask
    task print();
      foreach (this.q[i]) $write("%b", this.q[i]);
      $display;
    endtask
  endclass

  //==========sim_logic==============

  initial begin
    rst = 0;
    ##1;
    rst      = 1;
    rst_done = 1;
  end

  generator gen;
  reader re;

  initial begin
    $display("Starting test...");
    delay = 4'b0010;
    gen = new();
    re = new();
    wait (rst_done);
    fork
      gen.run();
      re.run();
    join_none
    #500;
    gen.print();
    re.print();
    $display("Test finished.");
    $stop;
  end

endmodule
