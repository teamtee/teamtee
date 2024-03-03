# how to write markdown elegantly
首先你必须明白mardown是有不同的解析器，不同的解析器对于基础的语法都同时支持，但是对于高级的语法就不一定兼容了。比如Github的README.md，Typora，NWeb这些不同的编译器的解析不同，但是本文主要讲解的是基于Gitbook的markdown语法。
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
视频：
```
<video src="https://iot-me.club/upload/2020/05/hello_1.mp4" width="800px" height="600px" controls="controls"></video>
```
网页：
```
<iframe  
height=400 
width=60% 
src="https://iot-me.club/archives/%E5%B0%8F%E7%B1%B3%E5%8F%8C%E5%8D%95%E5%85%83%E5%8D%8A%E5%85%A5%E8%80%B3%E5%BC%8F%E8%80%B3%E6%9C%BA35mm%E6%8F%92%E5%A4%B4%E7%BA%BF%E5%BA%8F"  
frameborder=0  
allowfullscreen>
</iframe>
```
### 转义符号

```
半方大的空白&ensp;或&#8194;
全方大的空白&emsp;或&#8195;
不断行的空白格&nbsp;或&#160;
```
## 如何优雅的插入视频

### markdown语法

开始我只是想插入Bilibili的jyy的视频，找到了和markdwon相关的两种方法
视频嵌入
```
<video src="https://iot-me.club/upload/2020/05/hello_1.mp4" width="800px" height="600px" controls="controls"></video>
```
网页嵌入
```
<iframe  
height=400 
width=60% 
src="https://iot-me.club/archives/%E5%B0%8F%E7%B1%B3%E5%8F%8C%E5%8D%95%E5%85%83%E5%8D%8A%E5%85%A5%E8%80%B3%E5%BC%8F%E8%80%B3%E6%9C%BA35mm%E6%8F%92%E5%A4%B4%E7%BA%BF%E5%BA%8F"  
frameborder=0  
allowfullscreen>
</iframe>
```
第一方法markdown会识别有问题，markdown阅读器和gitbook都是
```
<video src="https://www.bilibili.com/video/BV1qa4y1j7xk?p=1" width="800px" height="600px" controls="controls"></video>
```
第二个markdown阅读器会整个跳转到Bililibi，不过gitbook还是可以正常编译显示

```
<iframe  
height=400 
width=60% 
src="https://www.bilibili.com/video/BV1qa4y1j7xk?p=1"  
frameborder=0  
allowfullscreen>
</iframe>
```

### 插件
插件有local、youtuber的，我都没试，但是video-player有问题
安装的时候下面这个不行，得用videoplayer,然后他的语法编译也不成功
```
{
    "plugins": ["video-player"]
}
```
教程[见此处](https://developer.aliyun.com/article/1116394)，
