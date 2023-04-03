module TEST-PRIORITY

    imports BOOL
    imports INT

    syntax Grade ::= "letter-B"
                 | "letter-A"
                 | "letter-C"
                 | "letter-D"
                 | "letter-F"
                 | gradeFromPercentile(Int) [function]
    
    rule gradeFromPercentile(I) => letter-B requires I >=Int 80
    rule gradeFromPercentile(I) => letter-A requires I >=Int 90
 
endmodule