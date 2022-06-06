# Electron进程间通信

进程间通信（Inter-Process Communication）对于Electron使相当重要的，由于renderer process没有权限处理系统有关的任务（比如访问文件系统），而对于桌面应用来说，这些又是必须的。所以renderer process需要和main process通信，由main process，或者main process发起新的进程去完成这些任务。

在Electron里面，进程间通信依赖于IPC channels。由`ipcMain`和`ipcRenderer`模块完成通信。

## 模式1: Renderer到Main（单项）

通过在renderer process调用`ipcRenderer.send()`，以及main process调用`ipcMain.on()`注册event listener实现。

首先我们现在main process里面注册一个`set-title`事件的listener，当收到事件之后，将设置窗口的标题。

```
    ipcMain.on('set-title', (event, title) => {
        const webContents = event.sender;
        const win = BrowserWindow.fromWebContents(webContents);
        win?.setTitle(title);
    });
```

![set-title listener](./images/set-title-listener.png)

接着我们需要在renderer process里面调用`ipcRenderer.send()`，发送时间给main process。由于ipcRenderer需要在*preload.js*里面使用，所以我们需要在*preload.ts*里面定义个API接口给嵌入页面使用。这个`electronAPI`会被放到全局的window对象中。

```
import { contextBridge, ipcRenderer } from 'electron';

contextBridge.exposeInMainWorld('electronAPI', {
    setTitle: (title: string) => ipcRenderer.send('set-title', title)
});
```

![preload.ts set-title API](./images/set-title-api.png)

接着在*index.html*里面放一个input box和一个button，让用户能够输入需要的标题名。
并且添加`<script>`标签，我们可以把我们需要用的js代码放在*renderer.js*里面。

```
    <body>
        Title: <input id="title" />
        <button id="btn" type="button">Set</button>
        <script src="./renderer.js"></script>
    </body>
```

![index.html input/button](./images/set-button.png)

最后添加*renderer.js*用于调用刚才的`setTitle`API。

```
const titleInput = document.getElementById('title');
const btn = document.getElementById('btn');
btn.addEventListener('click', () => {
    const title = titleInput.value;
    window.electronAPI.setTitle(title);
});
```

![renderer.js](./images/renderer-js.png)

这样就完成了renderer process到main process的通信。

运行结果：

![Set title](./images/set-title-output.gif)

