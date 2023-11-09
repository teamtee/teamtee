# Pands库的使用
这里是一份官方[教程](https://pandas.pydata.org/docs/getting_started/index.html#getting-started)

## 基本概念

Pandas的数据由`series`和`DataFrame`组成，通常这两个数据结构的值是可以改变的，但是大小不可改变

`series`是具有`index`和`name`的同类`dtype`的`values`数据序列,使用`numpy.ndarray`来存储数据，`pandas`只有三种数据类型`int (int64)`、`float (float64)`、`str(object)`
```
ages = pd.Series(index=[0,1,2],value=[22, 35, 58],name="Age",dtype=int)
```
`DataFrame`是一系列`series`的集合,每个`series`具有相同的`index`和相同的长度，`name`在`dataFrame`中组成`colunms`,`DataFrame`的`index`和`colunms`属性实际上是`Series`,具有单个类型`series`的`dataFrame`同一类型，具备多种类型`series`的`dataFrame`为`object`类型。
```
df = pd.DataFrame(np.arange(9).reshape(3, 3), index = ['TJ', 'BJ', 'SH'], columns=['q', 'w', 'e'])
```
## 基本操作
### 读取与转化
可以通过字典创建`dataFrame`,通过列表创建`series`，也可以通过`read_*` 类函数和`to_*`函数进行读取和存储,支持`csv`、`excel`、`json`等等流行文件。
```
pd.read_excel("titanic.xlsx", sheet_name="passengers")
df.to_excel("titanic.xlsx", sheet_name="passengers", index=False)
pd.read_csv(
    "data/air_quality_long.csv", index_col="date.utc", parse_dates=True
)
```
### 查看信息
df.tail
df.head
df.info
df.dtypes
df.shape
### 数据索引
注意你的到的数据通常和原数据是同一份，修改会改变两者
df["age"]
df[["age","sex"]]
df[df["age"]>35]
df["age"]>35
df[df["Pclass"].isin([2, 3])]
df[(df["Pclass"] == 2) | (df["Pclass"] == 3)]
df[df["Age"].notna()]

df.loc[df["Age"] > 35, "Name"]
df.iloc[9:25, 2:5]
df.iloc[0:3, 3] = "anonymous"
### 统计操作
对`series`可以求`max`、`mean`、`median`，对于`dataFrame`可以求`corr`,也可以通过`describe`查看多个统计值列表，还可以通过`value_counts`统计出现的次数

`agg`函数可以选择多个统计量聚类分析

```
In [7]: titanic.agg(
   ...:     {
   ...:         "Age": ["min", "max", "median", "skew"],
   ...:         "Fare": ["min", "max", "median", "mean"],
   ...:     }
   ...: )
   ...: 
Out[7]: 
              Age        Fare
min      0.420000    0.000000
max     80.000000  512.329200
median  28.000000   14.454200
skew     0.389108         NaN
mean          NaN   32.204208
```
`groupby`可以选择将某列值作为分类依据,将原数据分为多组,然后计算某个统计值
```
In [9]: titanic.groupby("Sex").mean()
Out[9]: 
Sex       PassengerId  Survived    Pclass  ...     SibSp     Parch       Fare
                                   ...                               
female   431.028662  0.742038  2.159236  ...  0.694268  0.649682  44.479818
male     454.147314  0.188908  2.389948  ...  0.429809  0.235702  25.523893
```
`groupby`也可以选择多个列,会对这多个列进行排列组合
```
In [11]: titanic.groupby(["Sex", "Pclass"])["Fare"].mean()
Out[11]: 
Sex     Pclass
female  1         106.125798
        2          21.970121
        3          16.118810
male    1          67.226127
        2          19.741782
        3          12.661633
Name: Fare, dtype: float64
```
`value_counts`可以统计每一种元素出现的次数
```
In [12]: titanic["Pclass"].value_counts()
Out[12]: 
Pclass
3    491
1    216
2    184
Name: count, dtype: int64
```
### 数据重组
`sort_values`可以按值排序，`sort_index`可以按照序列排序
```
In [7]: titanic.sort_values(by=['Pclass', 'Age'], ascending=False).head()
Out[7]: 
     PassengerId  Survived  Pclass  ...    Fare Cabin  Embarked
851          852         0       3  ...  7.7750   NaN         S
116          117         0       3  ...  7.7500   NaN         Q
280          281         0       3  ...  7.7500   NaN         Q
483          484         1       3  ...  9.5875   NaN         S
326          327         0       3  ...  6.2375   NaN         S

[5 rows x 12 columns]
```
`pivot`可以从原数据中抽取数据，有两种使用方式
```
pivot(columns="location", values="value")
```
`pivot_table`同时可以指定`index`,但是需要指定聚合方法
```
air_quality.pivot_table(
    values="value", index="location", columns="parameter", aggfunc="mean"
)_counts
```

`melt`函数创建透视表
```
pd.melt(df, id_vars =['Name'], value_vars =['Course'],var_name = "",value_name = "")
```
### 合并表格
`concat`
```
pd.concat([air_quality_pm25, air_quality_no2], axis=0)
pd.concat([air_quality_pm25, air_quality_no2], keys=["PM25", "NO2"])
```
`merge`
见这篇[文章](https://blog.csdn.net/brucewong0516/article/details/82707492)
```
import pandas as pd

left = pd.DataFrame({'key': ['K0', 'K1', 'K2', 'K3'],
                       'A': ['A0', 'A1', 'A2', 'A3'],
                       'B': ['B0', 'B1', 'B2', 'B3']})
right = pd.DataFrame({'key': ['K0', 'K1', 'K2', 'K3'],
                        'C': ['C0', 'C1', 'C2', 'C3'],
                        'D': ['D0', 'D1', 'D2', 'D3']})
result = pd.merge(left, right, on='key')

# on参数传递的key作为连接键
result
Out[4]: 
    A   B key   C   D
0  A0  B0  K0  C0  D0
1  A1  B1  K1  C1  D1
2  A2  B2  K2  C2  D2
3  A3  B3  K3  C3  D3

```
### 绘制
['area',
 'bar',
 'barh',
 'box',
 'density',
 'hexbin',
 'hist',
 'kde',
 'line',
 'pie',
 'scatter']
```
df.plot()
plt.show()
```
### 映射操作
参考这篇[文章](https://zhuanlan.zhihu.com/p/100064394)
`series.map`:支持字典，函数

`series.apply`:支持带参数的函数

`dataFrame.apply`:函数

`dataFrame.applymap`:函数
```
data["gender"].map({"男":1, "女":0})
data["gender"].map(lambda x:"%.2f" % x)
addition = lambda x, y: x + y
data["age"].apply(addtion,args=(-3,))

data[["height","weight","age"]].apply(np.sum, axis=0)
data[["height","weight","age"]].apply(np.sum, axis=1)
df.applymap(lambda x:"%.2f" % x)
```
还可以对`index`和`name`进行映射，这个函数叫`rename`
```
air_quality_renamed = air_quality.rename(
    columns={
        "station_antwerp": "BETR801",
        "station_paris": "FR04014",
        "station_london": "London Westminster",
    }
)
```

### 时间序列处理和文本处理（TODO）


## 操作实例
