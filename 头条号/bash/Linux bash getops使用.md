# Linux bash getops使用

编写bash脚本，经常需要解析调用脚本的参数。 *bash*的内置*getopts*命令可以帮助你解析输入的参数。

下面是*getopts*的命令格式
```
getopts optstring name [arg...]
```

**optstring**: 解析命令里面的选项字符，如果字符后面有一个冒号(**:**)，那么就认为这个选项后面是需要指定一个参数的。如果**optstring**的第一个字符是(**:**)，将改变*getopts*在发现解析错误的时候的行为。

**name**: 用来存放解析出来的选项字符的*shell*变量名。

返回状态：
如果解析到指定的或者未指定的选项字符，返回*0*。
如果解析结束，或者解析出错，返回>0的

每次运行*getopts*，*getopts*就会从当前**OPTIND**变量指定的参数位置开始搜索下一个选项。如果找到，*name*参数指定的*shell*变量就会设置成这个选项。如果后面是可以带选项值的，**OPTARG**变量就会被赋值。

实验例子：
```
#!/bin/bash

option_a=
option_b=
option_c=
option_9=
while getopts abc:9 name
do
    case $name in
        a)    option_a=1;;
        b)    option_b=1;;
	    c)    option_c=1
              value_c="$OPTARG";;
	    9)    option_9=1;;
        ?)   printf "Usage: %s: [-a] [-b] [-c value] [-9] args\n" $0
        exit 2;;
    esac
done
if [ ! -z "$option_a" ]; then
    printf "Option -a specified\n"
fi
if [ ! -z "$option_b" ]; then
    printf "Option -b specified\n"
fi
if [ ! -z "$option_c" ]; then
    printf 'Option -c "%s" specified\n' "$value_c"
fi
if [ ! -z "$option_9" ]; then
    printf "Option -9 specified\n"
fi

shift $(($OPTIND - 1))
printf "Remaining arguments are: $*\n"

```

运行结果：
![getopts output](./images/getopts_output.png)




