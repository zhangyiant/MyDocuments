# CMake presets使用

*CMake*可以使用*presets*来预设配置。根据*CMake*命令的不同类型，*presets*分为configure, build, test, package，新版的*CMake*，增加了workflow preset用来将以后的preset顺序执行。

首先我们可以创建一个简单的*CMake*项目。

![CMake project](./images/presets-cmake-project.png)

只有一个*CMakeLists.txt*文件和一个*main.cpp*文件。

接着我们就可以创建*presets*配置文件*CMakePresets.json*。

首先我们先创建一个*configure preset*。

```
{
    "version": 6,
    "configurePresets": [
        {
            "name": "default",
            "displayName": "Default Config",
            "description": "Default Config Preset",
            "binaryDir": "${sourceDir}/build"
        }
    ]
}
```

![Configure Preset](./images/presets-configure-preset.png)

接着我们就可以使用*cmake*命令来列出我们创建的*configure preset*了。

```
cmake --list-presets
```

![list configure preset](./images/presets-list-config-presets.png)

这个*configure preset*就可以使用了。里面没有具体的配置，只是把*CMake*的输出目录配置了一下。

运行
```
cmake --preset default
```

![run configure preset](./images/presets-run-config.png)

*configure preset*定义完之后，我们需要定义*build preset*。
这里需要添加**configurePreset**字段，用于关联对应的*configure preset*。

```
    "buildPresets": [
        {
            "name": "default",
            "displayName": "Default Build",
            "description": "Default Build Preset",
            "configurePreset": "default"
        }
    ]
```

![build preset](./images/presets-build-preset.png)

定义完之后，我们就可以使用命令查看这个*build preset*的信息了。

```
cmake --list-presets=build
```

![list build preset](./images/presets-list-build-preset.png)

然后就能运行这个*build preset*了。

```
cmake --build --preset default
```

![run build preset](./images/presets-run-build-preset.png)

这样我们就有了configure/build两个*preset*，用于覆盖原来命令行的config/build操作。当然*preset*的本意，是希望你把复杂的参数放在配置里面，这里只是试验功能，没有额外添加其他参数。

有了这两个*preset*，我们可以看看定义*workflow preset*，用于合并两步操作。

定义**default** *workflow preset*， 先进行*configure*，然后*build*。

```
    "workflowPresets": [
        {
            "name": "default",
            "steps": [
                {
                    "type": "configure",
                    "name": "default"
                },
                {
                    "type": "build",
                    "name": "default"
                }
            ]
        }
    ]
```

*steps*里面的*name*字段就是相应*configure preset*和*build preset*里面的*name*字段。

![workflow preset](./images/presets-workflow-preset.png)

这里好像我的*VSCode* *CMake*插件还不能正确识别**workflowPresets**。

接着就可以列出这个*workflow preset*了。

```
cmake --workflow --list-presets
```

![list workflow preset](./images/presets-list-workflow-preset.png)

最后就可以直接运行这个*workflow preset*了，他会一次运行之前定义的*configure preset*和*build preset*。

```
cmake --workflow --preset=default
```

![run workflow preset](./images/presets-run-workflow-preset.png)

如果需要更新*CMake Cache*，可以添加*fresh*参数。

```
cmake --workflow --preset=default --fresh
```

![run workflow preset fresh](./images/presets-run-workflow-preset-fresh.png)

随着*CMake*这两年的快速发展，*presets*功能也是基本完善了。方便了配置和调用*CMake*的方式。*workflow preset*也是把原来需要多条命令的执行，合并成了一套。
