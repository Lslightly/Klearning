# Maps, Semantic Lists, Sets

## Maps

从KItem到KItem的映射。其中KItem可以是任意类型除了K sequence。Map的语法结构如下：

```k
syntax Map ::= KItem "|->" KItem
```

空Map为`.Map`。

Map更新:`syntax Map ::= Map "[" KItem "<-" KItem "]"`，例如`STATE => STATE [ X <- I ]`

Map pattern: `<state>... Pattern ...</state>` 其中Pattern可以是重写规则。旁边的`...`表示其他状态不变，不关心。Map模式包含0个或多个元素，通过空格分割。有0个或1个Map类型变量。其中

其中`<state>... Pattern ...</state>`, `<state>... Pattern </state>`, and `<state> Pattern ...</state>`是相同的，都表示`<state> (Pattern) _:Map </state>`。

在重写规则的lhs，不允许出现多于1个变量。也可以在map元素的键中写函数pattern，只要函数模式中的所有变量都可以被唯一确定。

## Semantic Lists

在configuration中使用lists。通常使用associative-list而不是cons-list(链表)

> associative-list中每一项包含一个对，比如属性-值对、值-表示对

K提供List类型，在`LIST`模块中。所有List项都是`KItem`类。List项通过`ListItem`符号表示。

`.List`表示空表。

在重写规则的lhs，只能出现List pattern，不能出现超过一个变量。在rhs可以写变量。

`<cell>... Pattern</cell>`和`<cell>_:List (Pattern)</cell>`相同，`<cell>Pattern ...</cell>`和`<cell>(Pattern) _:List</cell>`相同。由于包含多个List类型变量的list模式是不允许的，所以写`<cell>... Pattern ...</cell>`是错误的。

一个`...`就代表一个`_:List`变量，虽然没有名字。

list模式中不能出现多个List类型变量。

## Sets

不会有多个相同的值。

`SET` module，`Set`类型。空Set为`.Set`，一个Set元素为`SetItem`

Set模式中，对于包含一个Set变量的模式，会匹配这个set的超集。

map上的`in_keys`符号可以检测是否有重复值。

