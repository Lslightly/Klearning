# Integers and Booleans

## 内置类型

`include/kframework/builtin`

## Booleans in K

`Bool` Sort, `BOOL` module, true, false

`orBool`函数用于表示or操作

[domains.md](https://kframework.org/k-distribution/include/kframework/builtin/domains/)

## Syntax Modules

对于`Bool` Sort，还提供`BOOL-SYNTAX`模块，其中只包含true, false的声明，不提供任何函数。因此如果要定义自己的语法，但是又要利用现有库，可以只imports BOOL-SYNTAX

## Integer

`INT` module, `Int` Sort，任意精度的整数

`UNSIGNED-INT-SYNTAX` module，全部是自然数，有些语言会定义UnaryOp -表示相反数

divInt得到的余数总是正数

## Exercise有感

相同优先级的符号写在相同的结合性中