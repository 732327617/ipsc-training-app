# 🚀 IPSC Training App - 自动构建方案

## 概述

本项目已配置 GitHub Actions 自动构建流程，每次代码推送时自动构建 APK 文件。

## 📋 快速开始

### 步骤 1: 创建 GitHub 仓库

1. 访问 https://github.com/new
2. 创建一个新的空仓库（Public 或 Private）
3. 仓库名建议：`ipsc-training-app`

### 步骤 2: 上传代码

```bash
# 进入项目目录
cd d:\trae\ble ipsc\app

# 初始化 Git
git init
git add .
git commit -m "Initial commit"

# 添加远程仓库（替换为你的仓库地址）
git remote add origin https://github.com/your-username/ipsc-training-app.git
git branch -M main
git push -u origin main
```

### 步骤 3: 触发构建

GitHub Actions 会自动触发构建：

| 触发条件 | 说明 |
|---------|------|
| `git push` | 每次推送到 main 分支自动构建 |
| 创建标签 | 创建 `v1.0.0` 格式的标签自动创建 Release |
| 手动触发 | 在 Actions 页面手动运行工作流 |

## 📥 下载 APK

### 方式 1: 从 Actions 页面下载

1. 进入仓库的 **Actions** 标签页
2. 选择最新的工作流运行
3. 在页面底部 **Artifacts** 中下载 `ipsc-training-apk`

### 方式 2: 从 Release 页面下载

当创建版本标签时，APK 会自动上传到 Release 页面：

```bash
# 创建版本标签并推送
git tag v1.0.0
git push origin v1.0.0
```

然后访问 https://github.com/your-username/ipsc-training-app/releases

## ⚙️ 工作流配置说明

### 触发条件

```yaml
on:
  push:
    branches: [ main ]      # 推送代码时触发
  pull_request:
    branches: [ main ]      # PR 时触发
  workflow_dispatch:        # 手动触发
    inputs:
      release:              # 是否创建 Release
        description: 'Create a release'
        required: false
        default: 'false'
```

### 构建步骤

1. **检出代码** → 拉取最新代码
2. **设置 JDK 11** → 配置 Java 环境
3. **设置 Android SDK** → 安装 Android 构建工具
4. **获取版本号** → 从 package.json 读取版本
5. **创建 www 目录** → 复制前端文件
6. **构建 APK** → 运行 `gradlew assembleRelease`
7. **上传产物** → 保存 APK 作为构建产物
8. **创建 Release** → 自动发布新版本（可选）

### 版本管理

版本号从 `package.json` 的 `version` 字段读取：

```json
{
  "name": "ipsc-controller",
  "version": "1.0.0",
  ...
}
```

## 🛠 手动触发构建

1. 进入仓库的 **Actions** 页面
2. 选择 **Build Android APK** 工作流
3. 点击 **Run workflow**
4. 可选：勾选 "Create a release" 创建 Release

## 📊 工作流状态

| 状态 | 图标 | 说明 |
|-----|------|------|
| 成功 | ✅ | 构建成功，APK 已生成 |
| 失败 | ❌ | 构建失败，查看日志排查 |
| 进行中 | 🟡 | 正在构建中 |

## 🔍 常见问题排查

### 构建失败

1. **查看日志**：进入 Actions → 点击失败的运行 → 查看详细日志
2. **常见错误**：
   - `SDK not found` → 检查 Android SDK 版本配置
   - `Java version mismatch` → 确保使用 JDK 11
   - `Permission denied` → 检查文件权限

### 构建时间过长

- 首次构建需要下载 Gradle 和 SDK，时间较长
- 后续构建会使用缓存，速度更快

## 🔄 CI/CD 流程

```
开发者推送代码 → GitHub Actions 触发 → 自动构建 APK → 上传产物 → 可选创建 Release
     ↓
用户下载 APK → 安装到手机 → 开始使用
```

## 📝 更新版本

```bash
# 修改 package.json 中的版本号
# 然后提交并推送
git commit -m "Bump version to 1.0.1"
git push

# 可选：创建版本标签
git tag v1.0.1
git push origin v1.0.1
```

## 📱 安装到手机

```bash
# 使用 ADB 安装
adb install ipsc-training-v1.0.0.apk

# 或直接在手机上点击 APK 文件安装
```

## 🎉 完成！

现在你已经拥有了一个完整的自动构建流程：
- ✅ 代码推送到 GitHub 自动构建
- ✅ 构建产物自动保存
- ✅ 版本标签自动创建 Release
- ✅ 一键下载 APK 文件
