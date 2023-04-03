# configuration and cell nesting

## cells and configuration declarations

如果没有显式指定configuration，则会使用默认的configuration

```k
configuration <k> $PGM:K </k>
```

`$PGM`类型是`K`，K是默认的开始符号，可以匹配所有用户定义的类型，除了语法List。These are excluded because they will always produce an ambiguity error when parsing a single element.

实际上可以定义多个cell和多个configuration变量：

```k
  configuration <k> $PGM:Ints </k>
                <sum> 0 </sum>
```

通过`$xxx`可以指定命令行中需要什么参数。

## cell nesting

添加嵌套cell不需要修改rule

## cell variables

变量匹配configuration中特定的部分。

变量名是cell的种类中去掉特殊字符，将第一个字符和连接符之后的字符大写，然后再加上Cell得到的。

```k
rule <k> true => S </k>
       (S:StateCell => <state>... .Bag ...</state>)
```

`<first-number>`会变成`FirstNumberCell`

`...`在cell中表示其他cell。在重写规则的左边出现时表示不关心其他没有被显式命名的变量的值是什么。在重写规则的右边出现时表示没有显式出现的值应该被初始化为默认值。

`.Bag`表示cell的空集，表示cell内部没有需要命名的cell。

