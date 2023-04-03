# unparsing and the format/color attribute

解释执行的过程为

1. parsing: 通过kast或者通过bison生成的AOT解析器解析输入程序得到AST
2. execution: 根据重写规则不断重写
3. unparsing: 将程序的最终状态转化为AST打印出来

# 定制化unparsing

通过`format`属性定制化unparsing

# 定制化颜色

通过`color`,`colors`属性定制化颜色。`colors`列表中的颜色会涂到终结符上

通过`kparse <file> --definition 'xxx' | kore-print - --definition 'xxx'`可以只解析文件而不去执行文件

