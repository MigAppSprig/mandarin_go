# MandarinGo · 学中文

一个面向英语使用者的中文学习 App，使用 **Flutter + Dart** 开发，同时兼容 **iOS 和 Android**。

内置拼音基础、词卡（闪卡）、日常对话、英译中翻译等核心学习功能。学习内容离线可用，翻译支持**离线词典 + 在线整句翻译**两种方式；拼音声母/韵母发音采用**内置音频**（47 个离线音素），其余中文发音通过系统 TTS 引擎（`zh-CN` 语音）实现。

---

## ✨ 功能一览

| 板块 | 说明 |
|------|------|
| **首页 (Home)** | 每日一词、学习进度、快捷入口 |
| **拼音基础 (Pinyin)** | 四个声调（+ 轻声）、23 个声母、24 个韵母、变调规则，音节按声调着色；附「拼音总表」一页看全，音素支持离线单独发音 |
| **拼音练习 (Tone Practice)** | 听/看一个音节，判断它的声调（1/2/3/4/轻声），即时反馈 + 计分 |
| **词卡 (Flashcards)** | HSK1–3 级 350+ 词，按分类成组，翻转卡片 + 简易间隔重复（Leitner 盒子） |
| **练习中心 (Practice)** | 可选 HSK 1 / 2 / 3 范围；拼音辨析（易混淆音）、听音写拼音、选词填空、声调识别、智能复习（针对薄弱词） |
| **对话 (Dialogues)** | 15 组真实场景对话（问候、自我介绍、点餐、购物、问路、时间、家庭、天气、爱好、机场、看病、酒店、打车、打电话、银行），逐句发音 |
| **翻译 (Translate)** | 英文 → 中文，给出汉字、带声调拼音、发音和例句；离线词典 + 在线整句翻译 |
| **设置 (Settings)** | 语速调节、重置学习进度 |

**交互亮点**

- 每个词条/例句旁都有 🔊 发音按钮，点按即读（`flutter_tts`）。
- 拼音以**声调颜色**显示（一声红、二声橙、三声绿、四声蓝、轻声灰），一眼看清声调。
- 闪卡中文 → 英文翻转，答对/答错都会记录进度并持久化。

---

## 🚀 快速开始

### 环境要求

- Flutter SDK（推荐 **stable 渠道 3.27+**）
- Xcode（运行 iOS）+ CocoaPods
- Android Studio / Android SDK + cmdline-tools（运行 Android）
- JDK（Android 构建需要）

检查环境：

```bash
flutter doctor
```

> 💡 **给另一台 Mac 的一键安装**：把 `scripts/setup_macos.sh` 拷给对方，执行 `bash setup_macos.sh` 即可自动安装 Homebrew、Flutter、CocoaPods、JDK、Android 命令行工具并接受许可证。详见下方「📦 其他人如何安装」。

### 运行

```bash
# 安装依赖
flutter pub get

# 启动（连接设备或模拟器后）
flutter run
# 或直接：
bash scripts/run.sh
```

分别在 iOS / Android 运行：

```bash
flutter run -d ios        # 需要 macOS + Xcode
flutter run -d android    # 需要 Android SDK / 模拟器
```

### 测试与检查

```bash
flutter analyze   # 静态检查（应输出 No issues found!）
flutter test      # 单元测试（应全部通过）
```

---

## 🌐 Web 版本

构建 Web 版：

```bash
flutter build web --release
# 产物在 build/web/
```

本地预览（Web 版需要 HTTP 服务器，不能直接双击 index.html）：

```bash
cd build/web && python3 -m http.server 8080
# 浏览器打开 http://localhost:8080
```

部署到 GitHub Pages：仓库已内置 `.github/workflows/deploy-pages.yml`，推送到 `main` 分支后会自动构建并发布到 `gh-pages` 分支；再到仓库 **Settings → Pages → Source** 选 `gh-pages` 分支即可。访问地址：`https://<用户名>.github.io/<仓库名>/`。

> 说明：Web 版发音依赖浏览器的语音合成（中文语音随系统/浏览器提供），音素音频用 HTML5 audio 播放。

---

## 📦 其他人如何安装（另一台 Mac）

给另一台同样用 Mac 的人，按顺序做两步：

### 第 1 步：装环境（一次性）

把仓库里的 `scripts/setup_macos.sh` 发给对方，在终端执行：

```bash
bash setup_macos.sh
```

脚本会自动完成：Homebrew → Xcode 命令行工具 → Flutter(stable) → CocoaPods → JDK → Android 命令行工具 + 许可证，最后跑一遍 `flutter doctor`。

脚本结束时会提示两件需要**手动**做的事：

1. 从 **App Store** 安装完整版 **Xcode**（跑 iOS 需要）；
2. 执行一次 `sudo xcodebuild -license accept` 同意许可。

### 第 2 步：拿到代码并运行

```bash
# 方式 A：从 Git 仓库克隆（如果你把项目推到了 GitHub/GitLab）
git clone <仓库地址>
cd mandarin_go

# 方式 B：直接把整个项目文件夹拷贝/发送给对方，然后：
cd mandarin_go

# 拉依赖 + 运行
flutter pub get
flutter run            # 或 bash scripts/run.sh
```

> 注意：脚本里装的是 **stable 渠道** Flutter（更稳定、便于分发）。项目的 `pubspec.yaml` 已把 SDK 约束放宽为 `>=3.4.0 <4.0.0`，稳定版可直接 `pub get`。

---

## 📁 项目结构

```
lib/
├── main.dart                      # 入口：初始化进度、TTS，注入 Provider
├── theme/app_theme.dart           # 中国风配色（朱红 + 金黄）+ 主题
├── models/                        # 数据模型
│   ├── vocabulary.dart            # Word（词条）
│   ├── pinyin.dart                # Tone / Initial / Final / SyllableExample
│   ├── dialogue.dart              # Dialogue / DialogueLine
│   └── translation.dart           # TranslationEntry（短语词典条目）
├── data/                          # 内容数据（可自行增删）
│   ├── vocabulary_data.dart       # 350+ 常用词（含拼音 + 例句）
│   ├── pinyin_data.dart           # 声调、声母、韵母、变调规则
│   ├── dialogue_data.dart         # 15 组对话
│   └── translation_data.dart      # 80+ 英译中短语
├── services/                      # 业务逻辑
│   ├── tts_service.dart           # 中文发音（flutter_tts 封装，语速可调）
│   ├── progress_controller.dart   # 学习进度 + 闪卡 SRS 状态（shared_preferences 持久化）
│   ├── translator.dart            # 离线英译中匹配（短语词典 + 词汇表）
│   ├── online_translator.dart     # 在线整句翻译（MyMemory API + pinyin 拼音转换）
│   ├── pinyin_audio_service.dart  # 音素离线音频播放（audioplayers，失败回退 TTS）
│   └── pinyin_utils.dart          # 声调识别 / 去除声调标记
├── screens/                       # 页面
│   ├── main_shell.dart            # 底部导航壳
│   ├── home_screen.dart           # 首页
│   ├── pinyin_*.dart              # 拼音总览 / 总表 / 声调 / 声母 / 韵母 / 规则 / 练习
│   ├── flashcards_*.dart          # 卡组选择 / 闪卡会话
│   ├── dialogues_screen.dart      # 对话列表
│   ├── dialogue_detail_screen.dart# 对话详情（逐句发音、可隐藏拼音/英文）
│   ├── translator_screen.dart     # 翻译页
│   ├── practice_screen.dart       # 练习中心（HSK 范围 + 多模式）
│   ├── pinyin_discrimination_screen.dart # 拼音辨析练习
│   ├── listen_write_screen.dart   # 听音写拼音练习
│   ├── fill_blank_screen.dart     # 选词填空练习
│   └── settings_screen.dart       # 设置
└── widgets/                       # 复用组件
    ├── speak_button.dart          # 发音按钮
    └── tone_colored_pinyin.dart   # 按声调着色的拼音文本
```

---

## 🔤 翻译是如何工作的

翻译采用 **离线词典 + 在线机器翻译** 的混合策略：

1. **离线词典**（优先）：`translation_data.dart` 的 80+ 常用短语 + `vocabulary_data.dart` 的 350+ 常用单词，带例句。`Translator.translate()` 对输入归一化后做精确匹配 → 包含匹配 → 单词重叠打分。
2. **在线整句翻译**（兜底）：当离线词典**没有精确匹配**时，调用 [MyMemory](https://mymemory.translated.net) 免费翻译 API（无需 key）把任意英文句子翻成中文，再用 `pinyin` 库本地生成带声调拼音，发音走系统 TTS。

这样：已知的常用短语走离线（更准确、有例句、无需联网），词典没收录的长句走在线（覆盖任意内容）。在线翻译会标注 "Machine translation — may be imperfect"。

> 想换成 Google Cloud / DeepL / 百度翻译等官方服务，只需改 `lib/services/online_translator.dart` 里的 `translate()` 网络请求即可，其余代码无需改动。Android 已加入 `INTERNET` 权限。

---

## 🗂️ 数据如何扩展

所有学习内容都是纯 Dart 常量列表，直接编辑对应文件即可增删：

- 加单词：在 `lib/data/vocabulary_data.dart` 的 `all` 列表里新增一个 `Word(...)`。
- 加对话：在 `lib/data/dialogue_data.dart` 里新增一个 `Dialogue(...)`。
- 加短语：在 `lib/data/translation_data.dart` 里新增一个 `TranslationEntry(...)`。

---

## 📱 平台说明

- **发音**：拼音声母/韵母用内置音频（`audioplayers` 播放，离线一致）；词汇、例句、对话、翻译用系统 TTS 的 `zh-CN` 语音（iOS/Android 均内置，缺失时在系统设置下载）。
- **权限**：TTS 为语音合成（非麦克风），无需额外权限。Android 已声明 `INTERNET` 权限（在线翻译用）；iOS 走 HTTPS，无需额外配置。
- **应用名称**：Android 显示为 `MandarinGo`，iOS 显示为 `Mandarin Go`。
- **应用图标**：目前使用 Flutter 默认图标，可用 `flutter_launcher_icons` 替换。

### 打包发布

```bash
flutter build apk --release          # Android APK
flutter build appbundle              # Android AAB（上架 Google Play）
flutter build ios --release          # iOS（需在 Xcode 里配置签名）
```

---

## 🛠️ 技术栈

- **框架**：Flutter（Material 3）
- **状态管理**：`provider`
- **本地存储**：`shared_preferences`
- **发音**：`flutter_tts`（词/句）+ `audioplayers`（音素音频）
- **在线翻译**：`http`（MyMemory API）
- **拼音转换**：`pinyin`
