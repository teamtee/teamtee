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

`Ctrl-f/b`:跳转一页
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

`substitute/s` 替换命令，命令格式如下
> [位置]s/旧字符/新字符/[gc]`:g表示所有项，c表示询问每一项
> 位置：绝对位置(4，6)，相对位置(.-3,&-4),标记位置('<,'>,.m,$,%,^,)
```
:4,6s/old/new/g # 替换4-6行的内容
:%s/ld*c/ld/g #替换全文内容
:'<,'>s// #配合块模式使用
:.write file.txt:.表示当前光标位置
:.,$s/yes/no/
:45s
:4,5s
:.+3,$-5s
```
> 可以用加号+、等号= 替换/
```
:s+one/two+one or two+ 中，or
:?^Chapter?,/^Chapter/s=grey=gray=g
```
`help` 帮助命令
```
:help vimrc-intro
:help user-manual
```



### 列块模式(TODO)

I列编辑

A列添加

~切换大小写

U小写变大写

u大写变小写

\>右移动
:set shiftwidth=4
## 多文件编辑
你可以同时编辑多个文件，这些文件形成文件列表

`vim one.c two.c three.c`,编辑两个文件

或者使用下面的命令
```
:args 查看当前文件列表
:args five.c six.c seven.h 形成新的文件列表
:argadd 添加文件到文件列表
:argdel 
:next 下一个文件
:previous 上一个文件
:last 最后一个文件
:first 第一个文件
```
## 寄存器(TODO)
A会追加内容到寄存器a中，a表示覆盖,Y等于y$
"aY
"AY

## 标记mark
你可以使用标记来跳转，甚至包括跨越文件跳转

### 匿名mark
当你使用位置跳转时下面会自动记录你的位置，形成一条有序队列

`CTLR-I`：标记往前

`CTLR-O`：标记往后

下面是固定记录的匿名mark

`'`:跳转前光标位置

`"`:上一次编辑位置

`[`:Start of the last change

`]`:End of the last change


### 记名mark
`:marks` 查看所有记命mark

`ma`:标记名为a的mark

\`a:跳转到名为a的mark

`'a`:跳转到名为a的mark
## 窗口管理(TODO)

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

## 配置文件
:edit ~/.vimrc          这是 Unix 系统所使用的命令
:edit ~/_vimrc          这是 MS-Windows 系统所使用的命令
:r $VIMRUNTIME/vimrc_example.vim
:write

### 查看配置
:options
:set nowarp 自动折叠
:set sidescroll=10 设置边框滚动条？
:set list  查看tabs 
:syntax enable 语法检查
:syntax off 
:set background=dark 设置背景
:colorscheme evening
:set autowrite 自动保存
:set noautowrite
:set backup 备份文件
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

## 拓展
### 如何让Vim和Linux共用剪切板+clipboard
参考[教程](https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim)

`Vim` 需要`+clipboard`功能标志才能使这些功能发挥作用,你可以通过在 `Vim` 中使用`:echo has('clipboard')`来检查你的 Vim 是否有这个功能，返回1表示有，如果没有，请安装

- Debian 和 Ubuntu:安装vim-gtk3.
- Fedora:安装vim-X11并运行vimx（vim更多信息）。
- Arch Linux:安装gvim（这也将+clipboard正常启用）

基于X11的系统通常有两个剪切板(比如Linux)
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
### c语言跳转-ctags自动建立记名跳转 (TODO)