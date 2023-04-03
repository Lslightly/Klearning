# term equality and the ternary operator

如何比较K中项的相等性，以及如何将条件表达式放在规则的rhs中

## 项的相等性

在`K-EQUAL`模块中提供`==K`算符，包含`Map`和`Set`之间的相等性（这两者在结构上是不相等的）。这个算法不包含在用户定义的语法上的语义相等性。不等算符为`=/=K`

## Ternary算符

在K中引入条件逻辑的方式是写两个规则，都包含条件。在`K-EQUAL`模块中包含算符可以在规则的右边表示条件表达式。

`#if Bool #then E1:T #else E2:T #fi`整个表达式的类型为`T`类型

