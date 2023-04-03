无二义的解析

## 优先级

优先级规则通过`>`来体现。只有当孩子结点是产生式的最前结点或者最后结点的时候才会采用优先级规则

在`()`操作符中，由于非终结符不是最前或者最后结点，所以导致优先级规则没有被使用

## 结合性

- 左结合符号不能出现在有相同优先级的符号的直接最右孩子结点中`left: `
- 右结合符号不能出现在有相同优先级的符号的直接最左孩子结点中`right: `
- 无结合性符号不能出现在有相同优先级符号的直接最左/最右孩子结点中`non-assoc: `

结合性在相同优先级下对一个组进行实施，即一个组的结合性都是相同的。

```
                   > left:
                     Boolean "&&" Boolean [function]
                   | Boolean "^" Boolean [function]
                   | Boolean "||" Boolean [function]
```

## 显式优先级和结合性的声明

```
syntax priorities literal atom > not > and > xor > or
```

引入非内置的属性显式表示优先级和结合性

`syntax left a b`和

```
syntax left a
syntax left b
```

不同，可能是因为前者需要一个产生式同时满足两个属性才具有这个属性？

## prefer/avoid

在如下所示的`if-then-else`的二义文法下，采用优先级方式，即让没有else的if结构不能作为有else的if结构的第一个Stmt，是无效的。因为在K中优先级能够生效比如让非终结符是产生式的开头或者结尾，但是`if-then`归约生成的Stmt非终结符位于`if-then-else`产生式的第一个Stmt，既不是开头，也不是结尾，因此优先级无法生效，仍然会归约，导致错误结果。

```
  syntax Stmt ::= "if" "(" Exp ")" Stmt
                | "if" "(" Exp ")" Stmt "else" Stmt
                | "{" "}"
```

avoid用于避免在文法二义时，二义部分解析树的顶部为某个产生式。avoid会移除以带有这个属性的产生式形式出现的顶部解析树。

prefer与avoid类似，在文法二义时会选择某个产生式作为解析树的顶部，而没有prefer属性的产生式作为顶部的解析树则不在考虑范围之内。

