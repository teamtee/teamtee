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
|      | 1e-4 | 512   | 1213 | 150   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=64 | connect=9  |
|      | 1e-4 | 512   | 1213 | 150   | Adam  | CrossEntropyLoss | MLP   | layer=2,dim=64 | connect=9  |




#### 关于层数
connect：3 0.53
connect：5 0.55
connect：7 0.58
connect：9 0.60
connect：9 layer：2-》3 0.62
connect：9 layer：4 0.63
connect：9 layer：4 droupout 0.2 0.56
connect：9 layer：4 batchnorm 0.63