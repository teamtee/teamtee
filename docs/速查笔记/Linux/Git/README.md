# Git
这里有一份官方[教程](https://git-scm.com/book/zh/v2/)
## 基本概念
### 工作区、暂存区、仓库

### 提交的名字
一次提交有三种类型的名字：哈希名(真名)、分支名、Tag名
![alt text](image.png)
## 基础用法
- 修改提交
```bash
git add .
git commit -m " "
git push
```
- 覆盖上一次提交
```bash
git add .
git commit --amend -m ""
git push --force
git log
```

- 拉取并解决冲突
```bash
git fetch
git merge orgin/main
git merge abort //合并失败，恢复原状
```
- 
- 设置

```bash
git config --global core.editor emacs
git config --global --list
git config --list --show-origin
git config --global https.proxy https://localhost:7890
git config --global http.proxy http://localhost:7890
```
- 查看状态
```bash
git status -s
git status 
git log --oneline --decorate --graph --all
```
- 切换分支
```bash
git checkout <branch>
git checkout - //返回上一次分支
```
- 撤销文件修改
```bash
git checkout -- <file_path> //修改工作区
git checkout <branch> -- <file_path>  //修改工作区
git restore  <file_path> //修改工作区
git restore --source=HEAD <file_path> //修改工作区
git reset <branch> <file_path> //撤销暂存区修改
```
- 移动HEAD指针
```bash
git reset --soft <commit_hash> //不修改工作区、暂存区
git reset --mixed <commit_hash> //不修改工作区，修改暂存区
git reset --hard <commit_hash> //修改工作区，修改暂存区
```
- tag
```bash
git tag
git tag -l "1.8.5"
git tag -a v1.4 -m "my version 1.4"
git tag -a v1.2 9fceb02
git tag -d v1.4 
git push origin --tags // tag必须主动push
```
- 分支管理
```bash
git checkout -b <commit_hash>

```
- 修改原程

```bash
git remote set-head origin branchA
git remote set-head origin -d
```
## 使用技巧

### .gitignore
.gitignore 的格式规范如下：
```
所有空行或者以 # 开头的行都会被 Git 忽略。

可以使用标准的 glob 模式匹配，它会递归地应用在整个工作区中。

匹配模式可以以（/）开头防止递归。

匹配模式可以以（/）结尾指定目录。

要忽略指定模式以外的文件或目录，可以在模式前加上叹号（!）取反
```
`glob` 模式是指 `shell` 所使用的简化了的正则表达式。 支持`*`，`？`，`[abc]`,`[a-z]`星号。 使用两个星号`**`表示匹配任意中间目录。
### 分支指代

HEAD～

### resotre
git restore --sourece --staged --worktree file
### 分支合并(TODO) --continue --abort
分支合并有`merge`和`rebase`方法,`git pull`时会自动调用`git merge`,`git merge`首次要求设定`ff`或者`rebase`的配置值。
```
git stash
git pull
git stash pop
```