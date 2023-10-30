# Jyy's PA

这是我在2023年夯实我基础的首个课程笔记，欢迎大家观看！

## PA0

### Vim(TODO)

.vimrc ctags 

### Tmux

这里是一份[教程](https://github.com/tmux/tmux/wiki/Getting-Started),可以参考。

#### 基本概念
从服务的角度：`server` - `client`

`tmux`有一个`server`管理多个`client`，每个`client`和一个`session`连接,用户启动`tmux`的时候实际上是启动一个`client`连接到`server`。`client`是伪终端，进程实际由`server`管理,当用户断开连接后，运行在`client`中的进程不会被中断。

从显示的角度：`session` - `windows` - `pane(terminal)`

每个`session`可以与零个或者多个`client`相连接，每个`session`的命名必须唯一。每个`session`管理多个`windos`,`windows`的命名可以重复，可以连接一个或者多个`session`，`windows`内有多个`pane`,其中有一个为活跃的`pane`

当所有的`session`中的所有进程终止的时候`server`终止

#### 命令模式

按下`C-b :`进入命令模式，按下`C-b ?`查看所有命令,按下`C-b /`查看单个命令

#### `Tree` 模式

##### `session`
`Tmux`有一个模式叫树模式，在`Tmux`中按下`C-b s`或者`C-b w`进入，前者显示当前附着的`session`的情况，后者显示所有`session`的情况，还可以通过`:choose-tree`进入。进入后屏幕分为上部分树和下部分预览。

树模式下可以按下`t`标记，`T`取消所有标记，`x`删除当前项，`X`删除所有标记项目，也可以用`:`使用命令对所有的标记项操作。`r`可以反向排序,`v`可以取消预览。

##### `client`

`Tmux`也有关于`client`的树模式，按下`C-b D`进入，可以看到当前活跃的`client`以及和哪一个`session`相连接。

#### 基本使用
##### 创建`client`
`tmux ls`: 列出所有的`session`

`tmux`: 默认会创建一个`client`和一个`session`,等同于`tmux new`

`tmux -t session_name`: 创建一个`client`同时连接`session`

##### 创建`session`
`tmux new`：创建一个默认的名为`index`的`session`（即为名字就是序号)

`tmux new -syourname`: 指定名字为`yourname`
##### 创建`windows`
`:neww`: 创建默认窗口，名字为通常为`bash`

`:neww -nyourname`: 创建窗口同时命名

`:neww -t999`: 创建窗口同时指定序号为`999`

`:neww top`: 创建窗口同时命名和执行改命令`top`

##### 切换`windows`

`C-b [0-9]`: 切换窗口为序号`[0-9]`

`C-b '`: 输入序号然后切换到序号窗口

`C-b p`: 切换到前窗口

`C-b n`: 切换到后窗口


##### 创建`panes`
`C-b %`： 垂直分割

`C-b "`: 水平分割

##### 切换`panes`

`C-b {`: 当前`pane`和上边`pane`交换位置

`C-b }`: 当前`pane‵和下边`pane`交换位置

`C-b up/down/right/left`: 切换当前聚焦的`pane`

##### 修改`pane`的大小

`C-b C-up/down/right/left`：上下左右微调

`C-b M-up/down/right/left`： 上下左右大调

`C-b M-1/2/3/4/5`: 调整布局格式

##### 删除

`C-b &`: 删除当前`session`

`C-b x`: 删除当前`panes`

##### 复制和粘贴
`C-b [`: 进入复制模式/滚轮模式，复制模式下会冻结输出

<<<<<<< HEAD
&emsp;&emsp;`C-space`:开始选取复制
=======
&emsp;&emsp;`C-b C-space`:开始选取复制
>>>>>>> 4fd4cac (Update)

&emsp;&emsp;`C-w`:结束复制

&emsp;&emsp;`q`: 退出复制

`C-b ]`: 粘贴上一次复制的文本

`C-b =`: 选择要粘贴的文本


##### 其他

`:set -g mouse on`: 支持鼠标

#### Tmux配置文件（TODO）

### Makefile

这里是一份[教程](https://makefiletutorial.com)

#### 基本概念
`Makefile`主要由目标、依赖、命令构成
```
targets: prerequisites
	command
	command
	command
```
#### rule
##### inplicit rule

```
# 编译c文件时如果缺乏指定`prerequisite`的`*.o`文件的编译规则,会自动执行下面的规则编译所需文件
$(CC) -c $(CPPFLAGS) $(CFLAGS) $^ -o $@
# 编译c++文件时如果缺乏指定`prerequisite`的`*.o`文件的编译规则,会自动执行下面的规则编译所需文件
$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $^ -o $@
# 链接文件时如果缺乏指定`prerequisite`的`*.o`文件的编译规则,会自动执行下面的规则编译所需文件
$(CC) $(LDFLAGS) $^ $(LOADLIBES) $(LDLIBS) -o $@

```
##### pattern rule
```
%.o:%.c
```
##### static pattern rule
```
objects = foo.o bar.o all.o
all: $(objects)
# implicit rule
$(objects):%.o:%.c

all.c:
	echo "int main() { return 0; }" > all.c
```
#### wildcard
`*`通配符会自动匹配当前目录下文件,推荐使用`$(wildcard *.c)`而非`*.c`
```
*.c:当前目录下不存在*.c文件时，保持为*.c不变
$(wildcard *.c):当前目录下不存在*.c文件时，为空
```
`wildcard`还可以判断文件是否存在
```
ifeq ($(wildfile $(NEMUOME)/main.c),)
    $(error file not exist)
endif
```

`*`通配符同常用来匹配文件的无后缀名

#### automatic ariables

```
$@:target
$?:prerequisite newer than target
$^: all prerequisite
$<:first prerequisite
```
#### 变量赋值
```
:= 直接赋值
= 间接赋值
?= 判空赋值（便量不存在,变量存在为空也不会赋值）
+= 追加赋值
```

#### function

make有大量的内置函数
```
# subst
# 将str中的old字符替换成new
$(subst old,new,str)

# patsubst
# 将strs中以空格分割的字符对pattern进行匹配，如果符合就替换成replace
$(patsubst pattern,replace,strs)
two := $(foo:%.o=%.c)
three := $(foo:.o=.c)

# if
# 检测条件变量是否为空，是则返回第一个值，否则返回第二个值
$(if condition,value1,value2)

# call
$(call func,arg1,arg2,...)

# addprefix
$(addprefix -I,INC_PATH)

# fileter
$(filter *.o,objects):%.o:*.c
```
#### 一些指令
```
.PHONY:
.DEFAULT_GOAL:
```
#### include|-include|sinclude
`make`命令会在`-I`指定的目录和系统的`include`目录下查找`include`所包含的文件，当为查找到文件且没有构建该文件的规则时，如果是`include`，`make`会报错退出，`-include`忽视会继续执行，`sinclude`是`GNU make`下为了和其他`make`兼容的`-inlcude`



#### Jyy's NEMU 

##### section 1
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


##### section 2 
```
remove_quote = $(patsubst "%",%,$(1))
CC = $(call remove_quote,$(CONFIG_CC))

```
## PA1


### 调试器

#### Readline

#### Str

```
char *strtok(char *str, const char *delim);
```

#### C regular

C 的正则表达式匹配通过**编译**+**匹配**的方式进行匹配，可以通过`man regexec`查看教程

`regcomp`用来编译正则表达算式，`cflags`表示支持的正则表达式语法,编译成功返回`0`

```
int regcomp(regex_t *preg, const char *regex, int cflags);

```
`regexec`用编译好的正则表达式来匹配字符串,匹配成功至少一次后返回`0`，`preg`表示编译好的正则表达式，`string`表示待匹配的字符串，`nmatch`表示要匹配的`pmathc`，`pmathc`用来存储匹配的信息，`pmatch`有两个变量,`rm_so`表示匹配到的开始，`rm_eo`表示匹配到的结束,如果`rm_so`为`-1`表示未匹配到，`eflags`一般取0.

```
int regexec(const regex_t *preg, const char *string, size_t nmatch,regmatch_t pmatch[], int eflags);
typedef struct {
   regoff_t rm_so;
   regoff_t rm_eo;
} regmatch_t;
```

下面是一个简单的示例

```
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <regex.h>

#define ARRAY_SIZE(arr) (sizeof((arr)) / sizeof((arr)[0]))

static const char *const str =
       "1) John Driverhacker;\n2) John Doe;\n3) John Foo;\n";
static const char *const re = "John.*o";

int main(void)
{
   static const char *s = str;
   regex_t     regex;
   regmatch_t  pmatch[1];
   regoff_t    off, len;

   if (regcomp(&regex, re, REG_EXTENDED))
       exit(EXIT_FAILURE);

   printf("String = \"%s\"\n", str);
   printf("Matches:\n");

   for (int i = 0; ; i++) {
       if (regexec(&regex, s, ARRAY_SIZE(pmatch), pmatch, 0))
           break;

       off = pmatch[0].rm_so + (s - str);
       len = pmatch[0].rm_eo - pmatch[0].rm_so;
       printf("#%d:\n", i);
       printf("offset = %jd; length = %jd\n", (intmax_t) off,
               (intmax_t) len);
       printf("substring = \"%.*s\"\n", len, s + pmatch[0].rm_so);

       s += pmatch[0].rm_eo;
   }

   exit(EXIT_SUCCESS);
}

```
#### color output
但我们使用命令的时候可以看到是有颜色输出的，比如`ls`,实际上命令通常都有一个`--color`的选项来控制在什么情况下输出字符,如果我们`ls --color=true | vim -`是可以看到奇怪的输出.

实际上控制台通过以下方式输出颜色

```
# 其中0；31；42；为控制输出条件
\033[0;31;42moutput\033[0m

```
0-9字体效果：0默认，1高亮，4下划，5闪烁，7反白显示

30-39字体颜色，40-49背景颜色：黑红绿黄蓝紫青白