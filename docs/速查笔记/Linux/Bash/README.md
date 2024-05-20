## 参考资料

[GNU官网](https://www.gnu.org/software/bash/manual/)

[阮一峰 Bash 脚本教程](https://www.bookstack.cn/read/bash-tutorial/docs-grammar.md)

## Bash基础语法

变量赋值 greeting=Hello （不可以有空格）

读取变量 $greeting

数学表达 $((express)) 等同于 expr express

设置shell变量 set -- params1 params2 

获得输入 read variable

提示输入 read -p "please input" variable

dirname 

basename

## Bash逻辑控制

### 函数

定义函数的两种方式,重定向是可选的
```
[ function ] funname [()]

{

    action;

    [return int;]

} [rediction]
```

### 条件控制

```bash
if [ conditions ]
    then
        commands
elif [ conditions ]
    then 
        commands
else
    commands
fi
```

### 遍历控制

```bash
for i in {1..5}
do 
    echo $i
done

for x in string1 string2 string3
do 
    echo $x
done
```

### 循环控制

```bash
i=1
while [[ $i -le 10 ]] ; do
   echo "$i"
  (( i += 1 ))
done
```

## Bash条件表达式

条件表达式分为普通条件表达式[]和拓展条件表达式[[]]

### 普通条件表达式[]

数字比较
```
-eq -ge -gt -le -lt -ne
```
字符串比较
```
 == != -z(检查字符串是否为空) -n(检查字符串是否不为空) 注意比较符号都需要空格
```
逻辑拓展
```
-a(与) -o(或)
```

### 拓展条件表达式[[]]

字符串比较:
```
[[ string == string ]] 检查两个字符串是否相等。
[[ string != string ]] 检查两个字符串是否不相等。
[[ string < string ]] 检查第一个字符串是否在字典序上小于第二个字符串。
[[ string > string ]] 检查第一个字符串是否在字典序上大于第二个字符串。
```
数值比较:
```
[[ number -eq number ]] 检查两个数值是否相等。
[[ number -ne number ]] 检查两个数值是否不相等。
[[ number -lt number ]] 检查第一个数值是否小于第二个数值。
[[ number -le number ]] 检查第一个数值是否小于或等于第二个数值。
[[ number -gt number ]] 检查第一个数值是否大于第二个数值。
[[ number -ge number ]] 检查第一个数值是否大于或等于第二个数值。
```
文件测试:
```
[[ -e file ]] 检查文件是否存在。
[[ -f file ]] 检查文件是否为常规文件。
[[ -d directory ]] 检查文件是否为目录。
[[ -r file ]] 检查文件是否可读。
[[ -w file ]] 检查文件是否可写。
[[ -x file ]] 检查文件是否可执行。
```
逻辑运算:
```
[[ expression && expression ]] 逻辑与（AND）。
[[ expression || expression ]] 逻辑或（OR）。
[[ ! expression ]] 或 [[ ! expression ]] 逻辑非（NOT）。
```
模式匹配:
```
[[ string =~ pattern ]] 检查字符串是否匹配正则表达式模式。
```
空值检查:
```
[[ -z string ]] 检查字符串是否为空。
[[ -n string ]] 检查字符串是否非空。
```

## Bash 变量

变量名可以由字母、数字和下画线组成，但是不能以数字开头，不能使用程序中的关键字（保留字），默认类型都是字符串型

- local name=value
- export name=value
- unset name
- readonly name

变量按类型分为数字类型、字符串类型，按照作用域分为本地变量、环境变量

数字类型支持的运算符号如下
```
id++ id--
++id --id
- +
! ~:logical and bitwise negation
**
* / %
<< >>:left and right bitwise shifts
<= >= < >
== !=
&
^
|
&&
||
expr ? expr : expr
= *= /= %= += -= <<= >>= &= ^= |=
expr1 , expr2
```
### 变量引用

- `$var`：引用变量
- `"$var"`：在字符串内替换变量
- `${var}`：引用变量，拓展引用提供更多的功能
- `'$var'`：视为普通字符串
- `$((var))`：数学表达式



#### [拓展引用](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html)

- `${var}`:变量替换
- `${var-substring}`:变量替换,如果var未设置或者为空，替换为给定substring
- `${var:=substring}`,变量替换,如果var未设置或者为空，替换并同时设置var为给定substring
- `${var:?error_info}`:变量替换,如果var未设置或者为空,在脚本执行时退出并且在错误输出error_info
- `${var:+substring}`:变量替换,如果var设置且不为空，替换未给定字符串(注意不要看反了)
- `${patams:offset}`:变量索引,从索引处开始到结尾
- `${patams:offset:length}`，变量索引,从索引处开始长度

> [!NOTE]
> 如果params为普通变量，length支持负数，解释为到末尾的字符偏移量位置，注意负偏移量必须与冒号分隔至少一个空格，以避免混淆'-'

- `${!prefix*}`:拓展为所以以prefex开头的变量，形成单个字符串
- `${!prefix@}`:拓展为所以以prefex开头的变量，形成多个字符串
- `$(#var)`:获取变量长度
- `${var#word}`：从开头匹配word开头的最短匹配，如果存在则删除
- `${var##word}`：从开头匹配word开头的最长匹配，如果存在则删除
- `${var%word}`：从结尾匹配word开头的最短匹配，如果存在则删除
- `${var%%word}`：从结尾匹配word开头的最长匹配，如果存在则删除
- `${parameter/#pattern/string}`：从开头匹配pattern开头的最短匹配，如果存在则替换
- `${parameter/%pattern/string}`：从结尾匹配pattern开头的最短匹配，如果存在则替换
- `${parameter/pattern/string}`:匹配pattern的第一个，如果存在则替换
- `${parameter//pattern/string}`：匹配pattern的所有匹配，如果存在则替换

> [!NOTE]
> [Pattern Match](https://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html)
> 注意Bash的通配符不同于正则表达式
> 支持*，？，[...]

### shell变量

位置变量
```
$1 $2, ... ${10}
```
特殊变量
- `$#`  传递到脚本的参数个数
- `$*`  显示所有向脚本传递的参数                  #与位置变量不同，此选项参数可超过9个
- `$$`  获取当前shell的进程号
- `$!`  执行上一个指令的进程号
- `$?`  获取执行的上一个指令的返回值              #0为执行成功，非零为执行失败
- `$-`  显示shell使用的当前选项，与set命令功能相同
- `$@`  与$*相同，但是使用时加引号，并在引号中返回每个参数


> **[info] declare**
>
> Use this for infomation messages.
```
# 声明一个字符串变量
declare my_var="Hello, world!"
# 声明一个只读变量
declare -r readonly_var="This variable is read-only"
# 声明一个整数变量
declare -i num=10
num=num+5  # 这里的值将会是 15，因为 num 被声明为整数类型，所以会进行数学运算
# 声明一个数组变量
declare -a my_array=(1 2 3 4 5)
# 声明一个环境变量
declare -x ENV_VAR="Environment variable"
```
>

### Array变量

array变量可以通过@和*引用
```
array=(0 1 2 3 4 5 6 7 8 9 0 a b c d e f g h)
$ echo ${array[@]:7}
7 8 9 0 a b c d e f g h
$ echo ${array[*]:7}
7 8 9 0 a b c d e f g h
$ echo array
0
$ echo ${array[2]}
2
```





## 拓展

### 括号拓展Brace Expansion

```
bash$ echo a{d,c,b}e
ade ace abe

mkdir /usr/local/src/bash/{old,new,dist,bugs}
```

### 命令拓展

命令 cmd 被执行，其输出结果被赋值给一个不可见的变量,然后插入到这个字符串中
- `$(cmd)`
- **\`cmd\`**

### 波浪拓展 Tilde Expansion

```
~：这表示当前用户的家目录路径，等同于 $HOME 变量的值。
~/foo：这表示当前用户的家目录下的 foo 子目录。
~fred/foo：这表示用户 fred 的家目录下的 foo 子目录。
~+/foo：这表示当前工作目录下的 foo 子目录，等同于当前目录的路径加上 foo。
~-/foo：这表示之前的工作目录（由 $OLDPWD 环境变量保存）下的 foo 子目录。如果 $OLDPWD 不存在，就使用 ~- 代替。
~N：这表示 dirs +N 命令中第 N 个目录路径。
~+N：这表示 dirs +N 命令中第 N 个目录路径。
~-N：这表示 dirs -N 命令中第 N 个目录路径。
```
注意和`dirs`,`popd`,`pushd`这几个参数联系起来

### 进程 Process Expansion

```
sort -n <(echo -e "3\n1\n5\n2\n4") > sorted_numbers.txt
```

### 单词拓展Word Splitting

Bash通过IFS变量来分词
```
# 定义一个包含逗号的变量
IFS=',' var="apple,banana,cherry"

# 对变量进行扩展，并输出结果
for word in $var; do
    echo "$word"
done
```

### 文件名拓展

如果变量名包含了`*`、`?`、`[]`三个参数，这个变量会被视为模式，会被用来匹配文件
- 默认匹配失败默认保持原值
- 可以设置GLOBIGNORE忽略匹配. ..项
```
# 将模式 ‘.*’ 添加到 GLOBIGNORE 变量中
GLOBIGNORE=.*
# 创建一些以 '.' 开头的文件和其他文件
touch .hidden_file .normal_file
# 使用通配符匹配文件名
files=*
# 对变量进行扩展，并输出结果
for file in $files; do
    echo "$file"
done
```

### 字符串拓展

```
cat << EOF
This is line 1.
This is line 2.
EOF

grep "pattern" <<< "This is a sample string."
```

## 重镜像

- `4<&1`:描述符4是1的副本
- `2>&1`:描述符2被定向到1
- `<>`:读写交互
- `awk '{print $0}' <(echo nihao)`:命令作为文件，建立管道

## 修改shell的行为
### set 

- -a：标记用于导出的被修改或创建的变量。
- -b：立即通知后台作业的完成。
- -e：如果命令以非零状态退出，则立即退出。
- -f：禁用文件名生成（通配符扩展）。
- -h：为 type 命令查找并记住函数名。
- -k：将所有关键字参数放置在命令的环境中。
- -m：监视模式。启用作业控制。
- -n：读取命令但不执行它们。用于语法检查。
- -p：打开特权模式。
- -t：读取并执行一个命令后退出。
- -u：在替换时将未设置的变量视为错误。
- -v：按照它们被读取的顺序打印 shell 输入行。
- -x：在执行时打印命令及其参数。
- -B：启用花括号扩展。
- -C：启用扩展模式匹配。
- -E：禁用反斜杠解释。
- -H：启用哈希机制。
- -P：禁用物理目录跟踪。
- -T：启用扩展属性处理。
- +：禁用指定的选项。

```bash
# 显示所有 shell 变量和函数
set
# 设置 shell 选项，如果命令以非零状态退出，则立即退出
set -e
# 禁用文件名生成（通配符扩展）
set +f
```

### shotp

- shopt -s nullglob：匹配失败移除
- shopt -s failglob:打印错误消息并且不执行命令
- shopt -s nocaseglob:忽略大小写
```bash
# 设置 nullglob 选项
shopt -s nullglob
# 假设没有匹配的文件
files=file*.txt
# files="file*.txt" 作用等同
# files='"file*.txt"' 无匹配
# 对变量进行扩展，并输出结果
for file in $files; do
    echo "$file"
done
```

## 进程调度

bg
fg
jobs
suspend 
&
kill
wait

## 命令行的艺术

- CTRL-a:调到结束
- CTRL-e:调到结尾
- CTRL-u：删除到开头
- CTRL-k：删除到结尾
- CTRL-w；删除到上一个单词开头
- CTRL-x：选中上一次修该
- CTRL-b:后退一个单词
- CTRL-f:前进一个单词
- CTRL-y:回退修改

命令行默认可以转换为vi和emas的编辑模式
- set -o emacs
- set -o vi

## Corprocess 协程

## read 命令
在 Bash 中，`read` 命令用于从标准输入读取一行数据，并将其分割成单词，然后分配给 shell 变量。这在编写需要用户输入的脚本时非常有用。

以下是一些使用 `read` 命令的基本示例：

1. 读取一整行文本到一个变量中

```bash
read line
echo "You entered: $line"
```

2. 同时读取多个输入值到不同的变量中

```bash
read name age
echo "Name: $name, Age: $age"
```

3. 使用 `-p` 选项来指定输入提示：

```bash
read -p "Enter your name: " name
echo "Hello, $name!"
```

4. 使用 `-a` 选项将输入的单词读入一个数组：

```bash
read -a array
echo "First element: ${array[0]}, Second element: ${array[1]}"
```

5. 使用 `-r` 选项来防止反斜杠转义：

```bash
read -r "password"
echo "Your password is: $password"
```

6. 读取文件中的每一行，并将它们逐行打印出来：

```bash
while IFS= read -r line
do
    echo "$line"
done < "filename.txt"
```

在这个循环中，`IFS=` 为了防止行首和行尾的空白字符被剥离，`-r` 防止反斜杠转义，`< "filename.txt"` 是一种将文件重定向到 `read` 命令的方法。

7. 从键盘读取输入，直到用户输入特定的结束标记：

```bash
echo "Enter lines, and end with a blank line:"
read -r line
while [ -n "$line" ]
do
    echo "You entered: $line"
    read -r line
done
echo "Done reading input."
```

在这个例子中，脚本会一直读取用户输入的行，直到用户输入一个空行。

`read` 命令非常灵活，可以根据不同的需要进行调整。在编写脚本时，合理使用 `read` 可以提高脚本的交互性和用户体验。