# Unification and symbolic execution

## Symbolic execution

之前的configuration都是具体的。LLVM Backend是具体的执行引擎。Haskell后端采用符号执行的方式，能够重写任何configuration，包括部分是符号的configuration，即包含变量或者未解释的函数。

## unification合一

之前的程序中都是认为K框架通过模式匹配来重写configuration。在符号执行中，是使用合一而非模式匹配。合一可以让configuration中规则的lhs和configuration都包含变量，算法会产生相应的mgu来进行相应的替换。

## 可行性

符号执行必须完成的一件任务是需要识别一个特定的符号项是否是可行的(feasible)，即存在项的实例使得项的所有逻辑约束能够被满足。Haskell后端将这个任务委托给Z3进行求解。Z3求解器用于排除数学上不可行的configuration。

## 符号项

符号执行的最后一个组件是将符号项引入configuration中。可以通过两个方式实现

1. 传递给krun的项是符号项
2. 在重写规则的rhs中存在限定变量，该变量不在lhs中出现。K要求这种变量以`?`前缀出现。

## `ensures`子句

在出现限定变量时，可以通过`ensures`子句来给这个变量添加约束。

`#And`,`#Or`,`#Equals`是匹配逻辑(matching logic)连接符。

[lesson-21.k](lesson-21.k)的输出结果为析取范式。其中合取项包含configuration和一组约束，表示要达到这个configuration所需的约束。

