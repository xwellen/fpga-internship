`timescale 1 ps / 1 ps
module delay_15_top_tb;
  logic       data_input;
  logic [3:0] data_delay_input;
  logic       data_output;

  bit         clock_input;
  bit         rst_input;

  bit         rst_done;

  delay_15_top DUT (
    .data_i      (data_input),
    .clk_i       (clock_input),
    .rst_i       (rst_input),
    .data_delay_i(data_delay_input),
    .data_o      (data_output)
  );

  initial begin
    rst_input <= 1'b1;
    #1;
    rst_input <= 1'b0;
    #1;
    rst_input <= 1'b1;
    rst_done = 1'b1;
  end

  initial forever #1 clock_input = !clock_input;

  logic [3:0] data_pattern = 4'b1010;

  initial begin
    data_delay_input = {4'b1110};
    wait (rst_done);
    #9;
    for (int i = 0; i < 4; i++) begin
      data_input = data_pattern[i];
      #10;
    end
    data_input = 0;
    #50;
    $stop;
  end
endmodule
