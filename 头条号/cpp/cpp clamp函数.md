# C++里面的clamp函数

在C++标准库里面有一个*clamp*函数。

这个函数是个模版化的函数，不过我们通常用它来进行数值运算。

函数声明有两条，区别就在于是否自定义*Compare*函数。

```
template<class T>
constexpr const T& clamp( const T& v, const T& lo, const T& hi );
template<class T, class Compare>
constexpr const T& clamp( const T& v, const T& lo, const T& hi, Compare comp );
```

作用是如果*v*在*lo*, *hi*之间，则返回*v*，如果小于*lo*，返回*lo*，如果大于*hi*，返回*hi*。

这个函数是在**C++17**里面开始支持的，需要注意的是，它的返回值是一个引用。

比如下面的代码：

```
#include <algorithm>
#include <iostream>

const int& myclamp() {
    int n = -1;
    const int& r = std::clamp(n, 0, 256);
    std::cout << "Result in myclamp: " << r << std::endl;
    return r;
}
int main()
{
    int r = myclamp();
    std::cout << "result: " << r << std::endl;
}
```

![return reference error](./images/cpp-clang-code.png)

看上去好像挺正常的，使用**Debug**模式编译运行也没有问题。

```
Result in myclamp: 0
result: 0
```

但是换到**Release**模式编译运行就出问题了。

```
Result in myclamp: 32760
result: 32760
```

主要原因就是那个引用，引用的内容是否还是有效的内容，**Debug**模式优化的少，没太大问题，到了**Release**模式，这个bug就表现出来了。