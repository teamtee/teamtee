# 2020 南京大学计算机系统基础习题课

这是我在2023年夯实我基础的首个课程笔记，欢迎大家观看！
[课程主页](https://jyywiki.cn/ICS/2020/index.html)
[视频链接](https://www.bilibili.com/video/BV1qa4y1j7xk/)


`gcc`的替代品
手动选择文件的命令
## 1.The Missing Course of Your CS Education

主要内容是简介，包括学术诚信和生存指南等等，推荐了下面的课程，无视频
[Github 的 “Awesome” 系列](https://github.com/search?q=awesome)
[The Missing Course of Your CS Education](https://missing.csail.mit.edu/)

## 2.C 语言拾遗 (1): 机制
`c`程序的编译如下，`gcc`通过`-E，-s，c`来控制过程
```
.c → 预编译 → .i → 编译 → .s → 汇编 → .o → 链接 → a.out
```

### 预编译

预编译也称为元编译，预编译实际上发生的就是宏替换,我们使用`gcc -E `编译下面的文件，会发现实际上预编译就是将`stdio.h`文件的内容复制粘贴而已。
```
#include <stdio.h>
```

> **[info] 宏编译举例**
> 
a文件
```
#include <stdio.h>
int main(){
#include "b.inc"
}
```
b文件
```
printf("hello,wolrd\n");
```
以上这两个文件都可以直接编译

---
我们已经知道`#include`的功能就是字符串的替换，那么其实我不需要这么多的定义和函数，能不能我们主动替换掉`#include <stdio.h>` 
> **[info] 最小printf文件**
> 
我们实际上不需要所有的stdio文件，只需要其中的某一个函数
```
extern int printf (const char *__restrict __format, ...);
int main(){
printf("hello,wolrd\n")
}
```

---

>**[warning] 以下代码有什么区别？**
>
```
#include <stdio.h>
#include "stdio.h"
```
为什么在没有安装库时会发生错误？
```
#include <SDL2/SDL2.h>
```
`<stdio.h>`是系统头文件会在系统指定的路径寻找，，`"stdio.h"`是自定义头文件会在当前目录下寻找,你可以通过下面的选项来指定
```
gcc -I:添加系统头文件寻找路径
gcc -L:添加系统库文件寻找路径
gcc -l:添加编译使用的库文件
```

---


`gcc --verbose` 查看系统编译过程中的详细信息
(verbose是啰嗦的意思，git命令也可以使用--verbose 比如git branch --verbose）
> **[info] `gcc`实际干了什么？**
> 
`gcc`实际上调用了`cc1`和`ld`，
```
.c → cc1  → .s → 汇编 → .o → ld → a.out
```
---

> **[info] 有趣的宏编译**
> 
以下代码会输出什么？为什么？
```
#include <stdio.h>
int main() {
#if aa == bb
  printf("Yes\n");
#else
  printf("No\n");
#endif
}
```
因为`aa`和`bb`都不存在，所有相等，`#`开头的全部消失，保留第一个`yes`的`printf`语句

`##`的作用是连接两边的字符串
```
#define SYSTEM sys ## tem
```
陷害队友的代码
```
#define true (__LINE__ % 16 != 0 )
```


 
推荐书籍
[The Art of Readable Code.pdf](media/The%20Art%20of%20Readable%20Code.pdf)

 
## 3.C 语言拾遗 (2)：编程实践

编程的首先要原则是编写可读的代码和降低代码的耦合程度

> **[info]编写可读的代码**
> 不可读=不可维护
人类不可读版 (STFW: clockwise/spiral rule)
```
void (*signal(int sig, void (*func)(int)))(int);
```
人类可读版
```
typedef void (*sighandler_t)(int);
sighandler_t signal(int, sighandler_t);
```
gcc -E hour.c | indent - 

---

> **[info]c语言指定初始化器**
> 
```
enum { RA, R1, ..., PC };
u8 R[] = {
  [RA] = 0,  // 这是什么语法？？
  [R1] = 0,
  ...
  [PC]  = init_pc,
};
```

---

> **[info]降低程序间的耦合程度**
> 
```
// breaks when adding a register
#define NREG 5 // 隐藏假设max{RA, RB, ... PC} == (NREG - 1)
// breaks when changing register size
#define NREG (sizeof(R) / sizeof(u8)) // 隐藏假设寄存器是8-bit
// never breaks
#define NREG (sizeof(R) / sizeof(R[0])) // 但需要R的定义
// even better (why?)
enum { RA, ... , PC, NREG }
```

---


> **[info]编写可读的代码**
> 
```
typedef union inst {
  struct { u8 rs  : 2, rt: 2, op: 4; } rtype;
  struct { u8 addr: 4,        op: 4; } mtype;
} inst_t;
#define RTYPE(i) u8 rt = (i)->rtype.rt, rs = (i)->rtype.rs;
#define MTYPE(i) u8 addr = (i)->mtype.addr;
void idex() {
  inst_t *cur = (inst_t *)&M[pc];
  switch (cur->rtype.op) {
  case 0b0000: { RTYPE(cur); R[rt]   = R[rs];   pc++; break; }
  case 0b0001: { RTYPE(cur); R[rt]  += R[rs];   pc++; break; }
  case 0b1110: { MTYPE(cur); R[RA]   = M[addr]; pc++; break; }
  case 0b1111: { MTYPE(cur); M[addr] = R[RA];   pc++; break; }
  default: panic("invalid instruction at PC = %x", pc);
  }
}
```

## 3. 框架代码选讲 (1)：编译运行
主要内容是Git，推荐两个链接
[A Visual Git Reference](https://marklodato.github.io/visual-git-guide/index-en.html)
[Visualizing Git Concepts with D3](http://onlywei.github.io/explain-git-with-d3)    

> **[info]doc as code**
> 
> abstract-machine 有一个彩蛋
 

### 提交脚本
## 4. 框架代码选讲 (2)：编译运行 
如何了解一个代码库
```
find . -name "*.c" -o -name "*.h" | xargs cat | wc -l
```
如何寻找main()在的位置
```
find . | xargs grep --color -nse '\<main\>'
vim **/main.c
```
> **[info] grep**
> 
> 实际上grep命令是“Global Regular Expression Print”的缩写，
> -n显示行号，-s不显示匹配失败的信息，-e指定匹配模式（不知道是啥）

---

> **[info] man**
`man getopt`和`man 3 getopt`的区别是，前者查看命令行工具，后者查看C标准库，也可以说用`man -k getopt`

---

> **[info] static与inline**
> 
> 一般在头文件中声明函数，在C文件内定义函数，但是你的程序较短且性能攸关，则可以使用 static inline 函数定义在头文件中

# Jyy's PA
## PA0

推荐了Tmux、Vim、Git工具的深入使用，具体的教程参加我的Linux下的[笔记](https://teamtee.github.io/teamtee/Linux/)
其他的包括源码的获取，挺简单的。


### Makefile

#### section 1
 `$(deps_config): ;` 是一个空规则。它表示 `deps_config` 中的文件不需要进行任何操作，即使这些文件不存在，也不会报错

```
deps_config := \
	src/device/Kconfig \
	src/memory/Kconfig \
	src/isa/riscv32/Kconfig \
	/home/teamtee/Desktop/ics2021/nemu/Kconfig

include/config/auto.conf: \
	$(deps_config)


$(deps_config): ;
```


#### section 2 
```
remove_quote = $(patsubst "%",%,$(1))
CC = $(call remove_quote,$(CONFIG_CC))

```
## PA1


### 调试器

#### Readline

#### Str

```c
char *strtok(char *str, const char *delim);
```

#### C regular

C 的正则表达式匹配通过**编译**+**匹配**的方式进行匹配，可以通过`man regexec`查看教程

`regcomp`用来编译正则表达算式，`cflags`表示支持的正则表达式语法,编译成功返回`0`

```c
int regcomp(regex_t *preg, const char *regex, int cflags);

```
`regexec`用编译好的正则表达式来匹配字符串,匹配成功至少一次后返回`0`，`preg`表示编译好的正则表达式，`string`表示待匹配的字符串，`nmatch`表示要匹配的`pmathc`，`pmathc`用来存储匹配的信息，`pmatch`有两个变量,`rm_so`表示匹配到的开始，`rm_eo`表示匹配到的结束,如果`rm_so`为`-1`表示未匹配到，`eflags`一般取0.

```c
int regexec(const regex_t *preg, const char *string, size_t nmatch,regmatch_t pmatch[], int eflags);
typedef struct {
   regoff_t rm_so;
   regoff_t rm_eo;
} regmatch_t;
```


#### 颜色输出
但我们使用命令的时候可以看到是有颜色输出的，比如`ls`,实际上命令通常都有一个`--color`的选项来控制在什么情况下输出字符,如果我们`ls --color=true | vim -`是可以看到奇怪的输出.

实际上控制台通过以下方式输出颜色

```
# 其中0；31；42；为控制输出条件
\033[0;31;42moutput\033[0m

```
0-9字体效果：0默认，1高亮，4下划，5闪烁，7反白显示

30-39字体颜色，40-49背景颜色：黑红绿黄蓝紫青白

#### Kconfig

这里是一份[教程](https://docs.kernel.org/kbuild/kconfig-language.html)

#### sizeof和 strlen
这里是一份[教程](https://www.runoob.com/w3cnote/strlen-and-sizeof.html)

#define ARRLE(arr) int(sizof(arr)/sizeof(arr[0]))

### RISC-V
这里是一份很好的RISC-V 32的[资料](chrome-extension://bocbaocobfecmglnmeaeppambideimao/pdf/viewer.html?file=https%3A%2F%2Fusers.sussex.ac.uk%2F~mfb21%2Fcompilers%2Fslides%2F11-handout.pdf)