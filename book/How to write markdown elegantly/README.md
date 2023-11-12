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

> [!TIP]
> 如果想在代码块中使用` ``` `,可以使用` ```` `代替` ``` `包裹）

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
表格
| Heading 1 | Heading 2 | Heading 3 |
| --------- | --------- | --------- |
| cell 1    | cell 2    | cell 3    |
| cell 4    | cell 5    | cell 6    |

折叠表格
<details>
<summary>My top languages</summary>

| Rank | Languages |
|-----:|-----------|
|     1| Javascript|
|     2| Python    |
|     3| SQL       |

</details>





mergaid关系图
```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```

数学
```math
\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)
```

### 链接

超链接：`[]()`
图片：`<img src=".jpg" width="50%" height="50%">`或者`![](src)`

