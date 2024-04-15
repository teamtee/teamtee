配置文件%USERPROFILE%\.wslconfig

## wsl: 检测到 localhost 代理配置，但未镜像到 WSL。NAT 模式下的 WSL 不支持 localhost 代理。

在配置文件中添加,参考(链接)[https://github.com/microsoft/WSL/releases/tag/2.0.0]
```
[experimental]
autoMemoryReclaim=gradual  
networkingMode=mirrored
dnsTunneling=true
firewall=true
autoProxy=true
```

## 配置ssh-agnet的问题

```bash
eval "ssh-agent"
ssh-add ~/.ssh/github
```
上面的代码会报错
```bash
Could not open a connection to your authentication agent
```

```bash
eval "ssh-agent bash"
ssh-add ~/.ssh/github
```
上面的代码会报错,但是如果不再.bashrc中添加，在启动后的命令行直接输入就没有问题
```bash
bash: warning: shell level (1000) too high, resetting to 1
```