module LESSON-04-EX3

    syntax Exp ::= "true" | "false"
    syntax Stmt ::= "if" "(" Exp ")" Stmt [prefer]
                  | "if" "(" Exp ")" Stmt "else" Stmt
                  | "{" "}"
 
endmodule