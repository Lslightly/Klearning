# 演绎式程序验证

`#Top`表示matching logic中的`true`

可以通过`claim`证明K执行时满足特定性质。

在报错信息中包含negative constraints, final configuration, positive constraints。可以通过positive constraints和final configuration来推测为什么会出现negative constraints。

`[simplification]`属性可以让K系统在证明某个声明的时候使用这个规则