# IPSC Training App

IPSC射击训练控制器 - Android应用

## 项目结构

```
app/
├── index.html          # 主页面
├── package.json        # 项目配置
├── capacitor.config.json # Capacitor配置
├── build.cmd           # 构建脚本
└── android/            # Android原生项目
    ├── build.gradle
    ├── gradle/
    └── app/
        └── src/main/
            ├── AndroidManifest.xml
            ├── java/com/example/ipsc/MainActivity.java
            └── res/
```

## 构建APK

### 方法一：使用构建脚本

```cmd
build.cmd
```

### 方法二：手动构建

```cmd
# 创建www目录
mkdir www
copy index.html www\index.html

# 进入Android目录构建
cd android
gradlew assembleRelease
```

### 构建产物

APK文件位于：
```
android/app/build/outputs/apk/release/app-release.apk
```

## 安装到手机

```cmd
# 使用ADB安装
adb install android/app/build/outputs/apk/release/app-release.apk
```

## 硬件要求

- Android 6.0 (API level 23) 或更高版本
- 支持蓝牙BLE

## 权限

应用需要以下权限：
- BLUETOOTH_SCAN - 扫描蓝牙设备
- BLUETOOTH_CONNECT - 连接蓝牙设备
- ACCESS_FINE_LOCATION - 蓝牙扫描需要

## 使用说明

1. 安装APK到手机
2. 打开应用
3. 点击"连接靶子"按钮
4. 选择IPSC_Slave设备
5. 设置靶子数量和游戏模式
6. 点击"开始游戏"开始训练

## 游戏模式

- **顺序射击**：按顺序击中每个靶子
- **自由射击**：任意顺序击中靶子

## 技术栈

- HTML5 + CSS3 + JavaScript
- Android WebView
- Web Bluetooth API

## 注意事项

1. 首次打开应用需要授予蓝牙权限
2. 确保手机蓝牙已开启
3. ESP32-C3设备需要运行ipsc_slave.ino代码
