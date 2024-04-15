# 类与对象

Python中类和对象的所有属性可以通过dir函数查看，dir() 函数用于列出对象的所有属性和方法。当你调用 dir(obj) 时，它会返回对象 obj 所有可以访问的属性、方法和特殊属性的列表，包括类属性
```
['__class__', '__delattr__', '__dict__', '__dir__', '__doc__',  '__format__', '__ge__', '__getattribute__', '__getstate__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__le__', '__lt__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__']
```
值得一提的是
· __dict__ 用于管理
## __slot__属性
__slot__ = [ 'a']
## 类方法和静态方法

@classmethod
def func(cls):
    print(cls)
## 类的表示

- __str__
- __repr__
str的代偿是repr，反之不是

## 切片、索引、迭代

切片、索引迭代实际上是调用slice函数，slice函数最终调用getitem和setitem函数
```
a = [1,2,3,4,5,6,7,8]
a[1:4] = a[slice(1,4,None)]或者a[slice(1,4)]
a[1:6:2] = a[slice(1,6,2)]
```
当你定义了下面的函数后就支持索引了
- __getitem__(self,index)
- __setitem__(self,index,value)


## 类的属性访问

- __getattribute__(self,name)
- __getattr__(self,name)
- __setattr__(self,name,value)
- __delattr__(self,name)

访问属性调用的首先调用getattribute,grattr是getattribute的代偿
## 类的对象访问

- __get__(self,instance,owner)
- __set__(self,instance,value)
- __delete__(self,instance)

> **[info] 注意**
__get__和__getattrbute的区别是，前者访问整个对象或者类，后者访问对象或者类的属性

## 描述符

定义了__getattr__、__setattr__、__delattr__三个函数之一的类被称为描述符，描述符的作用是拦截类的属性的访问、修改、删除，但是对实例对象的访问无效

### property描述符

一个简单的property的定义如下
```
class MyProperty:
    def __init__(self,fget=None,fset=None,fdel=None):
        self.fget = fget
        self.fset = fset
        self.fdel = fdel
    def __get__(self,instance,owner):
        return self.fget(instance)
    def __set__(self,instance,value):
        return self.fset(instance,value)
    def __delete__(self,instance):
        return self.fdel(instance)
    def __setter(self,fset):
        self.fset = fset
    def __deleter(self,fdel):
        self.fdel = fdel
``` 
用法如下
```
class c:
    def __init__(self):
        self._x = 1
    def fget(self):
        return self._x
    def fset(self,value):
        self._x = value
    def fdel(slef):
        del self._x
    x = MyProperty(fget,fset,fdel)

class c:
    def __init__(self):
        self._x = 1
    @MyProperty
    def x(self):
        return self._x
    @x.setter
    def x(self,value):
        self._x = value
    @x.deleter
    def x(self):
        del self._x
其中
@MyProperty
    def x(self):
        return self._x
等同于
def fget(self):
        return self._x
x = MyProperty(fget)
```

## 数据描述符与非数据描述符

当访问一个的属性时，访问的顺序是:数据描述符、对象属性(__dict__)、非数据描述符、类属性(MRO原则查找继承关系属性)
- 只定义getattr被称为，非数据描述符
- 定义了getattr与后两者的其中至少一个被称为数据描述符

```
class A:
    def __get__(self,instance,owner):
        print("get")
class B:
    b = A()
B.b
get
B.b = 1
B.b
1
```
```
class A:
    def __get__(self,instance,owner):
        print("get")
    def __set__(self,instance,value):
        print("set)
class B:
    b = A()
B.b
get
B.b = 1
B.b
set
```

__set_name__(self,owner,name):可以解决绑定属性名的传递问题,比如下面的函数中x=c(),执行init后会自动执行__set_name__并且将x作为name，d作为owner传递进去，实现类和实例名字的绑定
```
class c:
    def __set_name__(self,owner,name):
        self.name = name
        self.owner = owner
class d:
    x = c()

```
