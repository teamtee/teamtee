# Vim
在命令行中输入vimtutor可以进入教程(目前进度user_10)
## 模式
vim有下面几种模式

`普通模式`:默认的模式面板，可以使用一些快捷命令
`命令模式`:在普通模式输入`:`进入，按下`Esc`退出
`编辑模式`:在普通模式中输入`i、o、c、a`均可进入,按下`Esc`退出
`块/列块模式`:在普通模式输入`v/CTRL-v`进入块/列块模式,按下`Esc`退出


### 普通模式
普通模式下可以使用这些命令
#### 编辑命令
`d`:删除命令，命令格式为`d+位置`（dw，de，dd，d2w)

`y`:复制命令，命令格式为`y+位置`(yw,ye,yy)

`p`:粘贴命令

`u`:撤销命令，撤销上次修改

`C-R`:恢复命令，恢复上次的撤销

`x`:字母剪切命令

`r`:字母替换命令

`R`:持续替换命令
#### 位置跳转
`w`:单词头

`e`:单词尾

`$`:句子结尾

`^`:句子开头

`gg`:文章开头

`G`:文章结尾

`%`:配对符号跳转

`[[`:按照C语言特性跳转到当前函数开头

`]]`:按照C语言特性跳转到当前函数结尾

`]c/[c`:跳转到上次修改的地方

`</>`:行内位置跳转
#### 编辑模式:
`i`:直接输入

`c`:纠删输入

`o`:下新行输入

`O`:上新行输入

`a`:前输入

`A`:后输入
#### 查找命令

按下`/`全文查找，按下`？`下文查找，回车确认，`n`跳转到下一个查找，`N`跳转到上一个,下面是查找相关的配置
```
:set ic # 忽略大小写 
:set noic # 
:set hls is # 设置high light search
:nohlsearch 
:hls
:set incsearch # 不知道有什么用
```
### 命令模式

#### 文件命令
`:edit`:编辑命令
`:edit *.txt`:编辑命令
`:write one.txt`:写入命令
`:file main.c`:重命名命令
`:saveas` :编辑命令
`:w`保存命令
`:q`退出命令
`:!`执行外部命令
`:read file.txt`:读取文件
`:0read file.txt`:读取第一行
#### 编辑命令

:substitute
```
`:[位置]s/旧字符/新字符/[gc]`:g表示所有项，c表示询问每一项
:4,6s/old/new/g # 替换4-6行的内容
:%s/ld*c/ld/g #替换全文内容
:'<,'>s// #配合块模式使用

.表示当前光标位置

:.write file.txt
:.,$s/yes/no/
:45s
:4,5s
:s+one/two+one or two+ 中，or
:?^Chapter?,/^Chapter/s=grey=gray=g
:.+3,$-5s
```
:help
```
:help vimrc-intro
:help user-manual
ctrl-d/TAB 提示补全
`:set nocp`设置补全功能
```

#### 窗口命令

新建立
vim -o/O 1.txt 2.txt

vimdiff main.c~ main.c

CTLR-w:在窗口间跳转

4CTLR-w +/-:改变大小

CTRL-h/i/j/k:

CTRL-t/b:

:split

:split two.c

:vsplit

:close

:only

:new

:vertical new

:qall

:wall

### 列块模式

I列编辑

A列添加

~切换大小写

U小写变大写

u大写变小写

\>右移动
:set shiftwidth=4
## 多文件编辑

### 标记mark
`CTLR-i`:跳转到新位置

`CTLR-o`:跳转到旧位置

`:marks` 查看所有mark
##### 匿名mark
当你使用位置跳转时下面会自动记录你的位置

`'`:The cursor position before doing a jump

`"`:The cursor position when last editing the file

`[`:Start of the last change

`]`:End of the last change
##### 记名mark
`ma`:标记名为a的mark

\`a:跳转到名为a的mark

`'a`:跳转到名为a的mark
### 文件列表
vim one.c two.c three.c

:args
:args five.c six.c seven.h
:argadd
:argdel 
:next
:previous
:last
:first

:set autowrite
:set noautowrite

## 配置文件
:edit ~/.vimrc          这是 Unix 系统所使用的命令
:edit ~/_vimrc          这是 MS-Windows 系统所使用的命令
:r $VIMRUNTIME/vimrc_example.vim
:write

### 查看配置
:options
:set nowarp
:set sidescroll=10
:set list  查看tabs
:syntax enable
:syntax off
:set background=dark
:colorscheme evening
### 编辑配置
:set autowrite
:set noautowrite
:set backup
:set backupext=.bak
## 包
mkdir -p ~/.vim/pack/fancy    
在.vimrc中加入
packadd! matchit
## 插件
插件位置
```
system          plugin directory
Unix            ~/.vim/plugin/
PC              $HOME/vimfiles/plugin or $VIM/vimfiles/plugin
Amiga           s:vimfiles/plugin
Macintosh       $VIM:vimfiles:plugin
Mac OS X        ~/.vim/plugin/
```
###



## ctags 

## 寄存器
A会追加内容到寄存器a中，a表示覆盖,Y等于y$
"aY
"AY
## 标签

## 参数列表


## 拓展
### 如何让Vim和Linux共用剪切板
实测安装vim-gtk3后vim匿名寄存器直接变为系统剪切板
### +clipboard
参考[教程](https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim)

`Vim` 需要`+clipboard`功能标志才能使这些功能发挥作用,你可以通过在 `Vim` 中使用`:echo has('clipboard')`来检查你的 Vim 是否有这个功能，返回1表示有，如果没有，请安装

- Debian 和 Ubuntu:安装vim-gtk3.
- Fedora:安装vim-X11并运行vimx（vim更多信息）。
- Arch Linux:安装gvim（这也将+clipboard正常启用）

基于X11的系统通常有两个剪切板
- PRIMARY - 鼠标选择复制和粘贴
- CLIPBOARD - `CRTL-c/v` 选择复制和粘贴

Vim同样有两个特殊的寄存器和这两个剪切板相关联
- `*` - PRIMARY
- `+` - CLIPBOARD

对于`Windows`和`OS X`系统而言只有一个剪切板,所以这两个没有区别

你可以直接使用这两个寄存器
- `"*yy`
- `"*p`
你可以重新设置匿名寄存器
```
set clipboard=unnamed
set clipboard=unnamedplus
```
当然你也可以重新映射快捷键
```
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
```



vim -R 1.txt    
vim -M 1.txt
:set modifiable
:set write