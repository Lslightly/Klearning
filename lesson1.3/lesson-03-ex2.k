module LESSON-03-EX2

    syntax Int ::= r"{DecConstant}" [token]
    syntax lexical DecConstant = r"{NonzeroDigit}({Digit}*)"
    syntax lexical NonzeroDigit = r"[1-9]"
    syntax lexical Digit = r"[0-9]"
    syntax UnaryOp ::= "-" [token]
    syntax Exp ::= Exp "+" Exp
                 | Exp "-" Exp
                 | "(" Exp ")" [bracket]
                 | Exp "*" Exp
                 | Exp "/" Exp
                 | UnaryOp Exp
                 | Int
 
endmodule