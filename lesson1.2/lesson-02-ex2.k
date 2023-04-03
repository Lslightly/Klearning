module LESSON-02-EX2 

    syntax Color ::= Black() | White()
    syntax Boolean ::= True() | False() | outfitMatching(Outfit) [function] | same(Color, Color, Color, Color) [function]
    syntax Outfit ::= Out(Component, Component, Component, Component)
    syntax Component ::= Hat(Color) | Shirt(Color) | Pants(Color) | Shoes(Color)

    rule outfitMatching(Out(Hat(A), Shirt(B), Pants(C), Shoes(D))) => same(A, B, C, D)
    rule same(Black(), Black(), Black(), Black()) => True()
    rule same(White(), White(), White(), White()) => True()

 
endmodule