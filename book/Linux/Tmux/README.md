# Tmux

这里是一份[教程](https://github.com/tmux/tmux/wiki/Getting-Started),可以参考。

## 基本概念
从服务的角度：`server` - `client`

`tmux`有一个`server`管理多个`client`，每个`client`和一个`session`连接,用户启动`tmux`的时候实际上是启动一个`client`连接到`server`。`client`是伪终端，进程实际由`server`管理,当用户断开连接后，运行在`client`中的进程不会被中断。

从显示的角度：`session` - `windows` - `pane(terminal)`

每个`session`可以与零个或者多个`client`相连接，每个`session`的命名必须唯一。每个`session`管理多个`windos`,`windows`的命名可以重复，可以连接一个或者多个`session`，`windows`内有多个`pane`,其中有一个为活跃的`pane`

当所有的`session`中的所有进程终止的时候`server`终止

## 命令模式

`PREFIX` 默认为`CTRL-b`,按下`PREFIX b :`进入命令模式，按下`PREFIX b ?`查看所有命令,按下`PREFIX b /`查看单个命令

## `Tree` 模式

### `session`
`Tmux`有一个模式叫树模式，在`Tmux`中按下`PREFIX b s`或者`PREFIX b w`进入，前者显示当前附着的`session`的情况，后者显示所有`session`的情况，还可以通过`:choose-tree`进入。进入后屏幕分为上部分树和下部分预览。

树模式下可以按下`t`标记，`T`取消所有标记，`x`删除当前项，`X`删除所有标记项目，也可以用`:`使用命令对所有的标记项操作。`r`可以反向排序,`v`可以取消预览。

### `client`

`Tmux`也有关于`client`的树模式，按下`PREFIX b D`进入，可以看到当前活跃的`client`以及和哪一个`session`相连接。

## 基本使用
### 创建`client`
`tmux ls`: 列出所有的`session`

`tmux`: 默认会创建一个`client`和一个`session`,等同于`tmux new`

`tmux -t session_name`: 创建一个`client`同时连接`session`

### 创建`session`
`tmux new`：创建一个默认的名为`index`的`session`（即为名字就是序号)

`tmux new -syourname`: 指定名字为`yourname`
### 创建`windows`
`:neww`: 创建默认窗口，名字为通常为`bash`

`:neww -nyourname`: 创建窗口同时命名

`:neww -t999`: 创建窗口同时指定序号为`999`

`:neww top`: 创建窗口同时命名和执行改命令`top`

### 切换`windows`

`PREFIX b [0-9]`: 切换窗口为序号`[0-9]`

`PREFIX b '`: 输入序号然后切换到序号窗口

`PREFIX b p`: 切换到前窗口

`PREFIX b n`: 切换到后窗口


### 创建`panes`
`PREFIX b %`： 垂直分割

`PREFIX b "`: 水平分割

### 切换`panes`

`PREFIX b {`: 当前`pane`和上边`pane`交换位置

`PREFIX b }`: 当前`pane‵和下边`pane`交换位置

`PREFIX b up/down/right/left`: 切换当前聚焦的`pane`

### 修改`pane`的大小

`PREFIX b PREFIX up/down/right/left`：上下左右微调

`PREFIX b M-up/down/right/left`： 上下左右大调

`PREFIX b M-1/2/3/4/5`: 调整布局格式

### 删除

`PREFIX b &`: 删除当前`session`

`PREFIX b x`: 删除当前`panes`

### 复制和粘贴
`PREFIX b [`: 进入复制模式/滚轮模式，复制模式下会冻结输出

&emsp;&emsp;`PREFIX space`:开始选取复制

&emsp;&emsp;`PREFIX w`:结束复制

&emsp;&emsp;`q`: 退出复制

`PREFIX b ]`: 粘贴上一次复制的文本

`PREFIX b =`: 选择要粘贴的文本


### 其他

`:set -g mouse on`: 支持鼠标

## Tmux配置文件（TODO）

## Tmux插件
可以安装`tpm`来管理和安装插件
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
在配置文件内写入`~/.tmux.conf`
```
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```
在tmux中使用`PREFIX b I`即可安装

### tmux-resurrect 自动保存会话
[教程](https://zhuanlan.zhihu.com/p/146544540)
配置文件
```
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
​
set -g @continuum-save-interval '15'
set -g @continuum-restore 'on'
set -g @resurrect-capture-pane-contents 'on'
​
# Other config ...
​
run -b '~/.tmux/plugins/tpm/tpm'
```
快捷键
```
PREFIX + CTRL s：保存会话
PREFIX + CTRL r：加载会话
```
### tmux-yank 和系统剪切板共用
```
set -g @plugin 'tmux-plugins/tmux-yank
```