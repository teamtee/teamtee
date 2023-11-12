# how to write markdown elegantly

## 基本入门
参考[教程](https://docs.github.com/zh/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
### 文本样式

粗体：`** **` 或者`__ __`,快捷键`CTRL_b`

斜线：`* *` 或者 `_ _`,快捷键`CTRL_i`

删除线：`~ ~`

下标： `<sub> </sub>`

上标： `<sup> </sup>`

### 特殊块

引用文本： `>`

代码块：` ``` ``` `

花体：` `` `` `

行内代码：` `` `

无序列表：` * + - `

有序列表：`1.`

(支持嵌套)

任务列表
```
- [ ] task1
- [x] task2
- [ ] task3
```

> **NOTE**
>
> 它可以有好几行。
> 
> 

> **警告：** 这就是编写备注的方式。
>
> 它可以有好几行。

(PS:如果想在代码块中使用` ``` `,可以使用` ```` `代替` ``` `包裹）

### 链接

超链接：`[]()`
图片：`<img src=".jpg" width="50%" height="50%">`或者`![](src)`
## using note

> [!NOTE]
> Information the user should notice even if skimming.

> [!TIP]
> Optional information to help a user be more successful.



> [!IMPORTANT]
> Essential information required for user success.

> [!CAUTION]
> Negative potential consequences of an action.

> [!WARNING]
> Dangerous certain consequences of an action.

## 写代码
参考[文章](https://developer.mozilla.org/zh-CN/docs/MDN/Writing_guidelines/Howto/Markdown_in_MDN#%E7%A4%BA%E4%BE%8B%E4%BB%A3%E7%A0%81%E5%9D%97)
你可以使用`内容`
```
&#96;&#96;&#96;
~~~
\```c
\```
~~~
```

```html-nolint
<p>
我不会被 lint。
</p>
```
## Tips
### 在代码块里面使用```
你可以通过包裹更多的`来使用
`````
````
```
```
````
`````

``
nihao
``
`fsdsfaf
`
```
sfdakfds
```
````
*fsfs*
````
*nihao*

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/25423296/163456776-7f95b81a-f1ed-45f7-b7ab-8fa810d529fa.png">

  <img alt="Shows an illustrated sun in light mode and a moon with stars in dark mode." src="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png">
</picture>