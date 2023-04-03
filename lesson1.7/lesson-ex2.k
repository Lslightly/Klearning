module LESSON-EX2

    imports BOOL
    imports INT

    syntax Grade ::=  "letter-A"
                    | "letter-B"
                    | "letter-C"
                    | "letter-D"
                    | "letter-F"
                    | gradeFromPercentile(Int) [function]

    rule gradeFromPercentile(I) => letter-F requires I <Int 60
    rule gradeFromPercentile(I) => letter-D [owise]
 
endmodule