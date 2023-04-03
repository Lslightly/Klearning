# markdown文学编程

markdown文件中包含的k程序可以被kompile编译

可以通过`kompile ex1.md --main-module LESSON-08`将markdown中的所有K code block连接起来形成单独文件送给k编译器编译

## 通过selector控制哪些被包含在K定义中

传递给kompile工具以`--md-selector`参数，可以控制哪些定义被包含在K definition中，可以通过`&`, `|`, `!`, and `()`结合selector

