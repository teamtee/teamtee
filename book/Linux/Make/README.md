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

# 变量

## 自动变量

```
$@:target
$?:prerequisite newer than target
$^: all prerequisite
$<:first prerequisite
```
## 变量赋值
```
:= 直接赋值
= 间接赋值
?= 判空赋值（便量不存在,变量存在为空也不会赋值）
+= 追加赋值
```
## 通配符
`*`在命令中表现为通配符
```
$(wildcard *.c)
$(filter *.o,$(objects):%.o:%.c
```
`%`在规则和变量赋值中表现为通配符
```
$(objects):%.o:%.c
two := $(foo:%.o=%.c)
```
## 函数变量

## 函数

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
## 一些指令
```
.PHONY:
.DEFAULT_GOAL:
```
## include|-include|sinclude
`make`命令会在`-I`指定的目录和系统的`include`目录下查找`include`所包含的文件，当为查找到文件且没有构建该文件的规则时，如果是`include`，`make`会报错退出，`-include`忽视会继续执行，`sinclude`是`GNU make`下为了和其他`make`兼容的`-inlcude`