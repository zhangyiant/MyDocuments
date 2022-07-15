# JavaScript里面的Promise

JavaScript里面基本上都是使用异步调用，传递一个回调函数（Callback Function）给函数执行完之后调用，返回异步执行的结果。
多层callback调用，形成了层层的嵌套。

比如下面的例子：

```
function a(callback1: (value: number) => void) {
    const value: number = 5;
    setTimeout(() => {
        console.log("outer timeout");
        callback1(value);
    }, 0);
};

setTimeout(() => {
    a((value) => {
        console.log("value: ", value);
        setTimeout(() => {
            console.log("inner setTimeout")
        }, 0);
    })
});
```

![Callback Pyramid](./images/promise-callback-pyramid.png)

可以看到，层层嵌套。

为了解决这个问题，引入了Promise这个对象。

由于Promise的then(), catch(), finally()方法，能够返回一个新的Promise。所以Promise可以使用级连多个调用。让原本需要层层嵌套的调用，平铺开。使得代码更加清晰和易于维护。

Promise的使用需要注意一下几点。

## Promise constructor的参数是立刻执行的

Promise构造子只有一个参数，称为executor。需要提供一个函数，这个函数有两个参数resolutionFunc和rejectFunc。当调用new Promise()的时候，这个executor会立刻执行，不过关心then/catch/finally是否会被调用。

比如：

```
const p = new Promise<number>((resolve, reject) => {
    console.log("start of executor");
    resolve(5);
    console.log("end of executor");
});

console.log("after new Promise");
```

![execute immediately](./images/promise-execute-immediately.png)

输出结果如下：

![execute immediately](./images/promise-execute-immediately-output.png)

