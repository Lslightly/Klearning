module NELIST-INTS-SYNTAX

    imports INT

    syntax Ints ::= NeList{Int, ","}
endmodule

module NELIST-INTS
    imports NELIST-INTS-SYNTAX
endmodule