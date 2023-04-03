module LESSON-04-F

  syntax Exp ::= "true" | "false"
  syntax Stmt ::= "if" "(" Exp ")" Stmt [avoid]
                | "if" "(" Exp ")" Stmt "else" Stmt
                | "{" "}"
endmodule