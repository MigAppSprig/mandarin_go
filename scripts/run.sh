#!/usr/bin/env bash
#
# 拉取依赖并运行 MandarinGo（在项目根目录执行，或任意位置执行皆可）
#
# 用法：
#   bash scripts/run.sh               # 自动选择已连接的设备
#   bash scripts/run.sh -d ios        # 指定 iOS
#   bash scripts/run.sh -d android    # 指定 Android
#
set -euo pipefail

cd "$(dirname "$0")/.."

echo "==> flutter pub get"
flutter pub get

echo "==> flutter run $*"
flutter run "$@"
