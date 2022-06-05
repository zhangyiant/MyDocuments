基于安全考虑，Electron使用了Chromium的sandbox（沙盒）机制。
原则上只有主进程有权限访问文件系统，更改系统设置，新建子进程等。
就算在preload.js里面，一旦沙盒机制打开，则不能访问常规的nodejs API，只能通过ipcRenderer发送消息给主进程(Main Process)。
现在默认sandbox是不会在渲染进程（Renderer Process)里面打开的，所以preload.js里面还能正常访问nodejs API。尽管对于安全性有影响，但是对于桌面应用的开发，还是会容易很多。
不过随着Electron的发展，说不定哪个版本开始，就会把SandBox默认开启。

新建BrowserWindow的时候，加上`sandbox: true`，可以开启sandbox。
```
webPreferences: {
    sandbox: true
}
```
