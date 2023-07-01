# macOS配置OpenGL学习环境

**OpenGL**环境需要准备一个窗口和**OpenGL** Context。

窗口和*Context*可以使用*glfw*创建。

在*macOS*上面可以使用*homebrew*安装。

```
brew install glfw
```

接着还需要一套库，用于导出*OpenGL*的函数。

这里选择使用*glew*

```
brew install glew
```

这里使用*cmake*生成项目，所以还需要安装*cmake*。

```
brew install cmake
```

工具和库都安装完了，接着就是编写*CMakeLists.txt*。

使用*find_package()*来查找*glfw*, *glew*的路径，然后链接到项目。

```
cmake_minimum_required(VERSION 3.16)

project(OpenGLTutorial)

add_executable(OpenGLTutorial main.cpp)

find_package(glfw3 REQUIRED)
find_package(GLEW REQUIRED)
target_link_libraries(OpenGLTutorial
    PRIVATE 
        glfw
        GLEW::GLEW
)
```

接着编写*main.cpp*文件。

为了使用*glfw*创建窗口和*OpenGL context*，先*include*对应的头文件。

```
#include <GLFW/glfw3.h>
```

然后调用*glfwInit()*。接着就能创建窗口了。

```
    glfwInit();
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);

    GLFWwindow* window = glfwCreateWindow(800, 600, "LearnOpenGL", NULL, NULL);

    if(window == NULL) {
        cout << "Failed to create GLFW window" << endl;
        glfwTerminate();
        return -1;
    }
    glfwMakeContextCurrent(window);
```

在*macOS*上需要多配置一条WindowHint。

```
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
```

接着为了调用*OpenGL*的函数，需要初始化*glew*。

在*glfw* include之前，include *glew*的头文件。

```
#include <GL/glew.h>
#include <GLFW/glfw3.h>
```

然后需要初始化*glew*。

```
    GLenum err = glewInit();
    if (GLEW_OK != err) {
        cout << glewGetErrorString(err) << endl;
        return -1;
    }
```

最后写上循环，用于画图，和交换*Buffer*。

```
    glViewport(0, 0, 800, 600);
    while(!glfwWindowShouldClose(window)) {
        glClearColor(1.0f, 0.0f, 0.0f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT);

        glfwPollEvents();
        glfwSwapBuffers(window);
    }
```

这边只是把背景设成红色。

代码完成，就可以编译运行了。

```
mkdir build
cd build
cmake ..
cmake --build .
```

构建完成，运行程序

```
./OpenGLTutorial 
```

运行结果如下:

![OpenGL Window](./images/OpenGL%20Window%20env.png)

这样就配置了一个基本的*OpenGL*环境。可以继续尝试和学习*OpenGL*的指令。







