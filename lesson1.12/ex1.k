module EX1-SYNTAX

    imports STRING-SYNTAX
    imports INT-SYNTAX

    syntax String ::= concat(Strings) [function]
    syntax Strings ::= List{String,","}

endmodule

module EX1

    imports STRING
    imports EX1-SYNTAX

    rule concat (S:String) => S
    rule concat (S1:String, S2:String, SS:Strings) => concat (S1 +String S2, SS)
 
endmodule