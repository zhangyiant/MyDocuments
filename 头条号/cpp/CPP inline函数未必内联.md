# C++ inline函数未必内联

我们在定义函数的时候，有时候希望这个函数能够内嵌在调用它的地方，这个时候就会使用inline关键字。

但是inline是否真的有效果呢？

举个例子：

```
cmake_minimum_required(VERSION 3.16)

project(HelloWorld)

add_executable(HelloWorld main.cpp)
```

![CMakeLists.txt](./images/inline-cmake.png)

```
#include <iostream>

using namespace std;

inline void my_inline_func() {
    cout << "HelloWorld" << endl;
    return;
}

int main() {
    my_inline_func();
    return 0;
}
```

![source code](./images/inline-src-code.png)

编译运行：

![run](./images/inline-src-code.png)

运行没有问题，我们使用nm工具，可以看到有一个weak symbol。
这也是`inline`函数没有展开的一个标志。有兴趣的，可以直接转成汇编看看。

![nm debug](./images/inline-weak-symbol.png)

CMake默认用的*Debug*版本，我们来试试*Release*版本。

先编译运行：

![run release](./images/inline-run-release.png)

然后再用`nm`命令看看

![nm release](./images/inline-nm-release.png)

这次那个`my_inline_func`的symbol就不存在了。其实这次代码才真正内联了进去。


那是不是inline只有在Release版本里面才能真正嵌入内联呢？


再看一个递归的例子：

```
#include <iostream>

using namespace std;

inline void my_inline_func() {
    cout << "HelloWorld" << endl;
    return;
}

inline int fib(int n) {
    if(n == 0 || n == 1) {
        return 1;
    } else {
        return fib(n - 1) + fib(n - 2);
    }
}

int main() {
    my_inline_func();
    int r = fib(6);
    cout << "result: " << r << endl;
    return 0;
}
```

![recursive function](./images/inline-recursive.png)

这次加入了一个经典的递归函数。

其实我们自己也可以想想，递归函数其实是没有办法展开到代码里面的。

所以结果是那个*weak symbol*又出现了，这次甚至出现在了Release版本。

![weak symbol](./images/inline-recursive-weak-symbol.png)

其实这也告诉我们，`C++`里面的`inline`，其实并不能保证在任何时候都能内联。加上`inline`关键字，只是告诉编译器，我们希望能够做内联，来提高性能，但是最终的决定权还是编译器，比如这里*gcc*，他会在Debug版本里面放弃内联，还有就是像递归函数，无法内联，自然编译器它也做不到。

实际代码里面，就算再小的函数，还是建议不要随便加`inline`。
先让编译器处理，优化。如果发现确实有性能问题，再考虑是否添加`inline`能解决问题。
