
## awk
awk命令式文件的行处理工具,基本的用法如下
```bash
awk 'pattern { action }' input_file
```
awk命令每次从文件中读取一行，根据内置变量FS将文件分割，分割的内容可以通过数字变量引用
```
awk '{print $1,$4}' log.txt # 默认分割符为空白符(空格、制表符等等)
awk -F, '{print $1,$4}' log.txt # 指定逗号分割
# 使用多个分隔符.先使用空格分割，然后对分割结果再使用","分割
$ awk -F '[ ,]'  '{print $1,$2,$5}'   log.txt
```
awk还可以设置数字变量和字符变量
```
awk -va=1 -vb=s '{print $1,$1+a,$1b}' log.txt
```
awk还可以过滤符合条件的行
```
$ awk '$1==2 {print $1,$3}' log.txt    #命令
```
## sed
sed -s 
sed -n 's/unix/linux/p' geekfile.txt # 在这个 sed 命令中，-n 选项用于关闭默认的打印行为，而 /p 标记则在替换成功时打印行。结合起来，这将只打印被替换的行，而不会打印未被替换的行。