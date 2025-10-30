module priority_encoder_4_top_tb;
logic       data_val_input;
logic [3:0] data_input;

logic       data_val_output;
logic [3:0] data_right_output;
logic [3:0] data_left_output;

parameter N           = 4;
parameter TEST_COUNT  = 30;

class random_generator;
  bit [N-1:0] data0;
  bit [N-1:0] expected_val_left  = '0;
  bit [N-1:0] expected_val_right = '0;

  function automatic logic [N-1:0] right_exp(logic [N-1:0] x);
    right_exp = '0;
    for (int i = 0; i < N; i++)
      begin
        if (x[i])
          begin
            right_exp[i] = 1'b1;
            break;
          end
      end
  endfunction

  function automatic logic [N-1:0] left_exp(logic [N-1:0] x);
    left_exp = '0;
    for (int i = N-1; i >= 0; i--)
      begin
        if (x[i])
          begin
            left_exp[i] = 1'b1;
            break;
          end
      end
  endfunction

  
  function new ();
    this.data0 = $urandom;
    this.expected_val_left = left_exp(this.data0);
    this.expected_val_right = right_exp(this.data0);
  endfunction
endclass
  
  

priority_encoder_4_top DUT (
  .data_val_i   ( data_val_input      ),
  .data_i       ( data_input          ),
  .data_val_o   ( data_val_output     ),
  .data_left_o  ( data_left_output    ),
  .data_right_o ( data_right_output   )
);

initial
  begin
    $display("Testing...");
    #10;
    $display("%8s %16s %16s %16s %16s %16s %16s %16s", "test#", "data_input", "expected_left", "actual_left", "expected_right", "actual_right", "data_val_i", "data_val_o");
    for (int i = 0; i < TEST_COUNT; i++)
      begin
        automatic random_generator rg = new ();
        data_input = rg.data0;
        data_val_input = $urandom;
        #1;

        $write( "%8d "   ,  i + 1                 );
        $write( "%16b "  ,  rg.data0              );
        $write( "%16b "  ,  rg.expected_val_left  );
        $write( "%16b "  ,  data_left_output      );
        $write( "%16b "  ,  rg.expected_val_right );
        $write( "%16b "  ,  data_right_output     );
        $write( "%16d "  ,  data_val_input        );
        $write( "%16d"   ,  data_val_output       );
        $display();

        if ( data_val_input )
          begin
            assert ( data_val_output )
            else
              begin
                $error("Assertion failed, data_val_input and data_val_output mismatch");
                $stop;
              end
              
            assert ( data_right_output == rg.expected_val_right )
            else
              begin
                $error("Assertion failed, expected_val_right=%b got data_right_output=%b", rg.expected_val_right, data_right_output);
                $stop;
              end

            assert ( data_left_output == rg.expected_val_left )
            else 
            begin
              $error("Assertion failed, expected_val_left=%b got data_left_output=%b", rg.expected_val_left, data_left_output);
              $stop;
            end
          end
      end
     $display("All passed"); 
  end
endmodule