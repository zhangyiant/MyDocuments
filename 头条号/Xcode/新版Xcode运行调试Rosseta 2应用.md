# 新版Xcode运行调试Rosseta 2应用

随着**Xcode 14.3**的推出，**Apple**公司放弃了**Xcode**运行在*Rosetta 2*环境的支持。
如果右键点击**Xcode**应用，可以发现`Open using Rosetta`的选项已经没有了。像**TextEdit**这样的应用里面还是保持了这个选项。

![Xcode Open using Rosetta](./images/XcodeRosetta2.png)

早期如果需要在*Apple Silicon(arm64)*的苹果电脑上调试*x86_64*的应用程序，确实需要让**Xcode**运行在*Rosetta 2*的环境下面。也不知道从哪个版本开始，**Xcode**已经不需要*Rosetta 2*就能正常调试运行在*Rosetta 2*环境下面的应用程序了。
这次苹果就彻底去除*Rosetta 2*的支持。

同时，苹果默认隐藏了运行调试*Rosetta 2*的选项，这里启动了一个*HelloWorld*程序，设置编译成*x86_64*指令的程序。

![No Devices](./images/XcodeNoDevices.png)

可以看到Xcode显示`No eligible devices connected`。

如果点击运行，则会提示出错。

![Build Only Error](./images/XcodeBuildOnly.png)

只要选择菜单`Production -> Destination -> Destination Architectures -> Show Both`，就可以重新打开调试*Rosetta 2*程序的选项。

![Show Both](./images/XcodeDestinationShowBoth.png)

打开这个选项之后，就可以看到*Rosetta 2*的运行环境。

![Rosetta 2](./images/XcodeRunOnRosetta2.png)

这个时候就能正常的运行和调试了。