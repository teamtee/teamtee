# Vim

## 配置文件
.vimrc
## ctags 
## 寄存器
## 标签

## 参数列表


## 拓展
### 如何让Vim和Linux共用剪切板
实测安装vim-gtk3后vim匿名寄存器直接变为系统剪切板
### +clipboard
参考[教程](https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim)

`Vim` 需要`+clipboard`功能标志才能使这些功能发挥作用,你可以通过在 `Vim` 中使用`:echo has('clipboard')`来检查你的 Vim 是否有这个功能，返回1表示有，如果没有，请安装

- Debian 和 Ubuntu：安装vim-gtk3.
- Fedora：安装vim-X11并运行vimx（vim更多信息）。
- Arch Linux：安装gvim（这也将+clipboard正常启用）

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
