module INT_BRACKET-SYNTAX 

    syntax Int ::= r"{DecConstant}" [token]
    syntax lexical DecConstant = r"{NonzeroDigit}({Digit}*)"
    syntax lexical NonzeroDigit = r"[1-9]"
    syntax lexical Digit = r"[0-9]"
    syntax Exp ::= Int | "(" Exp ")" [bracket]
 
endmodule