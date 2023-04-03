module LESSON-11-D
  imports INT
  imports BOOL
  imports STRING

  syntax Exp ::= Int | Bool | String | Exp "+" Exp | Exp "&&" Exp | Exp "." Exp | sel(Exp, Exp) [function]

  rule sel (A, B) => B
  rule sel (A, B) => A
endmodule