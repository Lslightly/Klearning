module LESSON-04-EX4

    syntax A ::= "a"
    syntax B ::= "b"
    syntax Expr ::= A Expr B
                  | A B B
                  | B
 
endmodule