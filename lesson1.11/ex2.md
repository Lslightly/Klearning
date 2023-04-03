# 计算器

```k
module EX3-2-SYNTAX
    imports UNSIGNED-INT-SYNTAX
    imports BOOL-SYNTAX
    syntax UnaryOp ::= "-" [token]
    syntax Exp ::= 
                  Int
                 | Bool
                 | "(" Exp ")" [bracket]
                 | UnaryOp Exp [unary, function]
                 | Exp "*" Exp [mul, function, color(red)]
                 | Exp "/" Exp [div, function, color(red)]
                 | Exp "+" Exp [add, function, color(blue)]
                 | Exp "-" Exp [sub, function, color(blue)]
                 | Exp "&&" Exp [and, function, color(yellow)]
                 | Exp "^" Exp [xor, function, color(yellow)]
                 | Exp "||" Exp [or, function, color(yellow)]
                 | "!" Exp [not, function]
                 | Exp "<" Exp [cmp, function, color(green)]
                 | Exp "<=" Exp [cmp, function, color(green)]
                 | Exp ">" Exp [cmp, function, color(green)]
                 | Exp ">=" Exp [cmp, function, color(green)]
                 | Exp "==" Exp [cmp, function, color(green)]
                 | Exp "!=" Exp [cmp, function, color(green)]
    
    syntax priorities unary > mul div > add sub > cmp > not > and xor or
    syntax left mul div
    syntax left add sub
    syntax left and xor or
    
endmodule
module EX3-2

    imports INT
    imports BOOL
    imports EX3-2-SYNTAX
    rule A * B => A *Int B
    rule A / B => A divInt B requires B =/=Int 0
    rule A + B => A +Int B
    rule A - B => A -Int B
    rule (A) => A
    rule -A => 0 -Int A

    rule ! B => notBool B
    rule A && B => A andBool B
    rule A ^ B => A xorBool B
    rule A || B => A orBool B
```

前面的部分与之前一致。

对于整数比较，如果要定义`<, >, <=, >=, ==`，其实只需要定义`<, ==`。`<`可以通过减法转化为`A < 0`和`0 < A`之间的关系。

```k
    rule A >= B => A > B || A == B [priority(46)]
    rule A <= B => A < B || A == B [priority(47)]
    rule A < B => 0 < (B -Int A) [priority(44)]
    rule A > B => B < A [priority(45)]
```

而`A < 0`和`0 < A`又可以转化为绝对值和原值之间的相等不相等关系

```k
    rule A < 0 => absInt(A) != A [priority(42)]
    rule 0 < A => absInt(A) == A && A != 0 [priority(43)]
```

所以最终只需要定义相等不相等关系。这里通过模式匹配的方式定义等于，如果模式不匹配，则表示不相等。

```k
    rule A == A => true [priority(40)]
    rule _ == _ => false [priorities(41)]
    rule A != B => ! A == B
```

```k
endmodule
```

