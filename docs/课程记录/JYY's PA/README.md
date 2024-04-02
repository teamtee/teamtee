# Jyy's PA

这是我在2023年夯实我基础的首个课程笔记，欢迎大家观看！

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

## 附录

### C regular实例
下面是一个简单的示例

```c
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