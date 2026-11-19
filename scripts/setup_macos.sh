#!/usr/bin/env bash
#
# MandarinGo · macOS 一键环境安装脚本
# ============================================================
# 用途：让另一台 Mac 准备好运行/构建 MandarinGo（iOS + Android）。
#
# 用法：
#   bash setup_macos.sh
#
# 它会安装/检查：
#   Homebrew → Xcode 命令行工具 → Flutter(stable) → CocoaPods
#   → JDK → Android 命令行工具(+许可证) → flutter doctor
#
# 需要【手动】完成的两件事（脚本会提示，无需手输命令）：
#   1) 从 App Store 安装完整版 Xcode（跑 iOS 模拟器/真机需要）
#   2) 首次运行 flutter 前同意 Xcode 许可：sudo xcodebuild -license accept
#
# 作者可选的替代方案：Android 用 Android Studio（图形界面）更省事。
# ============================================================
set -uo pipefail

# ── 颜色输出 ──────────────────────────────────────────────────────
GREEN=$'\033[0;32m'; YELLOW=$'\033[0;33m'; CYAN=$'\033[0;36m'; RED=$'\033[0;31m'; NC=$'\033[0m'
info() { printf "${CYAN}==> %s${NC}\n" "$*"; }
ok()   { printf "${GREEN}    ✓ %s${NC}\n" "$*"; }
warn() { printf "${YELLOW}    ! %s${NC}\n" "$*"; }
fail() { printf "${RED}    ✗ %s${NC}\n" "$*"; }
have() { command -v "$1" >/dev/null 2>&1; }

# ── 判断 Apple Silicon / Intel ─────────────────────────────────────
ARCH="$(uname -m)"
if [ "$ARCH" = "arm64" ]; then BREW_PREFIX="/opt/homebrew"; else BREW_PREFIX="/usr/local"; fi

# ── 1/7 Homebrew ──────────────────────────────────────────────────
info "1/7 检查 Homebrew"
if have brew; then
  ok "Homebrew 已安装"
else
  info "正在安装 Homebrew（需网络，可能几分钟）..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
    || { fail "Homebrew 安装失败，请检查网络后重试。"; exit 1; }
  ok "Homebrew 安装完成"
fi
# 让当前脚本立刻能识别 brew（刚安装时）
[ -f "$BREW_PREFIX/bin/brew" ] && ! have brew && eval "$("$BREW_PREFIX/bin/brew" shellenv)"

# ── 2/7 Xcode 命令行工具 ───────────────────────────────────────────
info "2/7 检查 Xcode 命令行工具"
if xcode-select -p >/dev/null 2>&1; then
  ok "Xcode 命令行工具已安装"
else
  warn "未检测到，正在弹出安装窗口（请在弹窗里点“安装”）..."
  xcode-select --install
  warn "安装完成后请重新运行本脚本。"
  exit 0
fi

# ── 3/7 Flutter SDK ────────────────────────────────────────────────
info "3/7 检查 Flutter"
FLUTTER_DIR="$HOME/development/flutter"
if have flutter; then
  ok "Flutter 已安装"
else
  if [ -d "$FLUTTER_DIR/bin" ]; then
    export PATH="$FLUTTER_DIR/bin:$PATH"
    ok "已找到本机 Flutter：$FLUTTER_DIR"
  else
    info "正在下载 Flutter (stable)（可能几分钟）..."
    git clone -b stable https://github.com/flutter/flutter.git "$FLUTTER_DIR" \
      || { fail "Flutter 下载失败，请检查网络后重试。"; exit 1; }
    export PATH="$FLUTTER_DIR/bin:$PATH"
    ok "Flutter 下载完成"
  fi
  # 写入 shell 配置，让以后每次打开终端都能用
  for RC in "$HOME/.zshrc" "$HOME/.zprofile"; do
    grep -q "$FLUTTER_DIR/bin" "$RC" 2>/dev/null || echo "export PATH=\"\$PATH:$FLUTTER_DIR/bin\"" >> "$RC"
  done
  ok "已把 flutter 写入 PATH（~/.zshrc）"
fi

# ── 4/7 CocoaPods ──────────────────────────────────────────────────
info "4/7 检查 CocoaPods"
if have pod; then
  ok "CocoaPods 已安装"
else
  info "正在安装 CocoaPods..."
  brew install cocoapods || fail "CocoaPods 安装失败，可手动：brew install cocoapods"
  ok "CocoaPods 安装完成"
fi

# ── 5/7 JDK（Android 构建需要）─────────────────────────────────────
info "5/7 检查 Java (JDK)"
if java -version >/dev/null 2>&1; then
  ok "Java 已安装"
else
  info "正在安装 JDK (Temurin)..."
  brew install --cask temurin || fail "JDK 安装失败，可手动：brew install --cask temurin"
  ok "JDK 安装完成"
fi

# ── 6/7 Android SDK（命令行工具 + 许可证）──────────────────────────
info "6/7 检查 Android SDK"
ANDROID_SDK_ROOT="${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}"
export ANDROID_SDK_ROOT ANDROID_HOME="$ANDROID_SDK_ROOT"
mkdir -p "$ANDROID_SDK_ROOT"

if ! have sdkmanager; then
  info "正在安装 Android 命令行工具 (cmdline-tools)..."
  brew install --cask android-commandlinetools || warn "命令行工具安装失败，稍后可用 Android Studio 代替"
  # 探测 sdkmanager 的安装位置
  for CT in \
    "$BREW_PREFIX/share/android-commandlinetools/cmdline-tools/latest/bin" \
    "$BREW_PREFIX/share/android-commandlinetools/cmdline-tools/bin" \
    "$BREW_PREFIX/Caskroom/android-commandlinetools"; do
    [ -d "$CT" ] && export PATH="$CT:$PATH"
  done
fi

if have sdkmanager; then
  info "接受 Android 许可证..."
  yes | sdkmanager --sdk_root="$ANDROID_SDK_ROOT" --licenses >/dev/null 2>&1 || true
  info "安装 platform-tools（adb 等）..."
  sdkmanager --sdk_root="$ANDROID_SDK_ROOT" "platform-tools" >/dev/null 2>&1 || true
  ok "Android SDK 基础就绪（其余组件会在首次构建时自动下载）"
else
  warn "未找到 sdkmanager，Android 构建请改用 Android Studio："
  warn "  brew install --cask android-studio"
  warn "  打开一次 Android Studio 完成首次向导，再运行 flutter doctor --android-licenses"
fi

# ── 7/7 收尾 ───────────────────────────────────────────────────────
info "7/7 运行 flutter doctor 检查"
flutter doctor

echo
info "环境搭建完成！获取代码并运行："
echo "  1) 拿到项目代码：git clone <仓库地址> 或直接拷贝文件夹"
echo "  2) cd mandarin_learning_tool   # 进入项目目录"
echo "  3) flutter pub get"
echo "  4) flutter run                 # 或 flutter run -d ios / -d android"
echo
warn "提醒：跑 iOS 需要从 App Store 安装完整版 Xcode，"
warn "      并执行一次：sudo xcodebuild -license accept"
