在windows里面默认安装了openssh

## Git中的SSH:为什么Powershell中的Git clone检测不到密钥文件
当你使用下面的命令时,GIT会使用ssh命令来登录Github网站，必须有ssh-agent管理的秘钥来验证
```
git clone git@github.com:teamtee/teamtee.git
```
但是Git-bash通常使用的是MINGW64的ssh，Powershell/CMD使用的是Windows自带的openssh下的ssh,见[链接](https://blog.brian.pub/blog/openssh-on-windows.html)
而windows默认启动的openssh里面的ssh-agent的服务,可以通过修改配置文件.gitconf
```
git config --global core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe
```

