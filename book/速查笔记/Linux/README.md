
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
## 查看glibc版本

### 更新Glibc
locate libc.so.6
#### 安装编译新的版本
```
wget -c https://ftp.gnu.org/gnu/glibc/glibc-2.29.tar.gz
tar -zxvf glibc-2.29.tar.gz
mkdir glibc-2.29/build
cd glibc-2.29/build
../configure --prefix=路径
make 
make install
```
#### 更新路径文件
下面添加上面安装的路径
```
/etc/ld.so.cache
/etc/ld.so.conf
/etc/ld.so.conf.d/
```
#### 更新配置
更新/etc/ld.so.cache
```
sudo ldconfig  更新配置
ldconfig -v 查看配置
ldconfig -p 查看缓存
```
#### 配置文件
```
/etc/ld.so.cache
/etc/ld.so.conf
/etc/ld.so.conf.d/
```


## wget 

wget [url] --user-agent="Mozilla/5.0 (X11;U;Linux i686;en-US;rv:1.9.0.3) Geco/2008092416 Firefox/3.0.3" --no-check-certificate