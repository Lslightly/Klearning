module EX1 

    imports INT
    imports STRING
    imports BOOL

    syntax String ::= Head(String) [function] | total(String) [function]

    rule Head(S) => substrString(S, 0, findChar(S, " ", 0)) requires findChar(S, " ", 0) =/=Int -1
    rule Head(S) => substrString(S, 0, findChar(S, ".", 0)) requires findChar(S, " ", 0) ==Int -1
    rule total(S) => Head(substrString(S, 0, findChar(S, ".", 0))) +String " " +String total(substrString(S, findChar(S, ".", 0) +Int 1, lengthString(S))) requires findChar(S, ".", 0) +Int 1 <Int lengthString(S)
    rule total(S) => Head(S) requires findChar(S, ".", 0) +Int 1 ==Int lengthString(S)
    rule total(S) => "" requires findChar(S, ".", 0) ==Int -1
 
endmodule