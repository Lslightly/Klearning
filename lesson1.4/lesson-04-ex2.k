module LESSON-04-EX2

    syntax Int ::= r"{DecConstant}" [token]
    syntax lexical DecConstant = r"{NonzeroDigit}({Digit}*)"
    syntax lexical NonzeroDigit = r"[1-9]"
    syntax lexical Digit = r"[0-9]"
    syntax UnaryOp ::= "-" [token]
    syntax Exp ::= 
                  Int
                 | "(" Exp ")" [bracket]
                 | UnaryOp Exp [unary, function]
                 | Exp "*" Exp [mul, function]
                 | Exp "/" Exp [div, function]
                 | Exp "+" Exp [add, function]
                 | Exp "-" Exp [sub, function]
    
    syntax priorities unary > mul div > add sub
    syntax left mul div
    syntax left add sub
    
endmodule