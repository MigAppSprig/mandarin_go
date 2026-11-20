#!/usr/bin/env bash
#
# 以固定端口启动 Web 开发版（默认 8080）
#
# 用法：
#   bash scripts/run_web.sh          # 使用默认端口 8080
#   bash scripts/run_web.sh 9090     # 使用自定义端口 9090
#
set -euo pipefail

cd "$(dirname "$0")/.."
PORT="${1:-8080}"

echo "==> flutter pub get"
flutter pub get

echo "==> flutter run -d chrome --web-port ${PORT}"
echo "    浏览器访问：http://localhost:${PORT}"
flutter run -d chrome --web-port "$PORT"
