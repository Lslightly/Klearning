# 条件和规则优先级

## Side Condition

通过`requires`为规则引入条件

## owise

通过`owise`表示该规则的优先级比其他规则都低，只有当其他规则都失败的时候才会采用这条规则

`owise`之间的顺序、non-`owise`之间的顺序都是不确定的。但是一定是先进行non-`owise`的规则判断，然后再是`owise`规则判断。

## 规则优先级

可以通过`priority`属性给规则定义数值上的优先级

`owise`的优先级数字为200。没有显式指明优先级的规则的优先级数字为50

## _变量

是一个placeholder占位符，表示对这个值并不关心。

## 同时满足好几个规则时采用的规则

暂时还没有找到规律，对于[test-priority](test-priority.k)的情况，采用`gradeFromPercentile(90)`始终为`letter-A`，移动rule和syntax中的位置并不改变最后使用的规则。