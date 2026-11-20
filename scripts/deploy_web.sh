#!/usr/bin/env bash
#
# 构建 Web 版并上传到服务器（用 rsync）。
#
# 用法：
#   bash scripts/deploy_web.sh user@your-server:/var/www/mandarin_go
#
# 说明：
#   - 需要本机能 SSH 登录服务器（建议先配好 SSH key）。
#   - 部署的是 Flutter 静态文件，服务器上用 Nginx 托管即可（见 deploy/nginx.conf）。
#   - 上传后记得在服务器安全组/防火墙放行 80、443 端口。
#
set -euo pipefail

cd "$(dirname "$0")/.."

TARGET="${1:-}"
if [ -z "$TARGET" ]; then
  echo "用法: bash scripts/deploy_web.sh user@your-server:/var/www/mandarin_go"
  exit 1
fi

# 若是根路径部署，用 /；若部署在子路径（如 /app/），改成对应值
BASE_HREF="${2:-/}"

echo "==> flutter build web --release --base-href ${BASE_HREF}"
flutter build web --release --base-href "$BASE_HREF"

echo "==> rsync build/web/ → ${TARGET}"
rsync -avz --delete build/web/ "$TARGET/"

echo
echo "✅ 上传完成。接下来在服务器上："
echo "   1) 确保 Nginx 的 root 指向该目录（参考 deploy/nginx.conf）"
echo "   2) sudo nginx -t && sudo systemctl reload nginx"
echo "   3) 放行防火墙/安全组 80、443 端口"
echo "   4) 浏览器访问 http://<服务器公网IP>/"
