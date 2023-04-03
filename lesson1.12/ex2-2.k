requires "./lesson-12-a.k"
module EX2-2
    imports LESSON-12-A
    imports INT

    syntax Int ::= sum(Ints) [function]

    rule sum(.Ints) => 0
    rule sum(I:Int) => I
    rule sum (I1:Int, I2:Int, Is:Ints) => sum (I1 +Int I2, Is)
endmodule