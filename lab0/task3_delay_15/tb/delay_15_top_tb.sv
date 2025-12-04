`timescale 1ns / 1ps

module delay_15_top_tb;
  localparam CHECK_TIMEOUT = 16;
  localparam MIN_DURATION = 25;
  localparam MAX_DURATION = 50;
  localparam MIN_DELAY = 0;
  localparam MAX_DELAY = 15;
  localparam TEST_COUNT = 10;

  logic       clk = 0;
  logic       rst = 1;
  logic       din;
  logic [3:0] delay;
  logic       dout;

  bit         rst_done = 0;
  bit         check_timeout = 1;

  delay_15_top DUT (
    .clk_i       (clk),
    .rst_i       (rst),
    .data_i      (din),
    .data_delay_i(delay),
    .data_o      (dout)
  );

  initial $timeformat(-9, 3, " ns", 10);
  initial forever #5 clk = !clk;

  class timedata;
    time t;
    logic d;
    function new(time t_p, logic d_p);
      this.t = t_p;
      this.d = d_p;
    endfunction
  endclass

  class generator;
    timedata q[$];
    task run();
      forever begin : generator_loop
        bit val = $urandom % 2;
        din = val;
        if (!check_timeout) begin
          timedata td = new($realtime, din);
          q.push_back(td);
        end
        @(posedge clk);
      end
    endtask
    task print();
      $display("Generator Log:");
      foreach (this.q[i]) $display("%4d %0b", this.q[i].t, this.q[i].d);
    endtask
  endclass

  class reader;
    timedata q[$];
    logic temp_dout;
    task run();
      forever begin : reader_loop
        @(posedge clk);
        #1;
        temp_dout = dout;
        if (!check_timeout) begin
          timedata td = new($realtime, temp_dout);
          q.push_back(td);
        end
      end
    endtask
    task print();
      $display("Reader Log:");
      foreach (this.q[i]) $display("%4d %0b", this.q[i].t, this.q[i].d);
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
      for (int i = n; i > 0; i--) @(posedge clk);
      this.finished = 1;
    endtask
  endclass

  class environment;
    bit       results            [$];
    bit       check_result;
    generator gen;
    reader    re;
    timer     t;
    timer     check_timeout_timer     = new(CHECK_TIMEOUT);

    task rst_task();
      rst = 0;
      #1;
      rst      = 1;
      rst_done = 1;
    endtask

    task change_delay(logic [3:0] delay_p);
      delay         = delay_p;
      check_timeout = 1;
      check_timeout_timer.start();
      wait (check_timeout_timer.finished);
      check_timeout = 0;
      forever @(posedge clk);
    endtask

    function bit check(timedata input_q[$], timedata output_q[$], int delay_p);
      bit result = 1;
      foreach (output_q[i]) begin
        assert (input_q[i].d == output_q[i].d) begin
        end
        else begin
          result = 0;
        end
      end
      check = result;
    endfunction

    task test_task(int i, int duration, int delay_p);
      check_result = 1;
      gen          = new();
      re           = new();
      t            = new(duration);
      rst_task();
      wait (rst_done);
      fork
        change_delay(delay_p);
        gen.run();
        re.run();
        t.start();
      join_any
      disable fork;
      #50;
      gen.print();
      repeat (delay_p) re.q.pop_front();
      re.print();

      check_result = check(gen.q, re.q, delay_p);
      this.results.push_back(check_result);

      if (check_result) $display("All tests in group passed");
      else $error("Some tests failed");
    endtask

    function int new_duration();
      new_duration = $urandom_range(MIN_DURATION, MAX_DURATION);
    endfunction

    function bit [3:0] new_delay();
      new_delay = $urandom_range(MIN_DELAY, MAX_DELAY);
    endfunction

    int curr_duration, curr_delay;
    task run(int count);
      for (int i = 0; i < count; i++) begin
        curr_duration = new_duration();
        curr_delay    = new_delay();
        $display("Starting test group %3d...", i + 1);
        $display("duration=%3d, delay=%3d", curr_duration, curr_delay);
        test_task(i + 1, curr_duration, curr_delay);
        $display("Test group %3d finished.", i + 1);
      end
    endtask

    task summary();
      $display("Summary:");
      foreach (this.results[i])
        if (this.results[i]) $display("Test group %3d:PASS", i + 1);
        else $display("Test group %3d:FAIL", i + 1);
    endtask
  endclass

  //==========sim==============

  environment env;

  initial begin
    env = new();
    env.run(TEST_COUNT);
    env.summary();
    $stop;
  end

endmodule
