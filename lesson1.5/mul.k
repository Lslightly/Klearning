module MUL-SYNTAX 

    syntax Exp ::= 
                  Exp "*" Exp [mul]
                 | Exp "/" Exp [div]

 
endmodule