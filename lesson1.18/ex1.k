module EX1
    imports INT
    imports K-EQUAL
    imports STRING

    syntax Int ::= equal(K, K) [function]

    rule equal (K1, K2) => #if K1 ==K K2 #then 0 #else 1 #fi
endmodule