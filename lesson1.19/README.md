# GDB或者LLDB debug

为了能够debug K解释器，第一件要做的事情是让解释器支持debug。可以通过`kompile --enable-llvm-debug`实现。

在`krun`中可以传递`--debugger`选项用于调试。

## 基本指令

`run`指令会执行程序。

`k start`可以启动程序但是马上暂停，但是已经完成重写器的初始化，计算了初始的configuration，并且暂停在应用任何重写规则之前。

`k step`可以继续前进，`k step 10`表示前进10步。

## 断点

有三种类型的断点

1. 当特定的函数被调用时
2. 特定的规则被应用时
3. 一个规则的附加条件被计算时

`break lesson-19-b.k:4`表示在第四行的`isBlue`函数被调用的时候会暂停。

```
...
4 syntax Bool ::= isBlue(Fruit) [function]
...
```

## 高级断点

基于规则名称也可以设置断点。即通过`MODULE-NAME.label.rhs`设置在规则被应用(即rhs被计算)的时候暂停。

也可以在规则的附加条件被计算的时候暂停。通过`MODULE-NAME.label.sc`

`finish`指令可以告诉我们附加条件的计算结果

在附加条件断点中：只有在附加条件中出现的变量才会在lhs中出现。

## debug规则匹配

确定一个特定的规则是否被应用或者没有被应用。

有时候需要去看一个规则以及当前的状态，去人眼发现为什么规则没有匹配。这时候就可以用到规则匹配的debug，即让程序给出它是怎么去尝试匹配规则的。这个可以通过`k match`命令实现。在运行完`k start`或者`k step`指令之后，可以通过`k match MODULE.label subject`可以为特定的顶层规则获取匹配的方式。

`k match`并不进行任何重写，在匹配完成之后仍然需要使用`k step`进行重写。

## 最后的提示

除了上述技巧之外还有GDB/LLDB本身的特性可以使用。

