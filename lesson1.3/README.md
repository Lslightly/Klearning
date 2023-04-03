产生式满足BNF范式的变体

`kast --output <kore|kast|...> <input file>`

bracket属性用于表示括号属性，在ast上不会显示出来，但是会按照括号方式进行匹配。括号方式不能解决二义性问题

```k
syntax TokenName ::= r"regular expression" [token]
```

```k
syntax TokenName ::= r"{lexicalName}" [token]
syntax lexical lexicalName = r"..."
```

预先编译(ahead-of-time parser generation)

`kompile --gen-bison-parser|--gen-glr-bison-parser`编译，`foo-kompiled/parser_PGM <file>`执行解析