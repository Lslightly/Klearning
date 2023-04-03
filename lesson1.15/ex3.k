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
    
    syntax Stmt ::= Bool ";" Exp | "reset" ";" Exp
    syntax Stmts ::= List{Stmt, ";"}
    syntax Int ::= eval(Stmt) [function] | sum(Stmts) [function]

endmodule

module EX3-2

    imports INT
    imports BOOL
    imports EX3-2-SYNTAX

    configuration <T><k> $PGM:K </k>
                   <wrapper><ctrl> false </ctrl></wrapper></T>

    rule <k> -I:Int => 0 -Int I ...</k>
    rule <k> I1:Int * I2:Int => I1 *Int I2 ...</k>
    rule <k> I1:Int / I2:Int => I1 divInt I2 ...</k>
        <ctrl> Div:Bool </ctrl> requires I2 =/=Int 0 andBool notBool Div

    rule <k> I1:Int / I2:Int => I1 /Int I2 ...</k>
        <ctrl> Div:Bool </ctrl> requires I2 =/=Int 0 andBool Div

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
    rule <k> B:Bool ; E:Exp => E</k>
         <wrapper><ctrl>_ => B</ctrl></wrapper>
    rule <k>reset ; E:Exp => E</k>
         (_:WrapperCell => <wrapper>... .Bag ...</wrapper>)

    rule eval(_ ; E) => E
    rule eval(reset ; E) => E
    rule sum(.Stmts) => 0
    rule sum(S:Stmt) => eval(S)
    rule sum(S1:Stmt; S2:Stmt; Ss:Stmts) => eval(S1) +Int eval(S2) +Int sum(Ss)
    

    syntax Bool ::= isKResult(K) [function, symbol]
    rule isKResult(_:Int) => true
    rule isKResult(_:Bool) => true
    rule isKResult(_) => false [owise]

endmodule
