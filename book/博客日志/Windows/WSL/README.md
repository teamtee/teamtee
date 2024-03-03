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
