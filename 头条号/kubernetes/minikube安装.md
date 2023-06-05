# minikube安装

*minikube*用于开发环境，学习和测试*kubernetes*。

*macOS*可以使用*brew*进行安装。

```
brew install minikube
```

运行*minikube*

```
minikube start
```

如果运行失败，可以看一下有没有安装*Docker Desktop*。*minikube*支持的驱动可以在https://minikube.sigs.k8s.io/docs/drivers/找到。建议使用*Docker Desktop*。

关闭*minikube*

```
minikube stop
```

查看*minikube*状态

```
minikube status
```
