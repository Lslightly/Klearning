# 定义计算次序

`heat`, `cool`属性  `context`, `context alias`语句  `strict`, `seqstrict`属性

## heat和cool

K有内置的决定何时进行heat,何时进行cool的支持。通过`heat`和`cool`属性以及`isKResult`函数来支持。

`HOLE`变量会被编译器特殊处理。`HOLE`变量代表这个项要被heated或者cooled。编译器会自动在cool规则中加入`requires isKResult(HOLE)`，在heat规则中加入`requires notBool isKResult(Hole)`


## 通过context进行简化

指明哪些项需要被heated或者cooled，以及哪些部分需要被操作。

context以`context`关键字开头，通常不包含重写符号。

`context <k> xyz ...</k>`

## context alias

`context alias [name]: <k> HERE ...</k>`

`HERE`是一个特殊变量

`seqstrict(name; list of indexes of non-terminal in the production)`

对于每一个index都会生成一个规则，index处的非终结符会被HOLE替代，而之前的非终结符都要求有`isKResult(n)`（即`isKResult(n)`的合取）。

比如对于`Exp "+" Exp [seqstrict(exp; 1, 2)]`的index`2`，会产生规则:

```k
<k>E + HOLE => HOLE ~> freezer(E) ...</k> requires isKResult(K)
```

`seqstrict`属性提供了更多语法上的便利之处：
1. 如果`context alias`的语句为`<k> HERE ...</k>`，则可以同时省略`context alias`句子和`seqstrict`属性中的名字
2. 如果属性列表包含所有非终结符，则可以省略

简化版见[lesson-14-d.k](lesson-14-d.k)

## 包含`strict`属性的非确定求值顺序

`strict`和`seqstrict`一样也会对每个index生成一个规则，index处的非终结符会被HOLE替代，但是边界条件(即`isKResult`的合取)不再存在。比如对于`syntax Exp ::= Exp "+" Exp [strict]`，就会生成两条规则:

```k
context <k> _:Exp + HOLE:Exp ...</k>
context <k> HOLE:Exp + _:Exp ...</k>
```

