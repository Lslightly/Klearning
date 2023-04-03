# K backends and Haskell backend

默认后端是llvm backend。选用这个后端的原因是能够更快地执行。但是K作为形式化方法工具，最主要的目标还是执行更加高级的程序验证，因此也就引入了Haskell后端。

Haskell后端是一个独立的用Haskell编写的后端，为了能够更好地进行形式推理。虽然不能像LLVM后端那样快速执行，但是它可以提供更多的高级功能。

## 选择后端

kompile的`--backend`选项可以用于选择后端。`kompile --backend haskell`

Haskell后端能够读取`kompile`生成的IR然后进行解释。

## legacy backends

java backend是旧的后端