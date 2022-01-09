\m4_TLV_version 1d: tl-x.org
\SV
   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
   /* verilator lint_on WIDTH */

\TLV
   $reset = *reset;
  
  // Just for convinience of checking with smaller numbers
  $val1[31:0] = {0, $val1_rand[5:0]};
  $val2[31:0] = {0, $val2_rand[3:0]};
  
  $sum[31:0] = $val1[31:0] + $val2[31:0];
  $diff[31:0] = $val1 - $val2;
  $prod[31:0] = $val1 * $val2;
  $quot[31:0] = $val1 / $val2;
  
  $out[31:0] = 
    $op[1:0] == 2'b00 ? $sum : 
    $op == 2'b01 ? $diff : 
    $op == 2'b10 ? $prod : 
                   $quot;
  
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
