#!/usr/bin/env bash
#
# 快速预览已构建的 Web 版（启动一个静态 HTTP 服务器）。
#
# 用法（在服务器上）：
#   bash scripts/serve_web.sh          # 默认 8080 端口，监听 0.0.0.0
#   bash scripts/serve_web.sh 3000     # 自定义端口
#
# 注意：这只是临时预览，正式环境请用 Nginx（见 deploy/nginx.conf）。
#
set -euo pipefail

cd "$(dirname "$0")/.."
PORT="${1:-8080}"

if [ ! -d build/web ]; then
  echo "❌ build/web 不存在。请先构建："
  echo "   flutter build web --release"
  exit 1
fi

cd build/web
echo "=========================================="
echo "  Serving $(pwd)"
echo "  http://0.0.0.0:${PORT}"
echo "  外网访问: http://<服务器公网IP>:${PORT}"
echo "  (记得在安全组/防火墙放行 ${PORT} 端口)"
echo "=========================================="
python3 -m http.server "$PORT" --bind 0.0.0.0
