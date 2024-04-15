## [正则表达式的流派](https://www.infoq.cn/article/regular-expressions-introduction-part01)
### POSIX流派

POSIX 是一系列规范，定义了 UNIX 操作系统应当支持的功能，其中也包括正则表达式的规范
- BRE(Basic Regular Expression 基本正则表达式)
- ERE(Extended Regular Express 扩展正则表达式)

后来随着 BRE 与 ERE 逐渐相互融合，现在的 BRE 和 ERE（包括 GNU 改进的 GNU BRE 和 GNU ERE）在功能特性上并没有太大区别，主要的差异是在元字符的转义上,现在的支持更高基本的正则表达式被称为
- MRE(Modern Regular Expressions, MRE)

### PCRE流派

1988 年 6 月，Larry Wall 开发的 Perl 语言发布第 2 版，其中所引入的正则表达式引擎大放异彩。Perl 2 的正则表达式引擎源于 Henry Spencer 编写的 regex 的增强版。之后不断改进，影响越来越大。于是在此基础上，1997 年又诞生了 pcre ——Perl 兼容正则表达式 (Perl Compatible Regular Expressions)。

Perl 系、Java 系、.Net 系、Python 系、JavaScript 系(另外还有Ruby、C++Builder、Delphi 等) 均属于PCRE 流派，但与Perl 的兼容性(即兼容程度) 各有不同
##
正则表达式是用状态机实现的，通常而言都是贪婪匹配

## 通配符

## 次数控制
* 任意次数
+ 一次以上
{m} m次
{m,n} m-n次数




### Bash正则表达式(PAttrn Match)
- *：匹配任意字符
- ？：匹配单个字符
- [...]：匹配任意包含的字符，如果第一个字符是^或者!,取反


`[:class:]` 支持下面的类
```
alnum   alpha   ascii   blank   cntrl   digit   graph   lower
print   punct   space   upper   word    xdigit
```


在默认的C语言环境中，`'[a-dx-z]'` 相当于 `'[abcdxyz]'`,许多语言环境按字典顺序对字符进行排序，并且在这些语言环境中 `'[a-dx-z]'` 通常不等于 `'[abcdxyz]'`;它可能相当于`'[aBbCcDdxYyZz]'`

想要获得`C`的风格，可以设置`LC_COLLATE或者LC_ALL`为`'c'`,或者使能`globasciiranges`这个`shell`选项.


如果`extglob`选择被打开,可以支持

1. **`?(pattern-list)`**：匹配零个或一个出现的给定模式列表中的模式。
   - 示例：假设你想匹配文件名中包含或不包含数字的文件。你可以使用 `?(pattern-list)` 操作符。
     ```
     ls file?(1).txt
     ```
     这将匹配 `file.txt` 或 `file1.txt`。

2. **`*(pattern-list)`**：匹配零个或多个出现的给定模式列表中的模式。
   - 示例：假设你有一组文件，它们的文件名以 `image` 开头，然后可能跟着一个或多个数字，最后以 `.png` 结尾。你可以使用 `*(pattern-list)` 操作符来匹配这些文件名。
     ```
     ls image*.png
     ```
     这将匹配 `image.png`，`image1.png`，`image123.png` 等文件。

3. **`+(pattern-list)`**：匹配一个或多个出现的给定模式列表中的模式。
   - 示例：假设你有一组文件，它们的文件名以 `data` 开头，然后跟着一个或多个字母。你可以使用 `+(pattern-list)` 操作符来匹配这些文件名。
     ```
     ls data+([a-z]).txt
     ```
     这将匹配 `data.txt`，`dataA.txt`，`dataABC.txt` 等文件。

4. **`@(pattern-list)`**：匹配给定模式列表中的一个模式。
   - 示例：假设你有两个文件，一个是 `file1.txt`，另一个是 `file2.txt`。你可以使用 `@(pattern-list)` 操作符来匹配其中一个文件。
     ```
     ls file@(1|2).txt
     ```
     这将匹配 `file1.txt` 或 `file2.txt`。

5. **`!(pattern-list)`**：匹配除了给定模式列表中的模式之外的任何内容。
   - 示例：假设你有一组文件，其中有一些以数字开头，你想匹配除了以数字开头的文件之外的所有文件。
     ```
     ls !(file[0-9]*)
     ```
     这将匹配除了以数字开头的文件之外的所有文件。



1. **`${parameter^pattern}`**：
   - 这个操作符将匹配 `pattern` 的第一个字符的大小写进行转换：将匹配的小写字母转换为大写字母。
   - 示例：`${var^}` 将会将 `var` 中第一个字母转换为大写字母。

2. **`${parameter^^pattern}`**：
   - 这个操作符将匹配 `pattern` 的所有字符的大小写进行转换：将匹配的小写字母转换为大写字母。
   - 示例：`${var^^}` 将会将 `var` 中所有字母转换为大写字母。

3. **`${parameter,pattern}`**：
   - 这个操作符将匹配 `pattern` 的第一个字符的大小写进行转换：将匹配的大写字母转换为小写字母。
   - 示例：`${var,}` 将会将 `var` 中第一个字母转换为小写字母。

4. **`${parameter,,pattern}`**：
   - 这个操作符将匹配 `pattern` 的所有字符的大小写进行转换：将匹配的大写字母转换为小写字母。
   - 示例：`${var,,}` 将会将 `var` 中所有字母转换为小写字母。

在这些操作符中，`pattern` 是一个用于匹配字符的模式，类似于通配符或正则表达式。如果省略了 `pattern`，则会默认匹配每个字符，类似于通配符 `?` 的行为。