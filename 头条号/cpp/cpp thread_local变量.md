# C++ thread_local变量

*C++11*引入了*thread_local*这个关键字，使用这个关键字的变量对于每个线程都会有一份拷贝。对于这样的变量不需要加锁保护，因为各个线程访问的都是不同的实例。

示例代码：

```
#include <iostream>
#include <thread>
#include <string>

using namespace std;

thread_local int my;

void my_thread_func(const std::string& name) {
    while(my < 10) {
        using namespace std::chrono_literals;
        cout << name << ": " << my << endl;
        my++;
        std::this_thread::sleep_for(2000ms);
    }
}

int main() {
    string name_a = "a";
    string name_b = "b";
    std::thread my_thread_a(my_thread_func, name_a), my_thread_b(my_thread_func, name_b);
    my_thread_a.join();
    my_thread_b.join();
    return 0;
}
```

运行输出如下：
![运行输出](./images/thread_local_sample_output.png)


接着尝试一下定义个*thread local*变量在动态库里面。

编写一个动态库。

```
#include <iostream>

using namespace std;

thread_local int t = 0;

void hello_world() {
    cout << "In lib: " << t << endl;
    t++;
    return;
}
```

然后在主程序里面调用：
```
using namespace std;

void hello_world();

void my_thread_func(const std::string& name) {
    int my = 0;
    while(my < 10) {
        using namespace std::chrono_literals;
        hello_world();
        my++;
        std::this_thread::sleep_for(2000ms);
    }
}
```

运行结果如下：

![运行结果](./images/thread_local_sample_output_in_lib.png)

就算在动态库里面，只要加了*thread_local*关键字，这个变量就会在每一个线程里面有一份拷贝。
