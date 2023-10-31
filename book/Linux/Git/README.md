# Git
这里有一份官方[教程](https://git-scm.com/book/zh/v2/)

## 基本命令

### 配置
常用配置
```
git config --global core.editor emacs
```
### 基础
```
git status -s
git rm --cached README
git rm 
git mv file_from file_to
git commit --amend

# 
git remote add pb https://github.com/paulboone/ticgit
git tag
git tag -l "v1.8.5*"
```
### 查看

```
git log --oneline --decorate --graph --all
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
--
HEAD～

### reset和checkout 
分支层面
```
git reset --soft HEAD (移动HEAD和分支）
git reset HEAD （移动HEAD和分支，修改暂存区）
git reset --hard HEAD （移动HEAD和分支，修改暂存区，工作区）（⚠️）
git checkout HEAD （移动HEAD，修改暂存区，工作区）
```
文件层面
```
git reset HEAD file （修改暂存区）
git checkout HEAD file （修改暂存区，工作区） （⚠️）
```
### 分支合并

分支合并有`merge`和`rebase`方法,`git pull`时会自动调用`git merge`,`git merge`首次要求设定`ff`或者`rebase`的配置值。
```
git stash
git pull
git stash pop
```

```
git checkout -b branchA
git add .
git commit -m ""
git checkout main
git reset --hard 
git pull
git rebase main branchA
```


### 标签（TODO）

## 有趣命令

### 修改远程HEAD
```
git remote set-head origin branchA
git remote set-head origin -d
```