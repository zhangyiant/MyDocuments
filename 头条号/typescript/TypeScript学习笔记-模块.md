# 模块

**JavaScript**在处理模块化的代码上有着非常长的历史，并且也有着众多的方法。**TypeScript**自从2012年开始，就对这些格式进行支持，不过随着技术的发展，社区和**JavaScript**标准都开始收敛于ES Module(或者称为ES6 Module)。你可以已经知道了，那就是*import*/*export*语句。

`ES Module`是在2015加入到*JavaScript*标准的，而到了2020年受到了大多的浏览器和*JavaScript*运行时的支持。

这里会对`ES Module`和之前的`CommonJS`版本（也就是`module.exports =`）进行描述。

## JavaScript模块是怎么被定义的？

在**TypeScript**里面，和**ECMAScript 2015**一样，任何文件如果在顶层包括了`import`或者`export`语句，那么我们就称它为一个模块。

反过来说，如果文件并不包含这样的`import`或者`export`申明，我们就把它当成一个脚本。里面的内容都会在全局(Global scope)范围里面运行。

模块是运行在它自己的范围空间里的，而不是全局范围里面的。这也就是说，模块里面定义的变量，函数，类等等，如果没有显式的导出（export）的话，对外是不可见的。也就是说，如果你想使用模块里面的任何变量，类，接口等，你需要在模块里面导出，然后在使用的地方导入，这样才能正常使用。

## 空模块(Non-modules)

如果你有个文件，暂时还没有`import`或者`export`语句，但是你又希望把这个文件当成一个模块来看待，那么你可以在代码里面加上

```
export {};
```

这样**TypeScript**编译器就能把它当成一个模块来看了。

## TypeScript里面的模块

当你开始写基于模块的TypeScript的时候，主要有三点你需要考虑：

1. 语法：你应该使用什么语法去使用`import`和`export`。
1. 模块解析(Module Resolution)：也就是如何去搜索文件系统以查询模块。
1. 模块输出的目标：你希望用什么形式进行模块的输出。

### ES Module语法

一个文件可以通过`export default`来导出：

```
export default function helloWorld() {
    console.log('HelloWorld!');
}
```

![export default](./images/ts-mod-export-default.png)

这样的话，就可以通过import进行导入：

```
import helloWorld from "./hello";

helloWorld();
```

![import default](./images/ts-mod-import-helloworld.png)

除了使用默认导出，你还可以不添加default，而导出多个变量，函数等。

```
export var pi = 3.14;
export let squareTwo = 1.41;
export const phi = 1.61;

export class RandomNumberGenerator {};

export function absolute(num: number) {
    if (num < 0) return num * -1;
    return num;
}
```

![export](./images/ts-mod-export.png)

这个时候的导入，需要加上括号：

```
import { pi, squareTwo, phi, absolute } from "./math";

console.log("Pi = ", pi);
console.log("abs(-5) = ", absolute(-5));
```

![import](./images/ts-mod-import.png)

运行结果如下：

![import output](./images/ts-mod-import-output.png)

也可以通过`as`给导入的对象换个名字：

```
import { pi as Π } from "./math";

console.log("Π = ", Π);
```

![import alias](./images/ts-mod-import-alias.png)

你还可以混用默认导出和非默认导出:

比如这里把`absolute`函数进行默认导出：

```
export var pi = 3.14;
export let squareTwo = 1.41;
export const phi = 1.61;

export class RandomNumberGenerator {};

export default function absolute(num: number) {
    if (num < 0) return num * -1;
    return num;
}
```

![mixed export](./images/ts-mod-mixed-export.png)

import的时候可以都写在一行里面：

```
import absolute, { pi as Π } from "./math";

console.log("Π = ", Π);
console.log("abs(-5) = ", absolute(-5));
```

![mixed import](./images/ts-mod-mixed-import.png)

你也可以使用`import *`来导入所有的对象。

```
import * as math from './math';

console.log("pi = ", math.pi);
```

![import star](./images/ts-mod-import-star.png)

也可以直接import一个文件，但是这样的话，其实并不会import任何东西，不过模块里面的东西，还是会运行一遍的。

```
import './side-effect';
```

### TypeScript特有的格式

`type`和`interface`都是TypeScript里面特有的语法，它可以像正常的JavaScript对象那样导出和导入。

```
export type Cat = { breed: string; yearOfBirth: number};
export interface Dog {
    breeds: string[];
    yearOfBirth: number;
};
```

![export type](./images/ts-mod-export-type.png)

```
import { Cat, Dog } from './animal';

type NewType = Cat | Dog;
```

![import type](./images/ts-mod-import-type.png)

**TypeScript**还专门添加了`import type`来专门用于导入类型。

```
import type { Cat, Dog } from './animal';

type NewType = Cat | Dog;
```

![import type](./images/ts-mod-import-type-type.png)

也可以把`type`写在大括号里面:

```
import { type Cat, type Dog } from './animal';

type NewType = Cat | Dog;
```

![import type](./images/ts-mod-import-type-type-2.png)

这种语法主要是为了像Babel这样的转换工具(Transpiler)，它们并不会完整解析TypeScript模块，使用`import type`的话，它们就可以放心的直接忽略掉这些语句，毕竟在最后生成的JavaScript里面，是没有任何的TypeScript类型信息的。

### ES Module语法导入CommonJS模块

ES模块也能直接导入CommonJS模块，甚至可以使用`require()`。

```
import fs = require('fs');

const code = fs.readFileSync('hello.ts', 'utf8');

console.log(code);
```

![import commonjs](./images/ts-mod-import-commonjs.png)

