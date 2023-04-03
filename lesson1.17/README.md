# Cell multiplicity and Cell collections

对于cell使用XML类的属性

```k
configuration <k color="red"> $PGM:K </k>
```

`multiplicity`属性可以应用到cell上，而且包含特殊属性。

默认情况下，在每一个configuration项中，每个cell只会声明一次。但是通过`multiplicity`属性，这个默认行为可以被改变。这个属性可以有两种值`?`,`*`

## Optional cells

`?`表示在configuration中可以出现0次或者1次，即optional cell。

默认情况下，K不会在初始configuration中创建optional cell，除非optional cell中有一个configuration变量。通过添加属性`initial=""`，可以在默认情况下初始化optional cell。

`.Bag`表示特定规则中没有任何cell

## Cell collections

`*`表示该cell可以出现0次或者多次。包含`*`符号的cell必须是父cell的唯一孩子。

所有cell collections都需要有`type`属性，设置为`Set`或者`Map`。`Set`类型属性的表现形式和`Set` sort类似。`Map` cell collection中第一个子cell是键，剩余的cell是value。


