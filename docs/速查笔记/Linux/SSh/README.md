## ssh-agent 
在`.bashrc`中添加下面的命令就可以启动`ssh-agent`,用`eval`的原因是需要设置环境变量
```bash
eval "ssh-agent -s"
## ssh-agent bash
```
如果`echo $SSH_AGENT_SOCK`有值就说明启动成功,可以通过下面的命令查看所有添加的密钥
```bash
ssh-add l 
```
如果报错,用`ssh-agent bash`解决
```
Could not open a connection to your authentication agent.
```