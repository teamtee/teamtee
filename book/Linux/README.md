
## Linux 剪切板

基于X11的系统通常有两个剪切板
- PRIMARY - 鼠标选择复制和粘贴(鼠标中键或右键菜单可复制）
- SECOND (几乎废弃）
- CLIPBOARD - `CRTL-c/v` 选择复制和粘贴
不过似乎我的电脑键盘和鼠标共用一个剪切板，当然你也可以编辑设置


你可以通过`xclip`或则`Xsel`和剪切板通信

### xclip

xclip的用法很简单，支持复制文件,支持选择剪切板,支持管道
```
xclip filename
xclip -sel clipboard
xclip -select primary
echo "fs" | xclip
```
