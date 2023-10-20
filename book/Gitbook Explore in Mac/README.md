# [Mac] Gitbook in Mac
&emsp;&emsp;最近一直在思考如何学习 ，其中很重要的一环是输出。我曾经使用过语雀、思云等等，尽管它们功能丰富并且支持云端，但是对于像一本书一样阅读，这样的要求是达不到的，因此我选择了Gitbook + Githubpages
# 一、简介

&emsp;&emsp;`Gitbook`有网页版和本地版两种，网页版的功能感觉和语雀等类似，因此我选择本地版。你可以将本地版`Gitbook`（以下简称`Gitbook`）认为是一个工具链，这个工具链依赖于`Node.js`和`npm`。在`mac`的教程如下，`windos`还未尝试
## 1.安装
### brew
&emsp;&emsp;`mac` 下需要先安装开发者工具 `brew` , `brew` 是一个类似 `apt` 、`yum`的包管理工具


    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
    
&emsp;安装完后命令行输入 `brew` 检查是否成功安装

    brew
    
### npm

&emsp;&emsp;安装完 `brew` 后利用 `brew` 安装 `npm`，`npm` 是一个 `Node.js` 的包管理工具。我们需要用它来安装 `gitbook` 。
    
    brew install npm 
    
&emsp;&emsp;输入 `npm -v` 检查是否安装成功

    
### nvm
&emsp;&emsp; `nvm` 也是 `Node.js` 的版本管理工具，类似 `Python` 里面的 `conda` 。我们需要用它来管理 `Node.js` 的版本。

    brew install  nvm
    

&emsp;&emsp;输入 `nvm -v` 检查是否安装成功


### gitbook

&emsp;&emsp;使用 `brew` 安装 `gitbook`. `-g` 选项的意思安装在全局，否则默认为安装在用户下。

    brew install gitbook-cli -g
    
## 2.使用

&emsp;&emsp;选择一个你希望的空文件夹，初始化工作目录

```
# 初始化工作目录会生成 README.md 和 SUMMARY.md
gitbook init
``` 
    
&emsp;&emsp;可能会出现的报错，如下
```
Installing GitBook 3.2.3
 /opt/homebrew/lib/node_modules/gitbook-cli/node_modules/npm/node_modules/graceful-fs/polyfills.js:287
      if (cb) cb.apply(this, arguments)
                 ^
TypeError: cb.apply is not a function
    at /opt/homebrew/lib/node_modules/gitbook-cli/node_modules/npm/node_modules/graceful-fs/polyfills.js:287:18
    at FSReqCallback.oncomplete (node:fs:200:5)
Node.js v21.0.0
```

&emsp;&emsp;这是因为 Node.js 的版本不符合 gitbook 的依赖，下面有三个可能的解决方法

* 使用

* 

```    
# 构建工作会默认在 _book 下生成文件
gitbook build
# 服务器会构建本地端口映射
gitbook serve
```