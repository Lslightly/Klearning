module LESSON-02-A-EX1

    syntax Color ::= Yellow() | Blue() | Black() | Green()
    syntax Fruit ::= Banana() | Blueberry() | BlackBerries() | Kiwis()
    syntax Color ::= colorOf(Fruit) [function]

    rule colorOf(Banana()) => Yellow()
    rule colorOf(Blueberry()) => Blue()
    rule colorOf(BlackBerries()) => Black()
    rule colorOf(Kiwis()) => Green()
 
endmodule