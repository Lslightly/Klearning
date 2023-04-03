requires "add.k"
requires "int_bracket.k"
requires "mul.k"
module EXP-SYNTAX 
    imports ADD-SYNTAX
    imports INT_BRACKET-SYNTAX
    imports MUL-SYNTAX
    syntax priorities unary > mul div > add sub
    syntax left add
    syntax left sub
    syntax left mul
    syntax left div

 
endmodule

module EXP
    imports EXP-SYNTAX

endmodule