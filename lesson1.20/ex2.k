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

module EX3-SYNTAX
    imports EX3-2-SYNTAX
    imports ID-SYNTAX

    syntax Decls ::= List{Decl,""}
    syntax Decl ::= "func" Id "(" ")" "{" Stmts "}" | "var" Id "int" "=" Exp [strict(2)]
    syntax Exp ::= Id "(" ")" | Id
    syntax Stmts ::= List{Stmt, ";"}
    syntax Stmt ::= "return" Exp [strict] | Exp  | Decl | Id "=" Exp [seqstrict(2)] | "if" "(" Exp ")" Stmt "else" Stmt [priority(49)] | "if" "(" Exp ")" Stmt
    syntax Pgm ::= Decls
    syntax Id ::= "main" [token]

endmodule

module EX3
    imports EX3-SYNTAX
    imports ID
    imports MAP
    imports LIST
    imports BOOL
    imports INT
    imports K-EQUAL
    /*
        k表示函数定义与程序执行
        state表示当前活动记录
        functions表示函数定义表
        fstack表示活动记录栈
    */
    configuration   <T>
                        <k> $PGM:Pgm ~> main() </k>
                        <state> .Map </state>
                        <functions> .Map </functions>
                        <fstack> .List </fstack>
                    </T>
    
    // declaration sequence
    rule <k> D:Decl P:Decls => D ~> P ...</k>
    rule <k> .Decls => . ...</k>

    // function definition
    rule <k> func X:Id () { S } => . ...</k>
         <functions>M => M [X <- S]</functions>
        requires notBool X in_keys (M)
    
    // variable declaration
    rule    <k> var X:Id int = E:Int => . ...</k>
            <state> State => State [ X <- E ] </state>
        requires notBool X in_keys ( State )

    // function call
    syntax KItem ::= stackFrame(K, Map, String)
    rule    <k> X:Id () ~> K => S</k>
            <functions>... X |-> S ...</functions>
            <state>State => .Map</state>
            <fstack>.List => ListItem(stackFrame (K, State, Id2String (X))) ...</fstack>
    
    // stmts
    rule    <k> S1:Stmt ; Ss:Stmts => S1 ~> Ss </k>
    rule    <k> .Stmts => . ...</k>
    
    // return statement
    rule    <k> return I:Int ~> _ => I ~> K</k>
            <state>_ => State</state>
            <fstack>ListItem(stackFrame (K, State, _)) => .List ...</fstack>
    
    // if stmt
    rule    <k>if (B:Bool) S1:Stmt else S2:Stmt => 
                #if B #then S1 #else S2 #fi ...</k>

    rule    <k>if (B:Bool) S1:Stmt => #if B #then S1 #else . #fi ...</k>

    // assignment
    rule    <k>X:Id = E:Int ~> K => K</k>
            <state> State => State [X <- E] </state>
        requires X in_keys ( State )

    // variable lookup
    rule    <k> X:Id => I ...</k>
            <state>... X |-> I ...</state>
    
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

    
    syntax Bool ::= isKResult(K) [symbol, function]
    rule isKResult (_:Int) => true
    rule isKResult(_:Bool) => true
    rule isKResult (_) => false [owise]

endmodule