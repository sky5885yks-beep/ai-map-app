# AI 地图 · 安卓 App

把两个网站的内容做成**离线可看的原生卡片 App**：

- 中文 AI 创作者地图（`37lfc0vis820xyiwbbv.traesite.cn`）
- AI Handbook 导航地图（`37lf4zrsvx0csetmpgj.traesite.cn`）

数据来自两站 2026-11-23 的快照，已内置进 App，**不联网也能浏览**；点任意卡片/入口会跳转到原始网页。

> 当前版本：V1（分类浏览 + 外部链接跳转）。搜索、收藏、夜间模式按规划留到 V2/V3。

---

## 一、项目结构

```
ai_map_app/
├── lib/
│   ├── main.dart                       # App 入口
│   ├── utils.dart                      # 主题配色 + 打开外部链接
│   ├── models/models.dart              # 数据模型
│   ├── data/
│   │   ├── data_repository.dart        # 数据仓库（对外提供数据）
│   │   ├── creators_data.dart          # 16 位创作者（自动生成）
│   │   └── handbooks_data.dart         # 34 个手册仓库（自动生成）
│   └── screens/
│       ├── home_screen.dart            # 首页（两个入口）
│       ├── creators_screen.dart        # 创作者列表 + 分类筛选
│       ├── creator_detail_screen.dart  # 创作者详情 + 主页入口
│       └── handbooks_screen.dart       # 手册地图 + 分区筛选
├── android/                            # Android 原生工程配置
│   ├── app/build.gradle                # 签名 + 版本配置
│   ├── app/src/main/AndroidManifest.xml
│   ├── key.properties.example          # 签名配置模板
│   └── ...
└── pubspec.yaml                        # Flutter 依赖
```

> 说明：`lib/data/*.dart` 是从网站数据自动生成的，不要手动改；要更新内容就重新生成这两个文件。

---

## 二、环境准备（一次性，Windows）

### 1. 安装 Flutter SDK

1. 到 Flutter 官网下载 Windows 稳定版 SDK（`.zip`），解压到**不带空格和中文**的路径，例如 `C:\src\flutter`。
2. 把 `C:\src\flutter\bin` 加入系统环境变量 `Path`。
3. 打开一个新的 PowerShell / 终端，验证：

```powershell
flutter --version
flutter doctor
```

> `flutter doctor` 会列出还缺什么，按提示补。

### 2. 安装 Android Studio

1. 安装 Android Studio（自带 Android SDK）。
2. 首次启动时按向导安装 **Android SDK** 和 **Android SDK Command-line Tools**。
3. 记住 SDK 路径（默认类似 `C:\Users\你的用户名\AppData\Local\Android\Sdk`）。

### 3. 配置环境变量

新增系统环境变量：

```
ANDROID_HOME = C:\Users\你的用户名\AppData\Local\Android\Sdk
```

把以下两个路径也加进 `Path`：

```
%ANDROID_HOME%\platform-tools
%ANDROID_HOME%\cmdline-tools\latest\bin
```

再跑一次 `flutter doctor`，确保 Android 那几项都打勾。

### 4. 同意 Android 许可

```powershell
flutter doctor --android-licenses
```

一路输入 `y` 回车即可。

---

## 三、补齐 Android 脚手架（重要！）

本项目手工编写了核心的 Dart 代码和 Android 配置，但**gradle wrapper 的二进制文件**（`gradlew.bat`、`gradle-wrapper.jar`）需要用 Flutter 自动生成。

在项目目录执行一次：

```powershell
cd C:\Users\sky58\WorkBuddy\2026-11-24-20-50-01\ai_map_app
flutter create --platforms=android .
```

> 这条命令会补齐缺失的 Android 脚手架文件，**不会覆盖**已写好的 `lib/` 代码和 `pubspec.yaml`。

然后拉取依赖：

```powershell
flutter pub get
```

---

## 四、真机运行测试

1. 手机开启「开发者选项」和「USB 调试」，用数据线连电脑。
2. 确认设备已连接：

```powershell
flutter devices
```

3. 运行：

```powershell
flutter run
```

> 首次编译较慢（要下载 Gradle 和依赖），耐心等。手机会弹出「是否允许 USB 调试」，点允许。

---

## 五、打包 APK

### 方式 A：先出一个测试包（debug，无需签名）

```powershell
flutter build apk --debug
```

产物在：`build\app\outputs\flutter-apk\app-debug.apk`
直接发到手机安装即可（部分手机需在设置里允许「安装未知来源应用」）。

### 方式 B：打正式包（release，需要签名）

**第 1 步：生成签名密钥（只需一次）**

用 keytool（装了 JDK 就有）：

```powershell
keytool -genkey -v -keystore C:\keys\ai-map.jks -keyalg RSA -keysize 2048 -validity 10000 -alias ai-map
```

按提示设置密码和填写信息（密码要记住）。

**第 2 步：配置签名**

把 `android\key.properties.example` 复制为 `android\key.properties`，按实际情况填写：

```properties
storeFile=C:/keys/ai-map.jks
storePassword=你的keystore密码
keyAlias=ai-map
keyPassword=你的key密码
```

> Windows 路径用正斜杠 `/` 或双反斜杠 `\\`。这个文件已被 `.gitignore` 排除，不会泄露。

**第 3 步：打包**

```powershell
flutter build apk --release
```

产物在：`build\app\outputs\flutter-apk\app-release.apk`

如需按 CPU 架构拆分出更小的包：

```powershell
flutter build apk --release --split-per-abi
```

会生成 `app-armeabi-v7a-release.apk`、`app-arm64-v8a-release.apk`、`app-x86_64-release.apk`，手机一般装 `arm64-v8a` 那个。

---

## 六、高频报错排查

| 报错 | 原因 | 解决 |
|---|---|---|
| `cmdline-tools component is missing` | 没装 Android 命令行工具 | Android Studio → SDK Manager → SDK Tools → 勾选 Android SDK Command-line Tools → Apply |
| `Gradle build failed` / 卡在下载 | 网络或缓存问题 | 先 `flutter clean`，再 `flutter pub get`，重新 build；或配置国内 Maven 镜像 |
| `CocoaPods not installed` | iOS 才需要，安卓可忽略 | 安卓打包不用管 |
| `Execution failed for task ':app:signingConfig'` | 签名配置错误 | 检查 `key.properties` 路径和密码；路径用正斜杠 |
| `minSdkVersion` 相关冲突 | 插件要求更高版本 | 本项目 `minSdkVersion 21`，一般够用；如报错按提示提高 |
| `Could not resolve` 依赖下载失败 | 网络问题 | 检查代理/VPN；或用 `flutter pub get --verbose` 看具体卡在哪个源 |
| 手机装不上 APK | 未知来源被禁 | 手机设置 → 安全 → 允许安装未知来源应用 |
| 打开链接没反应 | 未声明包可见性 | 已在 `AndroidManifest.xml` 的 `<queries>` 里声明 https，正常不会遇到 |

---

## 七、边界说明

- 本项目**只做安卓本地打包**，不涉及应用商店上架、资质审核。
- 数据是 2026-11-23 的**静态快照**，网站内容更新后 App 不会自动变；V3 规划里会做联网自动更新。
- 安卓 APK 可直接安装；iOS（IPA）不在本次范围内（如后续要做，需苹果开发者账号或 TestFlight）。

---

## 八、更新内置数据（可选）

若两个网站的.json数据有更新，重新运行数据生成脚本，覆盖 `lib/data/creators_data.dart` 和 `lib/data/handbooks_data.dart` 即可，UI 代码无需改动。
