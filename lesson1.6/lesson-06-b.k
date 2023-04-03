module LESSON-06-B
  imports BOOL

  syntax Fruit ::= Blueberry() | Banana() | Apple()
  syntax Bool ::= isBlue(Fruit) [function]

  rule isBlue(Blueberry()) => true
  rule isBlue(Banana()) => false
  rule isBlue(Apple()) => true

  syntax Bool ::= isYellow(Fruit) [function]
                | isBlueOrYellow(Fruit) [function]
                | isBlueAndNotYellow(Fruit) [function]

  rule isYellow(Banana()) => true
  rule isYellow(Blueberry()) => false
  rule isYellow(Apple()) => true

  rule isBlueOrYellow(F) => isBlue(F) orBool isYellow(F)
  rule isBlueAndNotYellow(F) => isBlue(F) andBool notBool isYellow(F)
endmodule