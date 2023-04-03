module LESSON-06-EX2-SYNTAX
    imports UNSIGNED-INT-SYNTAX
    imports BOOL-SYNTAX
    syntax UnaryOp ::= "-" [token]
    syntax Exp ::= 
                  Int
                 | Bool
                 | "(" Exp ")" [bracket]
                 | UnaryOp Exp [unary, function]
                 | Exp "*" Exp [mul, function]
                 | Exp "/" Exp [div, function]
                 | Exp "+" Exp [add, function]
                 | Exp "-" Exp [sub, function]
                 | Exp "&&" Exp [and, function]
                 | Exp "^" Exp [xor, function]
                 | Exp "||" Exp [or, function]
                 | "!" Exp [not, function]
                 | Exp "<" Exp [cmp, function]
                 | Exp "<=" Exp [cmp, function]
                 | Exp ">" Exp [cmp, function]
                 | Exp ">=" Exp [cmp, function]
                 | Exp "==" Exp [cmp, function]
                 | Exp "!=" Exp [cmp, function]
    
    syntax priorities unary > mul div > add sub > cmp > not > and xor or
    syntax left mul div
    syntax left add sub
    syntax left and xor or
    
endmodule
module LESSON-06-EX2
    imports INT
    imports BOOL
    imports LESSON-06-EX2-SYNTAX
    rule A * B => A *Int B
    rule A / B => A divInt B
    rule A + B => A +Int B
    rule A - B => A -Int B
    rule (A) => A
    rule -A => 0 -Int A

    rule ! B => notBool B
    rule A && B => A andBool B
    rule A ^ B => A xorBool B
    rule A || B => A orBool B
    rule A < B => A <Int B
    rule A > B => A >Int B
    rule A >= B => A >=Int B
    rule A <= B => A <=Int B
    rule A == B => A ==Int B
    rule A != B => A =/=Int B
 
endmodule