# K rewriting基础

## Top-level rules

将一条规则视为top-level规则最简单的方式是规则的lhs提及一个或多个cell。

K cell，默认cell

```
<k>
  Yellow ( ) ~> .
</k>
```

将`~>`视为关联表


```k
  syntax K ::= KItem "~>" K
             | "."
```

通过`.K`来防止二义

`KItem`也是内置的类型。对于任何定义，都会隐式插入`syntax KItem ::= S`

任何类型都是`KItem`的子类型。任何类型的项都可以被视为`K`的项，也被称为K sequence。

`krun`在面对多个规则同时满足的时候会选择一个规则进行执行。对于non-deterministic的情况，通过`krun --search`选项可以探索所有可能的选择。当`kompile`时有`--enable-search`选项时，`krun`的`--search`选项才有效。

`krun --depth <num>`可以查看rewrite的每步结果。

## 简化求值器

`=>`

可以通过下划线方式表示部分匹配的内容没有被改变。

比如对于

```k
rule <k> I1:Int + I2:Int ~> K:K </k> => <k> I1 +Int I2 ~> K </k>
```

可以改变为

```k
rule <k> (I1:Int + I2:Int => I1 +Int I2) ~> _:K </k>
```

这里能够这么写是因为重写算法会被提到rule的最外层，其他部分会复制一份。

在如下规则中，`...`需要放在`</k>`前面，这会告诉编译器在之后插入隐式的K类型变量。这里`...`表示我们不关心后面的部分，不需要进行改变。

```k
rule <k> I1:Int + I2:Int => I1 +Int I2 ...</k>
```

