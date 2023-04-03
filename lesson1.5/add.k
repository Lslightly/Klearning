module ADD-SYNTAX 
    syntax UnaryOp ::= "-" [token]

    syntax Exp ::= 
                  UnaryOp Exp [unary]
    syntax Exp ::=
                  Exp "+" Exp [add]
                 | Exp "-" Exp [sub]
 
endmodule