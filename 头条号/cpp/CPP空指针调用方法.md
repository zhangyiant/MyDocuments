# C++使用空指针调用方法

C++使用空指针是否能够调用方法？
答案是可以的，但是这个方法不能访问任何成员变量。

```
#include <iostream>

class A {
public:
    void hello() {
        std::cout << this << std::endl;
        std::cout << "Hello, World!" << std::endl;
    }
};
int main() {
    A* a = nullptr;
    a->hello();
    return 0;
}
```

![nullptr访问方法](./images/nullpointer-access-method.png)

看看这段代码，编译运行会出错吗？
答案是不会的。

在调用hello的时候，对于C++来说，和调用一个一般的函数没有什么区别，唯一的区别就是会把a的指针作为this参数，往函数里面传。
如果正好你的方法没有访问任何类成员资源，那就很幸运，不会有任何的报错。

运行结果如下：

![运行结果](./images/nullpointer-acess-method-output.png)

当然实际代码里面也不应该用这种方式访问。
不过确实有时候有人用空指针去计算偏移量。
仅作为学习理解C++方法调用之用。
