# IPSC Training App 构建指南

## 环境要求

### 1. 安装 Java JDK 11

下载地址：https://adoptium.net/temurin/releases/?version=11

### 2. 安装 Android Studio（推荐）

下载地址：https://developer.android.com/studio

### 3. 手动安装（可选）

#### 安装 Android SDK
- 下载 SDK Tools: https://developer.android.com/studio#command-tools
- 解压到 `C:\Android\cmdline-tools`

#### 设置环境变量

```cmd
setx JAVA_HOME "C:\Program Files\Eclipse Adoptium\jdk-11.x.x.x-hotspot"
setx ANDROID_HOME "C:\Android"
setx PATH "%PATH%;%ANDROID_HOME%\platform-tools;%ANDROID_HOME%\build-tools\34.0.0"
```

## 构建步骤

### 方法一：使用 Android Studio

1. 打开 Android Studio
2. 选择 "Open an existing Android Studio project"
3. 选择 `d:\trae\ble ipsc\app\android` 目录
4. 等待 Gradle 同步完成
5. 点击 Build > Build Bundle(s) / APK(s) > Build APK(s)

### 方法二：使用命令行

```cmd
cd d:\trae\ble ipsc\app

mkdir www
copy index.html www\index.html

cd android
gradlew assembleRelease
```

### 方法三：使用构建脚本

```cmd
cd d:\trae\ble ipsc\app
build.cmd
```

## 构建产物

```
android/app/build/outputs/apk/release/app-release.apk
```

## 安装到手机

```cmd
adb install android/app/build/outputs/apk/release/app-release.apk
```

## 常见问题

### Gradle 下载慢
在 `gradle-wrapper.properties` 中修改为国内镜像：
```
distributionUrl=https\://mirrors.cloud.tencent.com/gradle/gradle-8.2-all.zip
```

### 缺少 SDK 版本
在 Android Studio 中打开 SDK Manager，安装所需版本。

## 手动安装依赖命令

```cmd
# 安装 SDK Build Tools
sdkmanager "build-tools;34.0.0"

# 安装 SDK Platform
sdkmanager "platforms;android-34"

# 安装其他组件
sdkmanager "extras;android;m2repository"
```
