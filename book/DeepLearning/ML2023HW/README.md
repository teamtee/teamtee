# 作业

## HW01
 
### 参数优化
MLP模型：（input_feature，dim）->(dim,dim)xlayer ->(dim,1)
#### 特征选择

| loss | lr   | batch | seed    | epoch | optim | loss             | model | model_params  | feature   |
|:----:|:----:|:-----:|:-------:|:-----:|:-----:|:----------------:|:-----:|:-------------:|:---------:|
|   1.7   | 1e-5 | 256   | 5201314 | 5000  | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=300 | 0.6       |
|   1.31   | 1e-5 | 256   | 5201314 | 5000  | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=300 | 0.7       |
|   1.13   | 1e-5 | 256   | 5201314 | 5000  | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=300 | 0.75      |
|   1.31   | 1e-5 | 256   | 5201314 | 5000  | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=300 | 0.9       |



#### 模型复杂


| loss | lr   | batch | seed    | epoch | optim | loss             | model | model_params  | feature   |
|:----:|:----:|:-----:|:-------:|:-----:|:-----:|:----------------:|:-----:|:-------------:|:---------:|
|   5.2   | 1e-5 | 256   | 5201314 | 5000  | Adam  | CrossEntropyLoss | MLP   | layer=1,dim=4 | 0.7       |
|   3.2   | 1e-5 | 256   | 5201314 | 5000  | Adam  | CrossEntropyLoss | MLP   | layer=1,dim=16 | 0.7       |
|   4.3   | 1e-5 | 256   | 5201314 | 5000  | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=16 | 0.7      |
|   16   | 1e-5 | 256   | 5201314 | 5000  | Adam  | CrossEntropyLoss | MLP   | layer=3,dim=16 | 0.7       |
|   2.4   | 1e-5 | 256   | 5201314 | 5000  | Adam  | CrossEntropyLoss | MLP   | layer=1,dim=64 | 0.7       |
|   1.7   | 1e-5 | 256   | 5201314 | 5000  | Adam  | CrossEntropyLoss | MLP   | layer=1,dim=128 | 0.7      |
|   1.71   | 1e-5 | 256   | 5201314 | 5000  | Adam  | CrossEntropyLoss | MLP   | layer=1,dim=400 | 0.7       |


### 优化器和批次

| loss | lr   | batch | seed    | epoch | optim      | loss             | model | model_params    | feature |
|:----:|:----:|:-----:|:-------:|:-----:|:----------:|:----------------:|:-----:|:---------------:|:-------:|
| 1.13 | 1e-5 | 256   | 5201314 | 5000  | Adam       | CrossEntropyLoss | MLP   | layer=1,dim=300 | 0.7     |
| 1.5  | 1e-5 | 64    | 5201314 | 5000  | Adam       | CrossEntropyLoss | MLP   | layer=1,dim=300 | 0.7     |
| 1.4  | 1e-5 | 32    | 5201314 | 5000  | Adam       | CrossEntropyLoss | MLP   | layer=1,dim=300 | 0.7     |
| 1.5  | 1e-5 | 32    | 5201314 | 5000  | SGD        | CrossEntropyLoss | MLP   | layer=1,dim=300 | 0.7     |
| 1.2  | 1e-5 | 32    | 5201314 | 5000  | SGD(m=0.9) | CrossEntropyLoss | MLP   | layer=1,dim=300 | 0.7     |
| 0.98 | 1e-5 | 4     | 5201314 | 5000  | SGD(m=0.9) | CrossEntropyLoss | MLP   | layer=1,dim=300 | 0.7     |
| 1.3  | 1e-6 | 4     | 5201314 | 5000  | SGD(m=0.9) | CrossEntropyLoss | MLP   | layer=1,dim=300 | 0.7     |
| 100  | 1e-4 | 4     | 5201314 | 5000  | SGD(m=0.9) | CrossEntropyLoss | MLP   | layer=1,dim=300 | 0.7     |
| 0.95 | 5e-5 | 4     | 5201314 | 5000  | SGD(m=0.9) | CrossEntropyLoss | MLP   | layer=1,dim=300 | 0.7     |
| 0.88 | 5e-5 | 16    | 5201314 | 5000  | SGD(m=0.9) | CrossEntropyLoss | MLP   | layer=1,dim=300 | 0.7     |
| 2    | 5e-5 | 4     | 5201314 | 5000  | SGD(m=0.9) | CrossEntropyLoss | MLP   | layer=2,dim=300 | 0.7     |




### 结果总结

strong

boss不知道用什么架构，过吧

## HW02

### 参数优化

#### 关于特征


| acc  | lr   | batch | seed | epoch | optim | loss             | model | model_params  | feature    |
|:----:|:----:|:-----:|:----:|:-----:|:-----:|:----------------:|:-----:|:-------------:|:----------:|
| 0.53 | 1e-4 | 512   | 1213 | 150   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=64 | connect=3  |
| 0.55 | 1e-4 | 512   | 1213 | 150   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=64 | connect=5  |
| 0.58 | 1e-4 | 512   | 1213 | 150   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=64 | connect=7  |
| 0.60 | 1e-4 | 512   | 1213 | 150   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=64 | connect=9  |
| 0.61 | 1e-4 | 512   | 1213 | 150   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=64 | connect=11 |
| 0.63 | 1e-4 | 512   | 1213 | 184   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=64 | connect=13 |
| 0.64 | 1e-4 | 512   | 1213 | 221   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=64 | connect=15 |
|     0.64  | 1e-4 | 512   | 1213 | 150   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=64 | connect=17  |
|     0.64  | 1e-4 | 512   | 1213 | 150   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=64 | connect=19  |




#### 关于层数
| acc    | lr   | epoch | seed | batch | optim | loss             | model | model_params    | feature    |
|:------:|:----:|:-----:|:----:|:-----:|:-----:|:----------------:|:-----:|:---------------:|:----------:|
| 0.64   | 1e-4 | 512   | 1213 | 512   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=64  | connect=19 |
| 0.6526 | 1e-4 | 317   | 1213 | 512   | Adam  | CrossEntropyLoss | MLP   | layer=3,dim=64  | connect=19 |
| 0.6543 | 1e-4 | 302   | 1213 | 512   | Adam  | CrossEntropyLoss | MLP   | layer=4,dim=64  | connect=19 |
| 0.6546 | 1e-4 | 300   | 1213 | 512   | Adam  | CrossEntropyLoss | MLP   | layer=8,dim=64  | connect=19 |
| 0.6520 | 1e-4 | 320   | 1213 | 512   | Adam  | CrossEntropyLoss | MLP   | layer=12,dim=64 | connect=19 |
| 0.65   | 1e-4 | 512   | 1213 | 512   | Adam  | CrossEntropyLoss | MLP   | layer=10,dim=64  | connect=19 |


| 训练集 | acc  | lr   | epoch | seed | batch | optim | loss             | model | model_params      | feature    |
|:------:|:----:|:----:|:-----:|:----:|:-----:|:-----:|:----------------:|:-----:|:-----------------:|:----------:|
|        | 0.64 | 1e-4 | 512   | 1213 | 512   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=64    | connect=19 |
|        | 0.67 | 1e-4 | 70    | 1213 | 512   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=128   | connect=19 |
|        | 0.68 | 1e-4 | 58    | 1213 | 512   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim= 256  | connect=19 |
| 0.86   | 0.68 | 1e-4 | 70    | 1213 | 512   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=512   | connect=19 |
| 0.97   | 0.69 | 1e-4 | 8     | 1213 | 512   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim= 1024 | connect=19 |
| 0.98   | 0.69 | 1e-4 | 30    | 1213 | 512   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim= 2048 | connect=19 |

### 关于Droupout
| 训练集 | acc   | lr   | epoch | seed | batch | optim              | loss             | model | model_params      | feature    |
|:------:|:-----:|:----:|:-----:|:----:|:-----:|:------------------:|:----------------:|:-----:|:-----------------:|:----------:|
| 0.72   | 0.741 | 1e-4 | 238   | 1213 | 512   | Adam(Droupout=0.5) | CrossEntropyLoss | MLP   | layer=2,dim=512   | connect=19 |
| 0.92   | 0.71  | 1e-4 | 110   | 1213 | 512   | Adam(Droupout=0.1) | CrossEntropyLoss | MLP   | layer=2,dim= 1024 | connect=19 |
| 0.78   | 0.73  | 1e-4 | 100   | 1213 | 512   | Adam(Droupout=0.3) | CrossEntropyLoss | MLP   | layer=2,dim= 1024 | connect=19 |
| 0.80   | 0.748 | 1e-4 | 191   | 1213 | 512   | Adam(Droupout=0.5) | CrossEntropyLoss | MLP   | layer=2,dim= 1024 | connect=19 |
| 0.68   | 0.69  | 1e-4 | 110   | 1213 | 512   | Adam(Droupout=0.7) | CrossEntropyLoss | MLP   | layer=2,dim= 1024 | connect=19 |
| 0.82   | 0.748 | 1e-4 | 100   | 1213 | 512   | Adam(Droupout=0.5) | CrossEntropyLoss | MLP   | layer=2,dim= 2048 | connect=19 |
| 0.70   | 0.74  | 1e-4 | 100   | 1213 | 512   | Adam(Droupout=0.7) | CrossEntropyLoss | MLP   | layer=2,dim= 2048 | connect=19 |


### 关于Batchnormal

| 训练集 | acc   | lr   | epoch | seed | batch | optim              | loss             | model | model_params      | feature    |
|:------:|:-----:|:----:|:-----:|:----:|:-----:|:------------------:|:----------------:|:-----:|:-----------------:|:----------:|
| 0.97   | 0.68 | 1e-4 | 238   | 1213 | 512   | Adam(Droupout=0.5) | CrossEntropyLoss | MLP   | layer=2,dim=2048   | connect=19 |
| 0.94   | 0.67  | 1e-4 | 110   | 1213 | 512   | Adam(Droupout=0.1) | CrossEntropyLoss | MLP   | layer=2,dim= 1024 | connect=19 |
