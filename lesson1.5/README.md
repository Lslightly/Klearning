# Modules, Imports and Requires

```k
module LESSON-05-B [attr1, ..., attr3(value)]
endmodule
```

## imports

```k
module xxx
    imports yyy
endmodule
```
 
## main syntax and semantics module

main syntax and semantics module are entry point modules

在使用`kompile foo.k`时，默认`FOO`为main semantics module，`FOO-SYNTAX`为main syntax module

## requires

在任何module声明之前

## include path

可以通过`-I`选项包括路径