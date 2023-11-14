# [Mac] Gitbook in Mac
最近一直在思考如何学习 ，其中很重要的一环是输出。我曾经使用过语雀、思云等等，尽管它们功能丰富并且支持云端，但是对于像一本书一样阅读，这样的要求是达不到的，因此我选择了Gitbook + Githubpages
# 一、简单使用

`Gitbook`有网页版和本地版两种，网页版的功能感觉和语雀等类似，因此我选择本地版。你可以将本地版`Gitbook`（以下简称`Gitbook`）认为是一个工具链，这个工具链依赖于`Node.js`和`npm`。在`mac`的教程如下，`windos`还未尝试
## 1.安装
### brew
在`mac`下需要先安装开发者工具`brew`,`brew`是一个类似`apt`、`yum`的包管理工具

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
```
安装完后命令行输入`brew`检查是否成功安装


    
### npm

安装完`brew`后利用`brew`安装`npm`，`npm`是一个`Node.js`的包管理工具。我们需要用它来安装`gitbook`。
```
brew install npm 
```  
输入`npm -v`检查是否安装成功

    
### nvm
`nvm`也是`Node.js`的版本管理工具，类似`Python`里面的`conda`。我们需要用它来管理`Node.js`的版本。
```
brew install  nvm 
```
输入`nvm -v`检查是否安装成功


### gitbook

使用`brew`安装`gitbook`.`-g`选项的意思安装在全局，否则默认为安装在用户下。

    brew install gitbook-cli -g
    
## 2.使用

### 初始化
选择一个你希望的空文件夹，初始化工作目录

```
# 初始化工作目录会生成 README.md 和 SUMMARY.md
gitbook init
# 构建工作会默认在 _book 下生成文件
gitbook build
# 服务器会构建本地端口映射
gitbook serve
```
    
执行`gitbook init`可能会出现的报错，如下
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

这是因为 Node.js 的版本不符合 gitbook 的依赖，下面有三个可能的解决方法（推荐三）

* 注释`polyfills.js`文件中的这三行
```
fs.stat = statFix(fs.stat)
fs.fstat = statFix(fs.fstat)
fs.lstat = statFix(fs.lstat)
```

* 升级`graceful-fs`
```
# 下面的路径换成你的，--save 的意思是安装在当前的本地，即为更新当前的 graceful-fs
cd /opt/homebrew/lib/node_modules/gitbook-cli/node_modules/npm/node_modules/
npm install graceful-fs@latest --save
```   

* 通过`nvm`来暂时降低`Node.js`版本
```
nvm -v
```
可能输出如下,箭头为当前的使用版本
```
$:nvm ls   
        v21.0.0
->        system
default -> node (-> v21.0.0)
iojs -> N/A (default)
unstable -> N/A (default)
node -> stable (-> v21.0.0) (default)
stable -> 21.0 (-> v21.0.0) (default)
lts/* -> lts/hydrogen (-> N/A)
lts/argon -> v4.9.1 (-> N/A)
lts/boron -> v6.17.1 (-> N/A)
lts/carbon -> v8.17.0 (-> N/A)
lts/dubnium -> v10.24.1
lts/erbium -> v12.22.12 (-> N/A)
lts/fermium -> v14.21.3 (-> N/A)
lts/gallium -> v16.20.2 (-> N/A)
lts/hydrogen -> v18.18.2 (-> N/A)
```
我们需要安装`10.24.1`的版本,注意该段命令会只是会将当前的`shell`下的`Node.js`切换成`10.24.1`。
```
#Install a specific version number
nvm install 10.24.1       
#Use the latest available 8.0.x              
nvm use 10.21.1                        
```




# 二、入门进阶

## 1.配置文件

### SUMMERY.md

一份参考文件如下，这个文件的内容会被用来生成大纲。

*`[]()`的超链接用来表示标题，
*`----`会生成分隔符
*`# Summary`的不是必要的，也不会被显示
*`## Chapter1`会被显示，但是不如超链接好用，一般只用超链接
```
# Summary

## Chapter1
* [Part I](part1/README.md)
    * [Writing is nice](part1/README.md#writing)
    * [GitBook is nice](part1/README.md#gitbook)

* [Part II](part2/README.md)
    * [We love feedback](part2/README.md#feedback)
    * [Better tools for authors](part2/README.md#tools)

----

* [Last part without title](part3/title.md)

```

### book.json

你可以新建一个`book.json`的配置文件，参考内容如下
```
{
    
    "title": "title",
    "description": "description",
    "isbn": "isbn",
    "author": "author",
    "lang": "zh-cn",
    "plugins": [],
    "variables": {
         
    }
}
```

你可以修改`plugins`来加入插件,`search`插件支持中文搜索，`code`插件支持复制,`-`的意思是不使用该插件，需要使用可以去掉前面的`-`
```
plugins": ['code','-seacrh']
```
然后利用`gitbook install`来安装上面的插件
```
gitbook install 
```
插件可以配置属性
```
pluginsConfig: {
    "flexible-alerts": {
      style: "flat" // callout 或 flat
    }
  }
```
## 2.插件推荐

[菜单折叠插件](https://www.npmjs.com/package/gitbook-plugin-expandable-chapters)
```
{
  plugins: ['expandable-chapters'];
}
```
[返回顶部插件](https://www.npmjs.com/package/gitbook-plugin-back-to-top-button)

```
{
  plugins: ['back-to-top-button'];
}
```
[引用插件](https://www.npmjs.com/package/gitbook-plugin-flexible-alerts)
这里有个[教程](https://www.zhaowenyu.com/gitbook-doc/plugins/cat-words-emphasize.html)
```
{
  plugins: ['flexible-alerts'];
  pluginsConfig: {
    "flexible-alerts": {
      style: "flat" // callout 或 flat
    }
  }
}
```
引用插件语法
```
> [!NOTE]
> Information the user should notice even if skimming.


> [!TIP]
> Optional information to help a user be more successful.


（这个似乎无效）
> [!IMPORTANT]
> Essential information required for user success.

（这个似乎无效）
> [!CAUTION]
> Negative potential consequences of an action.


> [!WARNING]
> Dangerous certain consequences of an action.
```
> [!NOTE]
> Information the user should notice even if skimming.

分隔符

> [!TIP]
> Optional information to help a user be more successful.

分隔符

> [!WARNING]
> Dangerous certain consequences of an action.


拓展玩法：自定义引用
有关图标可以在这里[寻找](https://fontawesome.com/icons/download?f=classic&s=thin)
```
//自定义类型，className可能有info,warning,tip,note
   pluginsConfig: {
    "flexible-alerts": {
      style: "flat" // callout 或 flat
      "comment": {
        "label": "Comment",
        "icon": "fa fa-comments",
        "className": "info"
      }
    }
  }    

```
> [!Comment]
> Dangerous certain consequences of an action.

[数学插件](https://github.com/GitbookIO/plugin-mathjax)

`mathjax`有问题，总是安装不了，无意间发现了`katex`可以直接安装
```
{
    "plugins": ["katex"]
}
```
# 三、深入探索
##  Github Pages
在`github`上新建一个仓库，新建个`gh-page`分支，在`github`设置支持静态网页的`pages`。然后我们可以将这个仓库克隆下来，初始化`gitbook`。不过值得注意的是`github`只是支持选择`/`和`/docs`这两个路径作为网页根目录。因此我们选择`/docs`，这样的话适合`gitbook`.

调整`gitbook`仓库的目录如下,根路径下的`README.md`作为仓库的说明，`book`下的`README.md`作为书籍首页的说明。`book`可以修改为你喜欢的名字。
```
.
├── README.md
├── book
│   ├── README.md
│   ├── SUMMARY.md
│   ├── book.json
└── docs
```
同时我们需要修改`gitbook`命令参数，可以尝试执行如下命令
```
# 安装book下book.json的插件
gitbook install book
# gitbook build src dest
gitbook build book docs
# gitbook serve src dest
gitbook serve book docs
```
执行后的示例目录
```
.
├── README.md
├── bash.sh
├── book
│   ├── Gitbook Explore in Mac
│   ├── How to write markdown elegantly
│   ├── README.md
│   ├── SUMMARY.md
│   ├── book.json
│   └── node_modules
└── docs
    ├── Gitbook Explore in Mac
    ├── How to write markdown elegantly
    ├── gitbook
    ├── index.html
    ├── search_index.json
    └── search_plus_index.json
```
##  自动化脚本

我构建的一份自动更新上传脚本如下，前两行是为了在`bash`中使用`nvm`
```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # 加载 nvm
nvm use 10
gitbook install book
gitbook build book docs
git add . 
git commit -m "Update"
git push
gitbook serve book docs
```
##  输出文档

## 问题合集

###  gitbook install 出问题
使用下面的替代
```
npm install gitbook-plugin-*
gitbook install 
```

# 参考链接
[官方下载和安装文档](https://github.com/GitbookIO/gitbook/blob/master/docs/setup.md)


[官方Github仓库](https://github.com/GitbookIO/gitbook)

[Gitbook操作指南](https://songlu-cube.gitee.io/courseware-gitbook-demo/1%E7%8E%AF%E5%A2%83%E5%87%86%E5%A4%87.html)

[Gitbook详解](https://www.cnblogs.com/jiangming-blogs/p/14642302.html)

[Gitbook攻略（推荐）](https://tonydeng.github.io/gitbook-zh/gitbook-howtouse/output/README.html)

[插件集合](https://github.com/swapagarwal/awesome-gitbook-plugins)

[GitBook CookBook(优秀)](https://haoqiangchen.github.io/hqbook/Tools/gitbook/config.html)