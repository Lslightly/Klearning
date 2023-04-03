# casting terms

通过cast expression来避免二义性。

## semantic cast

在语法中隐式包含`syntax S ::= S ":S"`，在运行时的时候这个表达式不会存在，但是这个cast表达式会告诉编译器该如何解释S，例如：

```k
  syntax Term ::= Exp | Stmt
  syntax Bool ::= isExpression(Term) [function] | isStatement(Term) [function]

  rule isExpression(_E:Exp) => true
  rule isStatement(_S:Stmt) => true
```

## strict cast

`syntax S ::= S "::S"`

在转换中的项S不可能是subsort类型，即不可能是类型S2，类型S2满足`S ::= S2`。

比如对于下面这个例子：

```k
module LESSON-11-C
  imports INT

  syntax Exp ::= Int | Exp "+" Exp [exp]
  syntax Exp2 ::= Exp | Exp2 "+" Exp2 [exp2]
endmodule
```

`(I1:Int + I2:Int)::Exp2`表示`(I1:Int + I2:Int)`不可能是`Exp`类型，因为`Exp`类型是`Exp2`类型的子类型。所以这里一定会选择`[exp2]`的产生式进行归约。

## projection cast

`syntax S ::= S2`是子类产生式(subsort production)，S2 is a S。K在运行时通过injection符号记录在何处发生了subsortings。

projection cast是将父类转为子类的转换

`syntax S ::= "{" S "}" ":>S2"`为投影转换，表示将S类型转化为S2类型，S2类型为S类型的子类型



