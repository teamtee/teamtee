# Makefile

这里是一份[教程](https://makefiletutorial.com)

## 基本概念
`Makefile`主要由目标、依赖、命令构成
```
targets: prerequisites
	command
	command
	command
```
## 规则
### 隐式规则
当缺乏所需要的文件的编译规则或者链接规则时时会自动

```
$(CC) -c $(CPPFLAGS) $(CFLAGS) $^ -o $@
$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $^ -o $@
$(CC) $(LDFLAGS) $^ $(LOADLIBES) $(LDLIBS) -o $@
```
### 模式规则
```
%.o:%.c
```
### 静态模式规则
```
$(objects):%.o:%.c
```

## 变量

### 自动变量

```
$@:target
$?:prerequisite newer than target
$^: all prerequisite
$<:first prerequisite
```
### 变量赋值
```
:= 直接赋值
= 间接赋值
?= 判空赋值（便量不存在,变量存在为空也不会赋值）
+= 追加赋值
```
### 通配符
`*`在命令中表现为通配符
```
$(wildcard *.c)
$(filter *.o,$(objects):%.o:%.c)
```
`%`在规则和变量赋值中表现为通配符
```
$(objects):%.o:%.c
two := $(foo:%.o=%.c)
```
### 函数变量

##函数

make有大量的内置函数
```
# subst （字符替换）
$(subst old,new,str)

# patsubst （正则表达式替换）
$(patsubst pattern,replace,strs)
two := $(foo:%.o=%.c)
three := $(foo:.o=.c)

# if  （condition为空或者不存在为假）
$(if condition,value1,value2)

# call
$(call func,arg1,arg2,...)

# addprefix （当INC_PATH存在-I开头时不会重复添加）
$(addprefix -I,INC_PATH)

# fileter 
$(filter *.o,objects):%.o:*.c
```
##指令
### 目标
```
.PHONY:
.DEFAULT_GOAL:
```
### include|-include|sinclude
`make`命令会在`-I`指定的目录和系统的`include`目录下查找`include`所包含的文件，当为查找到文件且没有构建该文件的规则时，如果是`include`，`make`会报错退出，`-include`忽视会继续执行，`sinclude`是`GNU make`下为了和其他`make`兼容的`-inlcude`

# Kconfig
kconfig是一种帮助复杂工程配置相互关联的选项的配置文件，Linux内核和嵌入式操作系统zephyr就是用kconfig管理的
## Kconfig解析
这里是一份[教程](https://blog.csdn.net/wenbo13579/article/details/127464764#t8)
`Kconfig`可以用C语言相关的库解析，也可以通过`Python`的包解析，这里我演示如何使用`Python`的`kconfiglib`解析
```
from kconfiglib import Kconfig
from menuconfig import menuconfig

kconf = Kconfig(filename="./Kconfig")
menuconfig(Kconf)
kconf.write_autoconf()
```
## Kconfig语法
这里是一份[教程](https://docs.kernel.org/kbuild/kconfig-language.html)





通常一份配置文件如下
```
mainmenu "Kconfig Demo"

menu "Test Params setting"
config TEST_ENABLE
    bool "Enable test work"
    default n
    help
        Will print debug information if enable.
...
endmenu
```
Kconfig文件有以下内容

- config
- menuconfig:设置标题
- choice/endchoice：设置bool和tristate的值
- comment：设置评论信息
- menu/endmenu：设置菜单
- if/endif：设置隐藏块
- source：设置
### config

通常的配置项目如下，`config name`，然后下面是属性
```
config name
    ...
```
必须配置属性值："bool"/"tristate"/"string"/"hex"/"int"
```
bool "Networking support"
```
(注：tristate为y/n/m三态，y表选择，n不是不选择，m表示编译到内核)

可以配置提示符:
最多一个
```
"prompt" <prompt> ["if" <expr>]
```
```
bool 
promt "Networking support"
```
可以配置默认值：
不限数量，取第一个，如果有if，当if为真时该默认值才起作用
```
"default" <expr> ["if" <expr>]
```
可以配置依赖项：

只有当依赖项为真的时候该配置项才可见
```
bool "foo" if BAR
default y if BAR

```

```
depends on BAR
bool "foo"
default y

```
可以配置关联项：

选中了BAR会导致FOO也变为选中(Y)，使得满足依赖关系

```
config FOO
    bool "Foo Option"
config BAR
    bool "Bar Option"
    select FOO if BAR
```
可以配置弱依赖：

当FOO被选择后会自动配置BAZ为选中状态

（如果为int，设置为默认值，如果为bool，设置为y,如果为tristate，设置为y）
```
config FOO
    tristate "foo"
    imply BAZ

config BAZ
    tristate "baz"

```

可以设置范围：
数值类型可以设置范围

```
"range" <symbol> <symbol> ["if" <expr>]
```
可以设置提示词：
```
"help"
```

### menuconfig
```
(1):
menuconfig M
if M
    config C1
    config C2
endif

(2):
menuconfig M
config C1
    depends on M
config C2
    depends on M
```
### choice
```
"choice" [symbol]
<choice options>
<choice block>
"endchoice"
```
```
choice

    prompt "Fruit options"

    

config APPLE

    bool "Apple"

    help

      Select this option if you like apples.

      

config ORANGE

    bool "Orange"

    help

      Select this option if you like oranges.

      

config BANANA

    bool "Banana"

    help

      Select this option if you like bananas.

      

endchoice
```