module mux_top_tb;
logic [1:0] data0;
logic [1:0] data1;
logic [1:0] data2;
logic [1:0] data3;

logic [1:0] diretrion;

logic [1:0] data_output;

logic [1:0] expected_output;

mux_top DUT (
  .data0_i      ( data0       ),
  .data1_i      ( data1       ),
  .data2_i      ( data2       ),
  .data3_i      ( data3       ),
  .direction_i  ( diretrion   ),
  .data_o       ( data_output )
);

initial
  begin
    $display("Testing...");
    #10;
    for (int i = 0; i < 1024; i++)
      begin
        {diretrion, data0, data1, data2, data3} = i;
        #1;

        // check
        case (diretrion)
          2'b00: expected_output = data0;
          2'b01: expected_output = data1;
          2'b10: expected_output = data2;
          2'b11: expected_output = data3;
        endcase
        if (data_output != expected_output)
          begin
            $error("FAIL!:");
            $error("test# %4d/1024: data0=%b data1=%b data2=%b data3=%b direction=%b | expected=%b got=%b", i, data0, data1, data2, data3, diretrion, expected_output, data_output);
            $stop;
          end
      end
     $display("All passed"); 
  end
endmodule