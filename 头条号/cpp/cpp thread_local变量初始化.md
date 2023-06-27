# C++ thread_local变量初始化

*C++* *thread_local*变量在什么时候初始化，如果线程里面没有用到这个变量，变量是否还会被初始化？

为了验证这个问题，先写了一个类，*constructor*和*destructor*的时候，都打印一些信息。

```
class MyNewClass {
    public:
    MyNewClass() {
        cout << "constructor" << endl;
    }
    ~MyNewClass() {
        cout << "destructor" << endl;
    }
    void hello() {
        return;
    }
};
```

![Test Class](./images/thread_local_test_class.png)

然后定义*thread_local*变量，用于*thread*。

```
thread_local MyNewClass m;

void my_thread_func(const std::string& name) {
    int my = 0;
    cout << "before in the loop" << endl;
    while(my < 3) {
        using namespace std::chrono_literals;
        m.hello();
        my++;
        std::this_thread::sleep_for(2000ms);
    }
    cout << "after the loop" << endl;
}

int main() {
    string name_a = "a";
    string name_b = "b";
    std::thread my_thread_a(my_thread_func, name_a), my_thread_b(my_thread_func, name_b);
    my_thread_a.join();
    my_thread_b.join();
    cout << "After join" << endl;
    return 0;
}
```

![代码](./images/thread_local_class_initialize.png)

运行结果如下：

![运行结果](./images/thread_local_class_initialize_output.png)

可以看到，在线程创建的时候，这个*thread_local*对象还没有初始化。直到使用的时候，*constructor*才会被调用。

但是可以看到，主线程一直都没有调用*constructor*。

在主程序里面添加对*thread_local*对象的使用。

![main thread](./images/thread_local_class_initialize_main.png)

输出结果：

![main thread output](./images/thread_local_class_initialize_main_output.png)

可以看到，这个时候主程序里面的*thread_local*对象才会被初始化。而且只有在用到的时候才会被初始化。


