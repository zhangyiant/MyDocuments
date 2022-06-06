# 使用TypeScript开发electron应用
## 首先创建nodejs项目
```
npm init -y
```
![npm init](./images/npm-init.png)

## 接着安装electron/TypeScript
```
npm install --save-dev electron
npm install --save-dev typescript
```
![npm install](./images/npm-install.png)

## 初始化TypeScript配置
```
npx tsc --init
```
然后修改一下`rootDir/outDir`配置，个人习惯，把代码放在`src/`目录，编译结果放在`dist/`目录。

## 最后修改一下package.json

`main`属性配置到`dist`目录下面，
添加`build`和`start`脚本。
```
{
  ...
  "main": "./dist/index.js",
  "scripts": {
    "build": "tsc",
    "start": "npm run build && electron ."
  },
  ...
}
```

## 开始代码

添加`src/index.ts`。
```
import { app, BrowserWindow } from 'electron';
import * as path from 'path';

function createWindow() {
    const win: BrowserWindow = new BrowserWindow(
        {
            webPreferences: {
                preload: path.join(__dirname, "preload.js")
            }
        }
    );
    win.loadFile("index.html");
}

app.whenReady().then(() => {
    createWindow();
    app.on('activate', () => {
        if (BrowserWindow.getAllWindows().length === 0) {
            createWindow();
        }
    })
});

app.on("window-all-closed", () => {
    if (process.platform !== 'darwin') {
        app.quit();
    }
});
```
![src/index.ts](./images/index-ts.png)

添加空文件`src/preload.ts`。 我暂时不用这个文件。
添加`index.html`。简单打印一个**Hello World**。
```
<html>
    <head>
        <title>Hello World</title>
    </head>
    <body>
        <h1>Hello World</h1>
    </body>
</html>
```

![index.html](./images/index-html.png)

## 运行代码

```
npm start
```

![npm start](./images/npm-start.png)

就能显示Hello World窗口了。
![Hello World Window](./images/helloworld.png)

