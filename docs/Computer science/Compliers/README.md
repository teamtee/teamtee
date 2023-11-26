# Compilers and Computer Architecture (G5035)
参考资料
[课程主页资料](https://users.sussex.ac.uk/~mfb21/compilers/material.html)
## 课程笔记
![](media/17007197620504.jpg)

### 1.Compilers and computer architecture:introduction
编译器的分为分析和生成俩个阶段：源码解析和代码生成
源码解析通常都发生在编译阶段，但是有的即时编译语言发生在运行时（Just in time compiler）
![](media/17007148190043.jpg)
#### Lexical analysis（词法分析）
编译器的输入通常都是字符串，在这个阶段通过将字符串识别为token
```c
int testfun( int n ){
int res = 1;
while( n > 0 ){
n--;
res *= 2; }
return res; }
```
可以被识别成为
```
T_int, T_ident ( "testfun" ), T_left_brack,
T_int, T_ident ( "n" ), T_rightbrack,
T_left_curly_brack, T_int, T_ident ( "res" ),
T_eq, T_num ( 1 ), T_semicolon, T_while, ...
```
#### Syntax analysis/parsing（语法分析）
语法分析将tokens转化为抽选语法树AST（abstract syntax trees）
需要满足两个目标：（1）数的生成组织和解析的快慢（2）语义分析的方便
![](media/17007165702034.jpg)
#### Senmantic analysis(语义分析）
语法分析可以拒绝语法不合规的项目，但是无法检查语义不合规的项目,检查的关键技巧在于类型检查
```
void main() {
i = 7
int i = 7
...
if ( 3 + true ) > "hello" then ...
```
#### ntermediate code generation（中间码生成）
对于不同的CPU都有不同的机器码，甚至不同的CPU版本的机器码都有差别，因此编译器首先根据AST生成中间码，对中间码进行优化，然后将中间码翻译成对应的机器码。

#### Optimisation（优化）
通常而言优化器会以减少内存和运行功率作为优化目标，优化是一个NPC问题，因此优化器只是会做最少的优化，特别是对于JIT（即时编译语言）优化更加困难。
#### Code generatio（代码生成）
将中间码翻译成机器码，因为很相似，因此这一阶段很简单

#### Complier vs interpreter
翻译器通常比编译器简单，但是编译器只需要编译一次即可永远运行
![](media/17007183699707.jpg)
#### 推荐书籍
Modern Compiler Implementation in Java 

Compilers - Principles, Techniques and Tools

### 2.Compilers and computer architecture:From strings to ASTs (1): lexing
#### lexing 词法分析
词法分析类似下面的过程
- String: “Synchronised dancing is great!”
- List(String): [“Synchronised”, “dancing”, “is”, “great”, “!”]
- List(Token): [Adjective, Noun, Verb, Adverb, Punctuation]

我们需要确定语言的语法结构构成，比如
- Keywords (IF, ELSE, WHILE, ...), but not GIRAFFE
- Identifiers (x, i, username, ...), but not _+++17
- Integers (0, 1, 17, -3, ...), but not ...
- Floating point numbers (2.0, 3.1415, -16.993, ...)
- Binary operators (+, *, &&, ||, =, ==, !=, :=, ...)
- Left bracket
- Right bracket
- Token boundaries (whitespace, tab-stops, newlines,
semicolon, ...)

关键字优先级
最长匹配原则
Look ahead
在下面的语句中for不是一个关键字，而是一个数据类型，但是决定for的token类型需要向后看，向后看的越多编译器效率越低，现代编译器基本上只需要往后看一个字符
```
int formulaLength = 17; for i = 0 to ...
```