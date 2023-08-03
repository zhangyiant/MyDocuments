# 在Visual Studio Code里面使用CMake

*Visual Studio Code*可以说是现在最流行的代码编辑器之一，而*CMake*又是现今主流的跨平台*C++*开发构建工具。在*Visual Studio Code*的插件里面，有微软提供的高质量*CMake*插件，使得*Visual Studio Code*可以满足使用*CMake*的*C++*开发。

## 安装插件

开发*C++*项目首先需要安装插件。
有两个插件需要安装:
一个是*C++*插件

![VSCode C++ Plugin](./images/C++%20plugin%20in%20VSCode.png)

另一个是*CMake*插件。

![VSCode CMake Plugin](./images/CMake%20plugin%20in%20VSCode.png)

*CMake*插件一定留意安装微软的版本。

## 创建CMake项目

安装完插件就可以使用*Visual Studio Code*开启新的项目。新建一个目录，然后用*Visual Studio Code*打开这个目录。

首先运行命令*Quick Start*

![Quick Start](./images/VSCode%20quick%20start.png)

然后填入项目名称

![Project Name](./images/VSCode%20project%20name.png)

接着选择*C++*项目

![C++ project](./images/VSCode%20C++%20project.png)

最后选择*Executable*可执行程序

![Executable](./images/VSCode%20Executable.png)

这样就创建好了一个基本的CMake C++项目，只有一个*main.cpp*文件。

下图是创建好的默认项目

![Default Project](./images/VSCode%20default%20project.png)

## 配置构建项目

使用*CMake Config*和*CMake Build*可以执行配置和构建项目

![config/build](./images/VSCode%20CMake%20configure-build.png)

## Debug项目

也可以设置断点，在*Visual Studio Code*里面*Debug*项目。

![Debug](./images/VSCode%20CMake%20Debug.png)

在使用过程中，多少还是遇到一些bug，不过总体来说基本可用了。当然最直接可靠的使用*CMake*的方式，可能还是自己打开*Terminal*使用命令行。

