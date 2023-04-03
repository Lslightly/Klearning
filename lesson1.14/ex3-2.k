module EX3-2-SYNTAX

    imports UNSIGNED-INT-SYNTAX
    imports BOOL-SYNTAX
    syntax Minus ::= "-" [token]
    syntax Exp ::= 
                  Int
                 | Bool
                 | "(" Exp ")" [bracket]
                 | Minus Exp
                 > left: Exp "*" Exp [seqstrict]
                 | Exp "/" Exp [seqstrict]
                 > left: Exp "+" Exp [seqstrict]
                 | Exp "-" Exp [seqstrict]
                 > left: Exp "<" Exp [seqstrict]
                 | Exp "<=" Exp [seqstrict]
                 | Exp ">" Exp [seqstrict]
                 | Exp ">=" Exp [seqstrict]
                 | Exp "==" Exp [seqstrict]
                 | Exp "!=" Exp [seqstrict]
                 > "!" Exp [seqstrict]
                 > left: Exp "&&" Exp [seqstrict]
                 | Exp "^" Exp [seqstrict]
                 | Exp "||" Exp [seqstrict]

endmodule

module EX3-2

    imports INT
    imports BOOL
    imports EX3-2-SYNTAX

    rule <k> -I:Int => 0 -Int I ...</k>
    rule <k> I1:Int * I2:Int => I1 *Int I2 ...</k>
    rule <k> I1:Int / I2:Int => I1 divInt I2 ...</k> requires I2 =/=Int 0
    rule <k> I1:Int + I2:Int => I1 +Int I2 ...</k>
    rule <k> I1:Int - I2:Int => I1 -Int I2 ...</k>
    rule <k> ! B => notBool B ...</k>
    rule <k> A && B => A andBool B ...</k>
    rule <k> A ^ B => A xorBool B ...</k>
    rule <k> A || B => A orBool B ...</k>
    rule <k> A >= B => A > B || A == B ...</k>[priority(46)]
    rule <k> A <= B => A < B || A == B ...</k>[priority(47)]
    rule <k> A < B => 0 < (B -Int A)  ...</k>[priority(44)]
    rule <k> A > B => B < A  ...</k>[priority(45)]
    rule <k> A < 0 => absInt(A) != A  ...</k>[priority(42)]
    rule <k> 0 < A => absInt(A) == A && A != 0  ...</k>[priority(43)]
    rule <k> A == A => true  ...</k>[priority(40)]
    rule <k> _ == _ => false  ...</k>[priorities(41)]
    rule <k> A != B => ! A == B ...</k>

    syntax Bool ::= isKResult(K) [function, symbol]
    rule isKResult(_:Int) => true
    rule isKResult(_:Bool) => true
    rule isKResult(_) => false [owise]
endmodule
