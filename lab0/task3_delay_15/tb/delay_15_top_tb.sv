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
  mailbox #(bit)       mbx;

  delay_15_top DUT (
    .clk_i       (clk),
    .rst_i       (rst),
    .data_i      (din),
    .data_delay_i(delay),
    .data_o      (dout)
  );

  class generator;
    bit q      [$];
    bit init_q [$];
    int delay;
    int length;

    function new(int length_p);
      for (int i = 0; i < length_p; i++) begin
        this.q.push_back($urandom % 2);
      end
      this.init_q = q;
      this.delay  = $urandom % MAX_DELAY;
      this.length = length_p;
    endfunction

    function bit next_val();
      assert (!empty()) begin
        next_val = q.pop_front();
      end
      else begin
        $error("queue is empty!");
      end
    endfunction

    function bit empty();
      empty = q.size() == 0;
    endfunction
  endclass

  class delay_changer;
    int last_change;
    int current_delay;
    function new(int delay_p);
      this.current_delay = delay_p;
      this.last_change   = 0;
    endfunction
    task change(int delay_p);
      this.current_delay = delay_p;
      delay              = delay_p;
      fork
        check_timeout = 16;
        while (check_timeout) begin
          @(posedge clk);
          check_timeout--;
        end
      join_none
    endtask
  endclass

  initial forever #5 clk = !clk;

  default clocking cb @(posedge clk);
  endclocking

  initial begin
    rst = 0;
    ##1;
    rst      = 1;
    rst_done = 1;
  end


  generator     g;
  delay_changer dc;

  // Stimulus

  task automatic din_task;
    g  = new(LEN);
    dc = new(1);
    dc.change(4);
    while (!g.empty()) begin
      din = g.next_val();
      @(posedge clk);
    end
  endtask

  always @(posedge clk) begin
    if (mbx.num() > 0) begin
      if (check_timeout) $display("%t not checking val=%b", $time, mbx.peek());
      else $display("%t checking val=%b", $time, mbx.peek());
    end
  end

  always @(posedge clk) begin
    mbx.put(din);
    if (mbx.num() > dc.current_delay) begin
      mbx.get();
    end
  end

  initial begin
    $display("Starting test...");
    wait (rst_done);
    fork
      din_task;
    join_none
    #500;
    $display("Test finished.");
    $stop;
  end

endmodule
