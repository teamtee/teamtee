# Jyy's PA

这是我在2023年夯实我基础的首个课程笔记，欢迎大家观看！

TODOLIST：
gcc的替代品
手动选择文件的命令
## PA0


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