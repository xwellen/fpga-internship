`timescale 1ns / 1ps

module delay_15_top_tb;
  localparam WIDTH = 8;

  logic       clk = 0;
  logic       rst = 1;
  logic       din;
  logic [3:0] delay;
  logic       dout;

  bit         rst_done = 0;

  typedef struct {
    logic [WIDTH-1:0] value;
    int               delay_cycles;
  } input_info_t;

  input_info_t inputs_q[$];

  logic        outputs [$];

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

  initial begin
    rst = 0;
    ##1;
    rst      = 1;
    rst_done = 1;
  end

int rand_val;
int rand_val_before;
logic rand_val_q [$];
  // Stimulus
  initial begin
    $display("Starting test...");
    wait (rst_done);
    delay = $urandom_range(0, 15);
    rand_val = $urandom_range(0, 2 ** WIDTH - 1);
    
    ##2;
    repeat (WIDTH + delay + 10) begin
      din = rand_val % 2;
      rand_val_q.push_back(din);
      rand_val >>= 1;

      // Push into tracking queue
      outputs.push_back(dout);

      @(posedge clk);
    end
    #50;
    $display("Test finished.");
    rand_val_q.reverse();
    foreach (rand_val_q[i]) $write("%b", rand_val_q[i]);
    $display();
    outputs.reverse();
    repeat(delay) outputs.pop_front();
    
    foreach (outputs[i]) $write("%b", outputs[i]);
    $stop;
  end

endmodule
