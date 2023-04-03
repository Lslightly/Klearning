# Syntactic Lists

## `List{}`

任意长度的项list

`syntax Ints ::= List{Int,","}`表示以`,`分割的Int列表

空表可以通过`.`+SortName来表示

```
  syntax Int ::= sum(Ints) [function]
  rule sum(I:Int) => I
  rule sum(I1:Int, I2:Int, Is:Ints) => sum(I1 +Int I2, Is)
```

会自动地在需要的地方添加`.Ints`(此即`.Ints`的空表)

在函数参数中，可以通过`.Ints`表示空表参数，如右图所示。

```k
    rule sum(.Ints) => 0
```

**无论如何必须使用大写字母开头来表示变量**

## `NeList{}`

不允许为空表