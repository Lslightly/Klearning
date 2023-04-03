module LESSON-16-B-SYNTAX
  imports INT-SYNTAX
  imports ID-SYNTAX
  imports STRING-SYNTAX

  syntax Exp ::= Id "(" ")" | Int | String | "trace" "(" ")"
  syntax Stmt ::= "return" Exp ";" [strict]
  syntax Decl ::= "fun" Id "(" ")" "{" Stmt "}"
  syntax Pgm ::= List{Decl,""}
  syntax Id ::= "main" [token]
  syntax KItem ::= test(K, K)
endmodule

module LESSON-16-B
  imports LESSON-16-B-SYNTAX
  imports BOOL
  imports LIST
  imports STRING
  imports ID

  configuration <T>
                  <k> $PGM:Pgm ~> main () </k>
                  <functions> .Map </functions>
                  <fstack> .List </fstack>
                </T>

  syntax String ::= printStackTrace(List) [function]

  // declaration sequence
  rule <k> D:Decl P:Pgm => D ~> P ...</k>
  rule <k> .Pgm => . ...</k>

  // function definitions
  rule <k> fun X:Id () { S } => . ...</k>
       <functions>... .Map => X |-> S ...</functions>

  // function call
  syntax KItem ::= stackFrame(K, Id)
  rule <k> X:Id () ~> K => S </k>
       <functions>... X |-> S ...</functions>
       <fstack> .List => ListItem(stackFrame(K, X)) ...</fstack>
  rule <k> trace() ~> K => printStackTrace (L) ~> K </k>
        <fstack>L</fstack>

  // return statement
  rule <k> return I:Int ; ~> _ => I ~> K </k>
       <fstack> ListItem(stackFrame(K, _)) => .List ...</fstack>
  rule <k> return I:String ; ~> _ => I ~> K </k>
       <fstack> ListItem(stackFrame(K, _)) => .List ...</fstack>

  rule printStackTrace(ListItem( stackFrame (_, N1) ) ListItem( stackFrame (_, N2) ) L:List) => Id2String (N1) +String Id2String (N2) +String printStackTrace (L)
  rule printStackTrace (.List) => ""

  syntax Bool ::= isKResult(K) [function, symbol]
  rule isKResult(_:Int) => true
  rule isKResult (_:String) => true
  rule isKResult(_) => false [owise]
endmodule