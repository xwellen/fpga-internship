`timescale 1ns / 1ps

module delay_15_top_tb;
  localparam DEFAULT_CHECK_TIMEOUT = 16;
  localparam DELAY = 10;
  localparam TEST_DURATION = 100;

  logic                clk = 0;
  logic                rst = 1;
  logic                din;
  logic          [3:0] delay;
  logic                dout;

  bit                  rst_done = 0;
  bit                  check_timeout = 1;

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
        din <= val;
        if (!check_timeout)
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
        if (!check_timeout)
          q.push_back(dout);
        @(posedge clk);
      end
    endtask
    task print();
      foreach (this.q[i]) $write("%b", this.q[i]);
      $display;
    endtask
  endclass

  class timer;
    int n;
    bit finished = 0;
    function new(int n_p = 100);
      this.n = n_p;
    endfunction
    task start();
      this.finished = 0;
      for (int i = n; i > 0; i--)
        @(posedge clk);
      this.finished = 1;
    endtask
  endclass

  timer check_timeout_timer = new(DEFAULT_CHECK_TIMEOUT);
  task automatic change_delay(logic [3:0] delay_p);
    delay = delay_p;
    check_timeout = 1;
      fork
        check_timeout_timer.start();
      join_none
    wait(check_timeout_timer.finished);
    check_timeout = 0;
    forever
      @(posedge clk);
  endtask

  function automatic bit check(bit input_q [$], bit output_q [$]);
    bit result = 1;
    foreach(output_q[i]) begin
      assert (input_q[i] == output_q[i]) begin
        $display("bit N=%4d pass, expected=%b, got=%b, delay=%3d",
         i, input_q[i], output_q[i], DELAY);
      end
      else begin
        $error("bit N=%4d mismatch!, expected=%b, got=%b, delay=%3d",
         i, input_q[i], output_q[i], DELAY);
         result = 0;
      end
    end
    check = result;
  endfunction

  //==========sim==============

  initial begin
    rst = 0;
    ##1;
    rst      = 1;
    rst_done = 1;
  end

  generator gen;
  reader re;
  timer t;
  bit check_result = 1;

  initial begin
    $display("Starting test...");
    gen = new();
    re = new();
    t = new(TEST_DURATION);
    wait (rst_done);
    fork
      change_delay(DELAY);
      gen.run();
      re.run();
      t.start();
    join_any
    #50;
    gen.print();
    repeat(DELAY + 1)
      re.q.pop_front();
    re.print();

    check_result = check(gen.q, re.q);

    if (check_result) $display("All tests passed");
    else $error("Some tests failed");

    $display("Test finished.");
    $stop;
  end

endmodule
